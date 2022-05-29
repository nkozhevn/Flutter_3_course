import 'package:equatable/equatable.dart';
import 'package:kozhevnikov_lab_3_2/models/dog_model.dart';

abstract class DogState extends Equatable {
  const DogState();

  @override
  List<Object> get props => [];
}

class InitialState extends DogState {}

class LoadingState extends DogState {}

class LoadedState extends DogState {
  final Dog dogState;

  const LoadedState({
    required this.dogState,
  });
}

class FailedState extends DogState {
  final String errorMessage;

  const FailedState({
    required this.errorMessage,
  });
}