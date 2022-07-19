import 'package:flutter/material.dart';
import 'package:lab4/readfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  SharedPreferences? prefs;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
          margin: const EdgeInsets.only(left:30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              Container(
                margin: const EdgeInsets.only(top:30,left:20),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      margin: const EdgeInsets.only(right:20),
                      child: ElevatedButton(
                        child: const Text("Save"),
                        onPressed: () {
                          save();
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 30,
                      child: ElevatedButton(
                        child: const Text("go to read page"),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>
                              const ReadFile()
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  void save() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('name', controller.text);
  }
}






//Counter
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: ChangeNotifierProvider(
//       create: (context) => CounterProvider(0),
//       child: const Counter(),
//     ),
//   ));
// }
//
// class Counter extends StatefulWidget {
//   const Counter({Key? key}) : super(key: key);
//
//   @override
//   CounterState createState() => CounterState();
// }
//
// class CounterState extends State<Counter> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var counterProvider = Provider.of<CounterProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text("Counter")),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Counter:',
//             ),
//             Text(
//               counterProvider.counter.toString(),
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Container(
//         margin: const EdgeInsets.only(left: 270),
//         padding: const EdgeInsets.all( 50),
//         child: Row(
//           children: [
//             Container(
//               width: 60,
//                 margin: const EdgeInsets.all(40),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   counterProvider.incrementCounter();
//                 },
//                 tooltip: 'Increment',
//                 child: const Icon(Icons.add),
//               ),
//             ),
//             Container(
//               width: 60,
//               margin: const EdgeInsets.all(40),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   counterProvider.decrementCounter();
//                 },
//                 tooltip: 'Decrement',
//                 child: const Icon(Icons.remove),
//               ),
//             ),
//             Container(
//               width: 60,
//               margin: const EdgeInsets.all(40),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   counterProvider.resetCounter();
//                 },
//                 tooltip: 'Reset',
//                 child: const Icon(Icons.clear),
//               ),
//             ),
//           ],
//         ),
//       )
//     );
//   }
// }
//
// class CounterProvider extends ChangeNotifier {
//   int counter;
//   CounterProvider(this.counter);
//
//   int getCounter() => counter;
//   serCounter(int counter) => counter = counter;
//
//   void incrementCounter() {
//     counter++;
//     notifyListeners();
//   }
//   void decrementCounter() {
//     if(counter>0){
//     counter--;
//     notifyListeners();
//     }
//   }
//   void resetCounter() {
//     counter=0;
//     notifyListeners();
//   }
// }