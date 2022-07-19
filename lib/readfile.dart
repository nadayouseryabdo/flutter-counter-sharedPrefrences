import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp( const ReadFile());
}

class ReadFile extends StatefulWidget {
  const ReadFile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Retreiving();
  }
}

class Retreiving extends State<ReadFile> {
  SharedPreferences? prefs;
  TextEditingController controller = TextEditingController();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 300,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent)
                ),
                child: Text(name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                child: const Text("Read"),
                onPressed: () {
                  retrieve();
                },
              ),
            ],
          )),
    );
  }

  void retrieve() async {
    var sharePref = await SharedPreferences.getInstance();
    var name = sharePref.getString('name');
    setState(() {
      this.name = name ?? 'no data here';
    });
  }
}