part of 'verify_token_cubit.dart';

// @immutable
// abstract class VerifyTokenState {}

// final class VerifyTokenInitial extends VerifyTokenState {}

// class VerifyTokenLoading extends VerifyTokenState {}

// class VerifyTokenLoaded extends VerifyTokenState {}

// class VerifyTokenFailure extends VerifyTokenState {
//   final String? errorMesage;
//   VerifyTokenFailure({required this.errorMesage});
// }

@immutable
abstract class VerifyTokenState {}

class VerifyTokenInitial extends VerifyTokenState {
}

class VerifyTokenLoading extends VerifyTokenState {}

class VerifyTokenLoaded extends VerifyTokenState {}

class VerifyTokenFailure extends VerifyTokenState {
  final String? errorMesage;
  VerifyTokenFailure({required this.errorMesage});

  @override
  String toString() => 'VerifyTokenFailure: $errorMesage';
}
