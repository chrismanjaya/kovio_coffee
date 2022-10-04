import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/application/expense/expense_bloc.dart';
import 'package:kovio_coffee/injection.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/expense/component/list_expense.dart';
import 'package:kovio_coffee/presentation/expense/component/selected_expense.dart';

class ExpensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExpenseBloc>(
      create: (context) =>
          getIt<ExpenseBloc>()..add(ExpenseEvent.getAllExpense()),
      child: WillPopScope(
        // ignore: missing_return
        onWillPop: () {},
        child: Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(sPaddingBody),
              child: Row(
                children: [
                  // Selected Expense
                  Expanded(
                    child: SelectedExpense(),
                  ),
                  SizedBox(
                    width: sPaddingBody,
                  ),
                  // List Expense
                  Expanded(
                    child: ListExpense(),
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
