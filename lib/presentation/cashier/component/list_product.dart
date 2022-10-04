import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kovio_coffee/application/cashier/product/product_bloc.dart';
import 'package:kovio_coffee/injection.dart';
import 'package:kovio_coffee/presentation/cashier/component/products.dart';
import 'package:kovio_coffee/presentation/cashier/component/textbox_search_product.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductBloc>()..add(ProductEvent.getListProduct()),
      child: Expanded(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            sPaddingContainer,
            sPaddingContainer,
            sPaddingContainer,
            0,
          ),
          decoration: BoxDecoration(
            color: kSecondColor,
            borderRadius: borderRadius,
          ),
          child: Column(
            children: [
              // Header List Product
              TextboxSearch(),
              SizedBox(
                height: sPaddingContainer,
              ),
              // Body List Product
              Products(),
            ],
          ),
        ),
      ),
    );
  }
}
