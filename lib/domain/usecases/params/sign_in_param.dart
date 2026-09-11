import 'package:equatable/equatable.dart';

class SignInParam extends Equatable {
  final String email;
  final String name;

  const SignInParam({
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [email, name];
}
