import 'package:flutter/material.dart';
import 'package:kovio_coffee/domain/model/sold_product_report_model.dart';
import 'package:kovio_coffee/presentation/core/formatter.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SoldProductDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];

  @override
  List<DataGridRow> get rows => dataGridRows;

  SoldProductDataSource(List<SoldProductReportModel> listSoldProduct) {
    int index = 0;
    dataGridRows = listSoldProduct.map(
      (SoldProductReportModel soldProductModel) {
        index++;
        return DataGridRow(
          cells: [
            DataGridCell<int>(
              columnName: "No",
              value: index,
            ),
            DataGridCell<String>(
              columnName: "Product Name",
              value: soldProductModel.productName,
            ),
            DataGridCell<int>(
              columnName: "Quantity",
              value: soldProductModel.quantity,
            ),
            DataGridCell<double>(
              columnName: "T. Price",
              value: soldProductModel.totalPrice,
            ),
            DataGridCell<double>(
              columnName: "T. Discount",
              value: soldProductModel.totalDiscount,
            ),
            DataGridCell<double>(
              columnName: "T. Sold",
              value: soldProductModel.totalSold,
            ),
          ],
        );
      },
    ).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: kSecondColor,
        cells: row.getCells().map<Widget>(
          // ignore: missing_return
          (dataGridCell) {
            switch (dataGridCell.columnName) {
              case "No":
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                  alignment: Alignment.center,
                  child: Text(
                    dataGridCell.value.toString(),
                    style: yTextNormal,
                  ),
                );
                break;
              case "Product Name":
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                  alignment: Alignment.center,
                  child: Text(
                    dataGridCell.value.toString(),
                    style: yTextNormal,
                  ),
                );
                break;
              case "Quantity":
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                  alignment: Alignment.center,
                  child: Text(
                    dataGridCell.value.toString(),
                    style: yTextNormal,
                  ),
                );
                break;
              case "T. Price":
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                  alignment: Alignment.centerRight,
                  child: Text(
                    Formatter().decimalGrouping(dataGridCell.value),
                    style: yTextNormal,
                  ),
                );
                break;
              case "T. Discount":
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                  alignment: Alignment.centerRight,
                  child: Text(
                    Formatter().decimalGrouping(dataGridCell.value),
                    style: yTextNormal,
                  ),
                );
                break;
              case "T. Sold":
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                  alignment: Alignment.centerRight,
                  child: Text(
                    Formatter().decimalGrouping(dataGridCell.value),
                    style: yTextNormal,
                  ),
                );
                break;
            }
          },
        ).toList());
  }
}
