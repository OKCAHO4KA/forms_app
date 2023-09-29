part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterFromState extends Equatable {
  final bool isValid;
  final Username username;
  final Email email;
  final Password password;
  final FormStatus formStatus;

  const RegisterFromState(
      {this.isValid = false,
      this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.formStatus = FormStatus.invalid});

  RegisterFromState copyWith(
          {Username? username,
          Email? email,
          Password? password,
          FormStatus? formStatus,
          bool? isValid}) =>
      RegisterFromState(
          username: username ?? this.username,
          email: email ?? this.email,
          password: password ?? this.password,
          formStatus: formStatus ?? this.formStatus,
          isValid: isValid ?? this.isValid);
  @override
  List<Object> get props => [username, email, password, formStatus, isValid];
}
