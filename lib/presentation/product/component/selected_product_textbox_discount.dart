import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:kovio_coffee/application/product/product_bloc.dart';
import 'package:kovio_coffee/presentation/core/formatter.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_string.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedProductTextboxDiscount extends StatelessWidget {
  const SelectedProductTextboxDiscount({
    Key key,
    @required this.node,
    @required this.title,
    @required this.value,
    @required this.isAuthorizedChange,
  }) : super(key: key);

  final FocusScopeNode node;
  final String title;
  final double value;
  final isAuthorizedChange;

  @override
  Widget build(BuildContext context) {
    var _controller = new MoneyMaskedTextController(
      precision: 0,
      decimalSeparator: "",
      thousandSeparator: ",",
    );
    _controller.updateValue(value);
    _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length));

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: sPaddingContainer),
            child: Text(
              title,
              style: yTextBold,
            ),
          ),
          TextFormField(
            enabled: isAuthorizedChange,
            onChanged: (value) {
              context.read<ProductBloc>().add(
                  ProductEvent.changeSelectedProductDiscount(
                      Formatter().stringToDouble(value)));
            },
            controller: _controller,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => node.nextFocus(),
            style: (isAuthorizedChange) ? yTextNormal : yTextDisabled,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: sPaddingBody),
              filled: true,
              fillColor: kSecondColor,
              enabledBorder: yBorderNormal,
              disabledBorder: yBorderDisabled,
              focusedBorder: yBorderFocus,
              errorBorder: yBorderError,
              focusedErrorBorder: yBorderError,
              hintText: textHintText + title.toLowerCase(),
              hintStyle: yTextboxHint,
              prefix: Text(
                textCurrency,
                style: yTextNormalAccent,
              ),
            ),
          ),
          SizedBox(
            height: sPaddingBody,
          )
        ],
      ),
    );
  }
}
