import 'package:flutter/material.dart';
import 'package:kozhevnikov_lab_3_1/provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<APIProvider>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
            "Funny dogs",
            style: TextStyle(
                fontSize: 28,
                color: Colors.white
            )
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.data != null)
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const Text("Check out this cutie... ", style: TextStyle(color: Colors.black, fontSize: 36)),
                  const SizedBox(height: 8),
              Flexible(child: Image.network(provider.data!.url)),
                ],
              ),
            ),
          )
              else
                const Text("error")
            ],
          )),
        ),
      ),
    );
  }
}


