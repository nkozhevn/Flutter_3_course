import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/dog_model.dart';
import 'dog_event.dart';
import 'dog_state.dart';
import 'dart:convert';
import 'dart:async';

class DogBloc extends Bloc<DogEvent, DogState> {
  DogBloc() : super(InitialState()) {
    on<LoadEvent>(_loadData);
  }

  Future<void> _loadData(
      LoadEvent event,
      Emitter<DogState> emit,
      ) async {
    try {
      emit(LoadingState());
      final url = Uri.parse('https://random.dog/woof.json');
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(url);
      final _dog = Dog.fromJson(jsonDecode(response.body));
      emit(LoadedState(dogState: _dog));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}
