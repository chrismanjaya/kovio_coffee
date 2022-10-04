import 'package:flutter/material.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:kovio_coffee/presentation/user/component/textbox_search.dart';
import 'package:kovio_coffee/presentation/user/component/users.dart';

class ListUser extends StatelessWidget {
  const ListUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: borderRadius,
      ),
      padding: EdgeInsets.fromLTRB(
        sPaddingContainer,
        sPaddingContainer,
        sPaddingContainer,
        0,
      ),
      child: Column(
        children: <Widget>[
          // ListUser: Header
          TextboxSearch(),
          SizedBox(
            height: sPaddingContainer,
          ),
          // ListUser: Users
          Users(),
        ],
      ),
    );
  }
}
