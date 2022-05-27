import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Dog {
  final String url;

  Dog({
    required this.url
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      url: json['url'],
    );
  }
}

class APIProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Dog? _data;
  Dog? get data => _data;

  Future<void> fetchDog() async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('https://random.dog/woof.json'));
    _data = Dog.fromJson(jsonDecode(response.body));
    _isLoading = false;
    notifyListeners();
  }
}