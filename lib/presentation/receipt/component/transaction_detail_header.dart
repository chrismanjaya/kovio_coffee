import 'package:flutter/material.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';

class TransactionDetailHeader extends StatelessWidget {
  const TransactionDetailHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: sPaddingSmall),
      child: Row(
        children: <Widget>[
          // Item Quantity
          Expanded(
            flex: 1,
            child: Text(
              "Quantity",
              style: yTextMiniAccent,
            ),
          ),
          // Item Name
          Expanded(
            flex: 5,
            child: Text(
              "Item Name",
              style: yTextMiniAccent,
            ),
          ),
          // Item Price

          Expanded(
            flex: 2,
            child: Text(
              "Item Price",
              style: yTextMiniAccent,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
