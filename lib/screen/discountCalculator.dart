import 'package:flutter/material.dart';

class discountCalculator extends StatefulWidget {
  const discountCalculator({super.key});

  @override
  State<discountCalculator> createState() => _discountCalculatorState();
}

class _discountCalculatorState extends State<discountCalculator> {

  double value=0.00;
  double _value = 0.00;
  final _five = 0.95;
  final _ten = 0.90;
  final _twelve = 0.80;
  final _thirty = 0.70;
  final _fouty = 0.60;
  final _fifty = 0.50;
  double _discount=0.00;

  void _five_percent() {
    setState(() {
      _discount = _value*_five;
    });
  }

  void _ten_percent() {
    setState(() {
      _discount = _value*_ten;
    });
  }

  void _twelve_percent() {
    setState(() {
      _discount = _value*_twelve;
    });
  }

  void _thirty_percent() {
    setState(() {
      _discount = _value*_thirty;
    });
  }

  void _fouty_percent() {
    setState(() {
      _discount = _value*_fouty;
    });
  }

  void _fifty_percent() {
    setState(() {
      _discount = _value*_fifty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            //仮想AppBar
            SizedBox(
              height: 100,
            ),


            //商品表示価格//
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 100),
              child: TextField(
                onChanged: (value){
                  _value = double.parse(value);
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "商品表示価格",
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),

            //割引率
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  onPressed: _five_percent,
                  label: Text(
                      '5%',
                      style: TextStyle(
                        fontSize: 25
                      ),
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: _ten_percent,
                  label: Text(
                      '10%',
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: _twelve_percent,
                  label: Text(
                      '20%',
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton.extended(
                  onPressed:_thirty_percent,
                  label: Text(
                      '30%',
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: _fouty_percent,
                  label: Text(
                      '40%',
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  onPressed: _fifty_percent,
                  label: Text(
                      '50%',
                    style: TextStyle(
                        fontSize: 25
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      '割引後価格',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    Container(
                      alignment:Alignment.center,
                      width: 350,
                      height: 60,
                      child: Text(
                        '$_discount円',
                        style: TextStyle(fontSize: 30),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
