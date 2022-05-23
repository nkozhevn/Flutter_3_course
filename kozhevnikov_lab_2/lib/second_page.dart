import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kozhevnikov_lab_2/dog_card.dart';
import 'package:kozhevnikov_lab_2/dog_model.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool _loading = false;
  late Future<Dog> dogs;


  Future<Dog> _fetchDog() async {
    setState(() {
      _loading = true;
    });

    final response = await http.get(Uri.parse('https://random.dog/woof.json'));

    if (response.statusCode == 200) {
      return Dog.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    dogs = _fetchDog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
            "Funny dogs", style: TextStyle(fontSize: 28, color: Colors.white)),
      ),
      body: Center(
        child: FutureBuilder<Dog>(
          future: dogs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DogCard(url: snapshot.data!.url);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}