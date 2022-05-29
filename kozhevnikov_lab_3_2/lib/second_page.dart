import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kozhevnikov_lab_3_2/bloc/dog_bloc.dart';
import 'package:kozhevnikov_lab_3_2/bloc/dog_state.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: BlocBuilder<DogBloc, DogState>(
            builder: (context, state) {
              if (state is LoadingState) return const CircularProgressIndicator();
              if (state is LoadedState) {
                return Container(
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
                        Flexible(child: Image.network(state.dogState.url.toString())),
                      ],
                    ),
                  ),
                );
              }
              if (state is FailedState) return Text(state.errorMessage);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}