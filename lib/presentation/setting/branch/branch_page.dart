import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/application/branch/branch_bloc.dart';
import 'package:kovio_coffee/injection.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/setting/branch/component/list_branch.dart';
import 'package:kovio_coffee/presentation/setting/branch/component/selected_branch.dart';

class BranchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BranchBloc>(
      create: (context) => getIt<BranchBloc>()..add(BranchEvent.getAllBranch()),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(sPaddingBody),
            child: Row(
              children: [
                // Selected Branch
                Expanded(
                  child: SelectedBranch(),
                ),
                SizedBox(
                  width: sPaddingBody,
                ),
                // List Branch
                Expanded(
                  child: ListBranch(),
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
