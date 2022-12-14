import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/application/sign_in/sign_in_bloc.dart';
import 'package:kovio_coffee/application/auth/auth_bloc.dart';
import 'package:kovio_coffee/injection.dart';
import 'package:kovio_coffee/presentation/sign_in/component/body.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<SignInBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
        ],
        child: Body(),
      ),
    );
  }
}
