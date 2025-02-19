import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tesla_website/compponents/components.dart';

import 'compponents/scrollItems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hoverColor: Colors.black12,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    int _currentIndex = 0;

    return Scaffold(
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                ),
              ),
              SizedBox(height: deviceSize.height * 0.02),
              kListTile(title: "在庫車"),
              kListTile(title: "認定中古車"),
              kListTile(title: "下取り"),
              kListTile(title: "試乗を予約する"),
              kListTile(title: "Roadster"),
              kListTile(title: "商業・産業用　エネルギーシステム"),
              kListTile(title: "電力系統用　エネルギーシステム"),
              kListTile(title: "Energy"),
              kListTile(title: "コーポレートセールス"),
              kListTile(title: "充電"),
              kListTile(title: "アクセス"),
              kListTile(title: "サポート情報"),
              kListTile(title: "投資家情報"),
              kListTile(title: "🌐　日本語"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 120,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: headerLogoText(title: 'TESLA'),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.grey,
        title: Container(
          width: 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              headerElement(title: 'Model S'),
              headerElement(title: 'Model 3'),
              headerElement(title: 'Model X'),
              headerElement(title: 'Model Y'),
              headerElement(title: 'Cybertruck'),
              headerElement(title: 'Powerwall'),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Container(
              width: 280,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  headerElement(title: 'ショップ'),
                  headerElement(title: 'アカウント'),
                  Builder(
                    builder: (context) => headerElement(
                        title: 'メニュー',
                        onTapped: () => Scaffold.of(context).openEndDrawer()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      endDrawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Scrollbar(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: deviceSize.height,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.vertical,
                  autoPlay: false,
                  reverse: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: scrollItemList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return card;
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
