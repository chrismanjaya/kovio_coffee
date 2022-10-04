import 'package:flutter/material.dart';
import 'package:kovio_coffee/presentation/core/widget_string.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';

class FormHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            textWelcome,
            style: yTextTitle,
          ),
          Text(
            textWelcomeDecription,
            style: yTextSubtitle,
          ),
        ],
      ),
    );
  }
}
