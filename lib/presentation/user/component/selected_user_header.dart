import 'package:flutter/material.dart';
import 'package:kovio_coffee/application/user/user_bloc.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_string.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class SelectedUserHeader extends StatelessWidget {
  const SelectedUserHeader({
    Key key,
    @required this.isAuthorizedChange,
  }) : super(key: key);

  final bool isAuthorizedChange;

  @override
  Widget build(BuildContext context) {
    UserBloc _userBloc = context.read<UserBloc>();
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: sButtonForm,
              color: kPrimaryColor,
              child: ElevatedButton(
                onPressed: () {
                  return ExtendedNavigator.of(context).replace(Routes.homePage);
                },
                style: yButtonCircleAccent,
                child: Icon(
                  Icons.arrow_back,
                  color: kPrimaryColor,
                  size: sIcon,
                ),
              ),
            ),
            VerticalDivider(
              color: kSecondColor,
            ),
            // Button Clear
            Expanded(
              child: ElevatedButton(
                onPressed: isAuthorizedChange
                    ? () {
                        _userBloc.add(UserEvent.clearSelectedUser());
                      }
                    : null,
                style: yButtonFormClearAll,
                child: Text(
                  textButtonClearAll,
                  style: yTextBoldDark,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: sPaddingBody,
        )
      ],
    );
  }
}
