import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class valueCalculator extends StatefulWidget {
  const valueCalculator({super.key});

  @override
  State<valueCalculator> createState() => _valueCalculatorState();
}

class _valueCalculatorState extends State<valueCalculator> {
  final _shohinkakaku1 = TextEditingController();

  final _shohinkakaku2 = TextEditingController();

  final _youryo1 = TextEditingController();

  final _youryo2 = TextEditingController();

  final _pack1 = TextEditingController();

  final _pack2 = TextEditingController();

  double _result1=0.00;

  double _result2=0.00;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        //価格表示１
                        width: deviceWidth*0.45,
                        child: TextFormField(
                          controller: _shohinkakaku1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: Colors.lightBlueAccent,
                                  width: 2,
                                )
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 17,
                              color: Colors.orangeAccent,
                            ),
                            labelText: '商品価格１',
                            floatingLabelStyle: const TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: Colors.orangeAccent,
                                width: 1.0,
                              ),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),

                  //容量

                  SizedBox(
                    width: deviceWidth*0.45,
                    child: TextFormField(
                      controller: _youryo1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                              width: 2,
                            )
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.orangeAccent,
                        ),
                        labelText: '容量(g,ml,cm,m,個,枚)',
                        floatingLabelStyle: const TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.orangeAccent,
                            width: 1.0,
                          ),
                        ),
                      ),

                    ),
                  ),

                  //パック数

                  SizedBox(
                    //価格表示１
                    width: deviceWidth*0.45,
                    child: TextFormField(
                      controller: _pack1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                              width: 2,
                            )
                        ),
                        labelStyle: const TextStyle(
                          fontSize: 17,
                          color: Colors.orangeAccent,
                        ),
                        labelText: 'パック数',
                        floatingLabelStyle: const TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.orangeAccent,
                            width: 1.0,
                          ),
                        ),
                      ),

                    ),
                  ),

                  //単価表示１
                  Column(
                    children: [
                      const Text(
                          '商品１の単位価格',
                        style: TextStyle(
                            fontSize: 17
                        ),
                      ),

                      Text(
                        '$_result1円',
                        style: const TextStyle(fontSize: 35),),


                      SizedBox(
                        width: 160,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_shohinkakaku1.text.isNotEmpty) {
                              setState(() {
                                // 数値の取得と計算
                                double inputShohinkakaku1 = _shohinkakaku1.text.isNotEmpty ? double.parse(_shohinkakaku1.text) : 1.0;
                                double inputYouryo1 = _youryo1.text.isNotEmpty ? double.parse(_youryo1.text) : 1.0;
                                double inputPack1 = _pack1.text.isNotEmpty ? double.parse(_pack1.text) : 1.0;
                                _result1 = calculateResult1(inputShohinkakaku1,inputPack1,inputYouryo1);
                              });
                            }
                          },
                          child: const Text(
                              '計算',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),


              ///間の隙間
              SizedBox(
                width: 15,
              ),




              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //価格表示２
                  SizedBox(
                    width: deviceWidth*0.45,
                    child: TextFormField(
                      controller: _shohinkakaku2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                              width: 2,
                            )
                        ),
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.green[300],
                        ),
                        labelText: '商品価格２',
                        floatingLabelStyle: const TextStyle(fontSize: 20,color: Colors.green),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                      ),

                    ),
                  ),

                  //容量

                  SizedBox(
                    width: deviceWidth*0.45,
                    child: TextFormField(
                      controller: _youryo2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                              width: 2,
                            )
                        ),
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.green[300],
                        ),
                        labelText: '容量(g,ml,cm,m,個,枚)',
                        floatingLabelStyle: const TextStyle(fontSize: 20,color: Colors.green),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                      ),

                    ),
                  ),

                  //パック数

                  SizedBox(
                    width: deviceWidth*0.45,
                    child: TextFormField(
                      controller: _pack2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.lightBlueAccent,
                              width: 2,
                            )
                        ),
                        labelStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.green[300],
                        ),
                        labelText: 'パック数',
                        floatingLabelStyle: const TextStyle(fontSize: 20,color: Colors.green),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                      ),

                    ),
                  ),

                  //単価表示２
                  Column(
                    children: [
                      const Text(
                          '商品２の単位価格',
                          style: TextStyle(
                            fontSize: 17
                          ),
                      ),
                      Text(
                          '$_result2円',
                          style: const TextStyle(fontSize: 35)),

                      SizedBox(
                        width: 160,
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_shohinkakaku2.text.isNotEmpty) {
                              setState(() {
                                // 数値の取得と計算
                                double inputShohinkakaku2 = _shohinkakaku2.text.isNotEmpty ? double.parse(_shohinkakaku2.text) : 1.0;
                                double inputYouryo2 = _youryo2.text.isNotEmpty ? double.parse(_youryo2.text) : 1.0;
                                double inputPack2 = _pack2.text.isNotEmpty ? double.parse(_pack2.text) : 1.0;
                                _result2 = calculateResult2(inputShohinkakaku2,inputPack2,inputYouryo2);
                              });
                            }
                          },
                          child: const Text(
                            '計算',
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateResult1(double inputShohinkakaku1,inputPack1,inputYouryo1) {
    // ここで計算ロジックを実行
    double _result1 = (inputShohinkakaku1 / inputPack1) / inputYouryo1;

    // 小数第二位を四捨五入
    _result1 = (_result1 * 100).round() / 100;

    return _result1;
  }


  double calculateResult2(double inputShohinkakaku2,inputPack2,inputYouryo2) {
    // ここで計算ロジックを実行
    double _result2 = (inputShohinkakaku2 / inputPack2) / inputYouryo2;

    // 小数第二位を四捨五入
    _result2 = (_result2 * 100).round() / 100;

    return _result2;
  }


///＜解説＞
///.round() メソッドは「小数点以下を切り捨てる」という方法なので、
///具体的に「小数第〜位で切り捨て」という指示は出来ない。
///そこで、そもそもの _result を100倍し、それの切り捨てをした後で
///.round() を実行してあげることで、事実上「小数第〜位で切り捨て」をやったことになる。


}
