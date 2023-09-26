import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CounterState(); 
    //{return CounterState();}
}

/// state class
class _CounterState extends State<CounterScreen>{

  int counter = 0;
  Map<int, String> productList = {
    1 : 'Product 1',
    2 : 'Product 2',
    3 : 'Product 3',
    4 : 'Product 4',
    5 : 'Product 5',
    6 : 'Product 6',
    7 : 'Product 7',
    8 : 'Product 8',
    9 : 'Product 9',
    10 :'Product 10',
    11 :'Product 10',
    12 :'Product 12',
    13 :'Product 13',
    14 :'Product 14',
    15 :'Product 15',
    16 :'Product 16',
    17 :'Product 17',
    18 :'Product 18',
    19 :'Product 19',
    20 :'Product 20',
  };
  Map<int, int> productCounter = {
    1 : 0,
    2 : 0,
    3 : 0,
    4 : 0,
    5 : 0,
    6 : 0,
    7 : 0,
    8 : 0,
    9 : 0,
    10 : 0,
    11 : 0,
    12 : 0,
    13 : 0,
    14 : 0,
    15 : 0,
    16 : 0,
    17 : 0,
    18 : 0,
    19 : 0,
    20 : 0,
  };
  Map<int, double> productCost = {
    1 : 310.00,
    2 : 315.00,
    3 : 320.00,
    4 : 320.00,
    5 : 320.00,
    6 : 320.00,
    7 : 320.00,
    8 : 320.00,
    9 : 320.00,
    10 : 320.00,
    11 : 320.00,
    12 : 320.00,
    13 : 320.00,
    14 : 320.00,
    15 : 320.00,
    16 : 320.00,
    17 : 320.00,
    18 : 320.00,
    19 : 320.00,
    20 : 320.00,
  };

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List App'),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          Text(counter.toString());
          return ListTile(// = List Element
            title: Text(productList[index+1].toString()),
            subtitle: Text(productCost[index+1].toString()),
            //leading: Text(counter.toString()),
            trailing:
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
              ),
              onPressed: () {
                //Text(counter.toString(),);
                counter = counter + 1;
                productCounter[index+1] = productCounter[index+1]!+1;
                if(productCounter[index+1] == 5){
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Congratulations!'),
                        content: const Text('You have bought 5 products '),
                        actions: [
                          TextButton(onPressed: () {Navigator.pop(context);},child: const Text('OK')),
                        ],
                      );
                    });
                }
                setState(() {});
                //print(productList[index+1]);
                //print(productCounter[index+1]);
                //print(productCost[index+1]);
                //print(counter);
              },
              //child: const Text('Buy Now')
              child: Text('Buy Now: ${productCounter[index+1].toString()}'),
            ),
          );
        }
      ), //

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(productName: 'Total Products: $counter'),),);
        },
        tooltip: counter.toString(), //'Increment',
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
class CartPage extends StatefulWidget {
  final String productName;
  const CartPage({super.key, required this.productName});

  @override
  State<CartPage> createState() => _CartPage();
}
class _CartPage extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body:Center(
        child: Text(widget.productName),
      ),
    );
  }
}
