import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  const DogCard({
    required this.url,


    Key? key,

  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text("Check out this cutie... ", style: TextStyle(color: Colors.black, fontSize: 36)),
            const SizedBox(height: 8),
            Flexible(child: Image.network(url)),
          ],
        ),
      ),
    );
  }
}