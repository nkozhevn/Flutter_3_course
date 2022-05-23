import 'package:flutter/material.dart';
import 'package:kozhevnikov_lab_2/dog_model.dart';
import 'second_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _loading = false;
  late Future<Dog> characters;


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("Funny dogs", style: TextStyle(fontSize: 28, color: Colors.white)),
      ),
      body: Center (
        child: Container(
          width: 600,
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: Text('Wanna see smth cool?',
                    style: TextStyle(fontSize: 24, color: Colors.black)),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SecondPage(),
                    ),
                  );
                },
                child: const Text("Of course"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}