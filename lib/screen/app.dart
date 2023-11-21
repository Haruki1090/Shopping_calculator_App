import 'package:flutter/material.dart';
import 'package:value_calculator/screen/valueCalculator.dart';

import 'discountCalculator.dart';

//主に bottomNavigationBar のための関数

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Shopping calculator App',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


//ここから bottomNavigationBar の関数
class _MyHomePageState extends State<MyHomePage> {

  //screens　を区別する配列
  static const _screens= [
    valueCalculator(),
    discountCalculator(),
  ];

  //初期値
  int _selectedIndex = 0;

  //onTap された時にその index を新しい変数 _selectedIndex として格納する
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //＜body＞
      //_selectedIndex で格納された配列番号に相当するアイテムが
      // _screens から返されて関数として中身が起動する
    body:_screens[_selectedIndex],

    //Bottom Navigation Bar
    bottomNavigationBar: BottomNavigationBar(

    //currentIndex で現在選択されている index を示す
    currentIndex: _selectedIndex,

    //onTap でタブがタップされた時に currentIndex を更新する
    //選択されたタブの内容は currentIndex を参照して表示される
    onTap: _onItemTapped,

    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.repeat_one_outlined), label: '単価お得計算機'),
    BottomNavigationBarItem(icon: Icon(Icons.trending_down), label: '割引計算機'),
    ],

    //ページが切り替わってもデータを受け渡し固定する
    type: BottomNavigationBarType.fixed,
    )
    );
  }
}