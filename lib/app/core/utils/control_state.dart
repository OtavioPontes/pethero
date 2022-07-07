import 'package:equatable/equatable.dart';

import '../error/failures.dart';

class ControlState extends Equatable {
  const ControlState();

  @override
  List<Object?> get props => [];

  static ControlState get start => StartControlState();
  static ControlState empty(String message) =>
      EmptyControlState(message: message);
  static ControlState get loading => LoadingControlState();
  static ControlState get success => SuccessControlState();
  static ControlState failure(String message) =>
      FailureControlState(message: message);

  bool get isStart => this is StartControlState;
  bool get isEmpty => this is EmptyControlState;
  bool get isLoading => this is LoadingControlState;
  bool get isSuccess => this is SuccessControlState;
  bool get isFailure => this is FailureControlState;
  bool get isPermissionDenied => this is PermissionControlState;

  bool get isNotStart => this is! StartControlState;
  bool get isNotEmpty => this is! EmptyControlState;
  bool get isNotLoading => this is! LoadingControlState;
  bool get isNotSuccess => this is! SuccessControlState;
  bool get isNotFailure => this is! FailureControlState;
  bool get isNotPermission => this is! PermissionControlState;
}

class StartControlState extends ControlState {}

class EmptyControlState extends ControlState {
  final String message;

  const EmptyControlState({required this.message});

  EmptyControlState copyWith({
    String? message,
  }) {
    return EmptyControlState(
      message: message ?? this.message,
    );
  }
}

class LoadingControlState extends ControlState {}

class SuccessControlState extends ControlState {}

class FailureControlState extends ControlState {
  final String message;

  const FailureControlState({required this.message});

  factory FailureControlState.fromFailure(IFailure failure) {
    return FailureControlState(message: failure.message);
  }

  FailureControlState copyWith({
    String? message,
  }) {
    return FailureControlState(
      message: message ?? this.message,
    );
  }
}

class PermissionControlState extends ControlState {
  final String message;
  final Function? onCall;

  const PermissionControlState({
    required this.message,
    this.onCall,
  });
}
