
//Counter
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => CounterProvider(0),
      child: const Counter(),
    ),
  ));
}
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  CounterState createState() => CounterState();
}

class CounterState extends State<Counter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter:', style: TextStyle(fontSize: 20),),
            Text(
              counterProvider.counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 50),
        child: Row(
          children: [
            Container(
              width: 60,
                margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  counterProvider.incrementCounter();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            Container(
              width: 60,
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  counterProvider.decrementCounter();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
            Container(
              width: 60,
              margin: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  counterProvider.resetCounter();
                },
                tooltip: 'Reset',
                child: const Icon(Icons.clear),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int counter;
  CounterProvider(this.counter);

  int getCounter() => counter;
  serCounter(int counter) => counter = counter;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
  void decrementCounter() {
    if(counter>0){
    counter--;
    notifyListeners();
    }
  }
  void resetCounter() {
    counter=0;
    notifyListeners();
  }
}