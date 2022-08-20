import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String message;
  ServerFailure(this.message);
  void call() {
    debugPrint(message);
  }

  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
