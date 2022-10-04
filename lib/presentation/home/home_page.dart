import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/presentation/core/loading_page.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/home/component/menu_body.dart';
import 'package:kovio_coffee/presentation/home/component/menu_header.dart';
import 'package:kovio_coffee/application/auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().state.userModel;
    context.read<AuthBloc>().add(const AuthEvent.getUserInfo());

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoaded) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.all(sPaddingBody),
                child: Column(
                  children: <Widget>[
                    // Menu Header
                    MenuHeader(),
                    SizedBox(height: sPaddingBody),
                    // Menu Body
                    MenuBody(),
                  ],
                ),
              ),
            ),
          );
        } else {
          return LoadingPage();
        }
      },
    );
  }
}
