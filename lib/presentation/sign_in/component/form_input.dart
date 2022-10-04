import 'package:flutter/material.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/sign_in/component/form_textbox_email.dart';
import 'package:kovio_coffee/presentation/sign_in/component/form_textbox_password.dart';

class FormInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Container(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Textbox Email
            FormTextBoxEmail(node: node),
            SizedBox(
              height: sPaddingBody,
            ),
            // Textbox Password
            FormTextBoxPassword(node: node),
          ],
        ),
      ),
    );
  }
}
