import 'package:flutter/material.dart';
import 'package:kovio_coffee/application/product/product_bloc.dart';
import 'package:kovio_coffee/domain/model/product_model.dart';
import 'package:kovio_coffee/presentation/core/formatter.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  const ProductCard({
    Key key,
    this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductBloc _productBloc = context.read<ProductBloc>();

    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          return _productBloc
              .add(ProductEvent.setSelectedProduct(productModel));
        },
        child: Container(
          padding: EdgeInsets.all(
            sPaddingContainer,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: sLineNormal,
                color: kPrimaryColor,
              ),
            ),
          ),
          child: Row(
            children: [
              // Product Name
              Expanded(
                flex: 3,
                child: Text(
                  productModel.name,
                  textAlign: TextAlign.left,
                  style: yTextNormal,
                ),
              ),
              // Product Price
              Expanded(
                flex: 1,
                child: (productModel.discount <= 0)
                    ? Text(
                        new Formatter().decimalGrouping(productModel.price),
                        textAlign: TextAlign.right,
                        style: yTextBold,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Original Price
                          Text(
                            new Formatter().decimalGrouping(productModel.price),
                            textAlign: TextAlign.right,
                            style: yTextStrikeThrough,
                          ),
                          // Discount
                          Text(
                            new Formatter()
                                .decimalGrouping(productModel.discount),
                            textAlign: TextAlign.right,
                            style: yTextBold,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
