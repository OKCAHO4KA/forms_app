part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFromState extends Equatable {
  final String username;
  final String email;
  final String password;
  final FormStatus formStatus;

  const RegisterFromState(
      {this.username = '',
      this.email = '',
      this.password = '',
      this.formStatus = FormStatus.invalid});

  RegisterFromState copyWith(
          {String? username,
          String? email,
          String? password,
          FormStatus? formStatus}) =>
      RegisterFromState(
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus);
  @override
  List<Object> get props => [username, email, password, formStatus];
}
