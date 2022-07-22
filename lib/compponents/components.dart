import 'package:flutter/material.dart';
import 'dart:html' as html;


Widget headerLogoText({required String title}) {
  var appbarHeight = AppBar().preferredSize.height;
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => html.window.location.reload(),
      child: Container(
        height: appbarHeight,
        child: Center(
            child: Text(
              "TESLA",
              style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
            )),
      ),
    ),
  );
}


class headerElement extends StatefulWidget {
  final String title;
  void Function()? onTapped;
  // Color backgroundColor = Colors.transparent;
  headerElement({
    Key? key,
    required this.title,
    this.onTapped
    // required this.backgroundColor,
  }) : super(key: key);

  @override
  State<headerElement> createState() => _headerElementState();
}

class _headerElementState extends State<headerElement> {

  Color backgroundColor = Colors.transparent;
  double x = 0.0;
  double y = 0.0;

  void _onHover(PointerEvent details) {
    setState(() {
      backgroundColor = Colors.black12;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  void _exitHover(PointerEvent details) {
    setState(() {
      backgroundColor = Colors.transparent;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: _onHover,
      onExit: _exitHover,
      child : GestureDetector(
        onTap: widget.onTapped,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(widget.title,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
          )),
        ),
      ),
    );
  }
}


class scrollItem extends StatefulWidget {
  final String image;
  final String name;
  final bool subTitle;
  final String subtitle;
  final String Button1;
  final String Button2;
  scrollItem({
    Key? key,
    required this.image,
    required this.name,
    required this.subTitle,
    required this.subtitle,
    required this.Button1,
    required this.Button2,
  }) : super(key: key);

  @override
  State<scrollItem> createState() => _scrollItemState();
}

class _scrollItemState extends State<scrollItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  widget.image,
                ),
                fit: BoxFit.cover),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100,),
              child: Column(
                children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        wordSpacing: 2,
                      ),
                    ),
                  if(widget.subTitle)
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 2
                      ),
                    ),
                  if(widget.subTitle == false)
                    RichText(
                      text: TextSpan(
                        text: 'このモデルはCEV補助金65万円の対象車両です。',
                        style: TextStyle(
                            wordSpacing: 2,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: '詳細はこちら',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  wordSpacing: 2,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                color : Colors.black,
                              ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.66,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Buttons(TextColor: Colors.white, title:widget.Button1 , BackgroundColor: Colors.black, height: 40, width: 250,),
                        SizedBox(width: 20),
                        Buttons(TextColor: Colors.black, title: widget.Button2, BackgroundColor: Colors.white, height: 40, width: 250 ,),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class Buttons extends StatelessWidget {
  final String title;
  final Color TextColor;
  final Color BackgroundColor;
  final  height;
  final  width;
  const Buttons({
    Key? key,
    required this.title,
    required this.TextColor,
    required this.BackgroundColor,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: BackgroundColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: TextColor,
                fontSize: 13,
                fontWeight: FontWeight.bold
              ),
            )),
      ),
    );
  }
}

// Widget kListTile({required String title}) {
//   return ListTile(
//       title: Container(
//         height: 40,
//         alignment: Alignment.centerLeft,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//           child: Text(title),
//       ),
//       onTap: () {},
//   );
// }

class kListTile extends StatefulWidget {
  final String title;
  kListTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<kListTile> createState() => _kListTileState();
}

class _kListTileState extends State<kListTile> {

  Color backgroundColor = Colors.transparent;
  double x = 0.0;
  double y = 0.0;

  void _onHover(PointerEvent details) {
    setState(() {
      backgroundColor = Colors.black12;
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  void _exitHover(PointerEvent details) {
    setState(() {
      backgroundColor = Colors.transparent;
    });
  }



  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: _onHover,
      onExit: _exitHover,
      child : Container(
        height: 32,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(widget.title,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}