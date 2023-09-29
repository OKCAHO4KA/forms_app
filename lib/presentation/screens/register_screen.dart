import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FlutterLogo(size: 100),
            _RegisterForm(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    final email = registerCubit.state.email;

    return Form(
        // key: _formKey,
        child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          // onChanged: (value) => registerCubit.usernameChanged(value), // можно так
          onChanged: (value) {
            registerCubit.usernameChanged(value);
            // _formKey.currentState!.validate();
          },
          label: 'Nombre de usuario',
          // errorMensage:
          //     username.isPure || username.isValid ? null : 'Usuario no válido',
//Так тоже норм. но сделаем чтобы было: ErrorMessage> username.errorMesage и все
//
//
          //  username.isValid ? null : 'Usuario no válido',// если оставить так. все работает но ошибка выходит сразу после захода на экран. без нажатия. это не очень...
          //
          //

          // validator: (value)
          // {
          //   if (value == null || value.isEmpty) return 'Campo requerido';
          //   if (value.trim().isEmpty) return 'Campo requerido';
          //   if (value.length < 3) return "Más de 6 letras";

          //   return null;
          // },
          errorMensage: username.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          onChanged: (value) {
            // _formKey.currentState!.validate();
            registerCubit.emailChanged(value);
          },
          errorMensage: email.errorMessage,
          // validator: (value) {
          //   if (value == null || value.isEmpty) return 'Campo requerido';
          //   if (value.trim().isEmpty) return 'Campo requerido';

          //   final emailRegExp = RegExp(
          //     r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
          //   );
          //   if (!emailRegExp.hasMatch(value)) {
          //     return 'No tiene formato de correo';
          //   }
          //   return null;
          // },
          label: 'Correo electrónico',
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          // validator: (value) {
          //   if (value == null || value.isEmpty) return 'Campo requerido';
          //   if (value.trim().isEmpty) return 'Campo requerido';
          //   if (value.length < 6) return "Más de 6 letras";

          //   return null;
          // },
          onChanged: (value) {
            // _formKey.currentState!.validate();
            registerCubit.passwordChanged(value);
          },
          obscureText: true,
          label: 'Contraseña',
          errorMensage: password.errorMessage,
        ),
        const SizedBox(
          height: 10,
        ),
        FilledButton.tonalIcon(
            onPressed: () {
              // final isValid = _formKey.currentState!.validate();
              // if (!isValid) return;
              registerCubit.onSubmit();
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear usuario')),
      ],
    ));
  }
}

// final emailRegExp = RegExp(
//   r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
// );

//   static get email() {
//     return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
//   }
