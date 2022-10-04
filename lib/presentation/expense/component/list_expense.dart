import 'package:flutter/material.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:kovio_coffee/presentation/expense/component/expenses.dart';
import 'package:kovio_coffee/presentation/expense/component/textbox_search.dart';

class ListExpense extends StatelessWidget {
  const ListExpense({
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
          // ListExpense: Header
          TextboxSearch(),
          SizedBox(
            height: sPaddingContainer,
          ),
          // ListExpense: Expenses
          Expenses(),
        ],
      ),
    );
  }
}
