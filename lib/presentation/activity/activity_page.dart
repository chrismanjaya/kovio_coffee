import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/application/activity/activity_bloc.dart';
import 'package:kovio_coffee/application/auth/auth_bloc.dart';
import 'package:kovio_coffee/injection.dart';
import 'package:kovio_coffee/presentation/activity/component/list_activity.dart';
import 'package:kovio_coffee/presentation/activity/component/selected_activity.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthBloc _authBloc = context.read<AuthBloc>();

    return BlocProvider<ActivityBloc>(
      create: (context) => getIt<ActivityBloc>()
        ..add(
            ActivityEvent.getAllTransaction(_authBloc.state.userModel.branch)),
      child: WillPopScope(
        // ignore: missing_return
        onWillPop: () {},
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            mini: true,
            onPressed: () {
              return ExtendedNavigator.of(context).replace(Routes.homePage);
            },
            backgroundColor: kUIPrimaryColor,
            child: Icon(
              Icons.description_outlined,
              color: kTextPrimaryColor,
              size: sIcon,
            ),
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(sPaddingBody),
              child: Row(
                children: [
                  // Selected Activity
                  Expanded(
                    child: SelectedActivity(),
                  ),
                  SizedBox(
                    width: sPaddingBody,
                  ),
                  // List Activity
                  Expanded(
                    child: ListActivity(),
                  ),
                ],
              ),
            ),
          ),
          resizeToAvoidBottomInset: true,
        ),
      ),
    );
  }
}
