import 'package:flutter/material.dart';
import 'package:kovio_coffee/domain/model/sold_product_report_model.dart';
import 'package:kovio_coffee/domain/model/transaction_filter_model.dart';
import 'package:kovio_coffee/presentation/core/formatter.dart';
import 'package:kovio_coffee/presentation/core/widget_color.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:kovio_coffee/presentation/report/report_sold_product/report_sold_product_export_excel.dart';
import 'package:kovio_coffee/presentation/report/report_sold_product/report_sold_product_export_pdf.dart';
import 'package:kovio_coffee/presentation/report/report_sold_product/sold_product_data_source.dart';
import 'package:kovio_coffee/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReportSoldProductPage extends StatelessWidget {
  final List<SoldProductReportModel> listSoldProductModel;
  final TransactionFilterModel filter;

  const ReportSoldProductPage({
    Key key,
    @required this.listSoldProductModel,
    @required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SoldProductDataSource _soldProductDataSource =
        SoldProductDataSource(listSoldProductModel);
    List<Cell> columns = [
      Cell("No", 0.28),
      Cell("Product Name", 1.2),
      Cell("Quantity", 0.5),
      Cell("T. Price", 0.5),
      Cell("T. Discount", 0.5),
      Cell("T. Sold", 0.5),
    ];

    int totalItem = 0;
    double totalItemPrice = 0;
    double totalItemDiscount = 0;
    double totalItemSold = 0;

    for (SoldProductReportModel soldProductReportModel
        in listSoldProductModel) {
      totalItem = totalItem + soldProductReportModel.quantity;
      totalItemPrice = totalItemPrice + soldProductReportModel.totalPrice;
      totalItemDiscount =
          totalItemDiscount + soldProductReportModel.totalDiscount;
      totalItemSold = totalItemSold + soldProductReportModel.totalSold;
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            mini: true,
            onPressed: () {
              return ExtendedNavigator.of(context).pop(Routes.homePage);
            },
            backgroundColor: kAccentColor,
            child: Icon(
              Icons.arrow_back,
              color: kPrimaryColor,
              size: sIcon,
            ),
          ),
          FloatingActionButton(
            mini: true,
            onPressed: () async {
              ReportSoldProductExportExcel().generateExcel(
                columns,
                _soldProductDataSource,
                filter,
                totalItem,
                totalItemPrice,
                totalItemDiscount,
                totalItemSold,
              );
            },
            backgroundColor: kUISuccessColor,
            child: Text(
              "XLS",
              style: yTextBold,
            ),
          ),
          FloatingActionButton(
            mini: true,
            onPressed: () async {
              ReportSoldProductExportPdf().generatePdf(
                columns,
                _soldProductDataSource,
                filter,
                totalItem,
                totalItemPrice,
                totalItemDiscount,
                totalItemSold,
              );
            },
            backgroundColor: kUIDangerColor,
            child: Text(
              "PDF",
              style: yTextBold,
            ),
          ),
        ],
      ),
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(sPaddingBody),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                    headerColor: kSecondColor,
                    brightness: Brightness.dark,
                    gridLineColor: kThirdColor,
                    gridLineStrokeWidth: 0.5,
                  ),
                  child: SfDataGrid(
                    rowHeight: sCellHeight,
                    source: _soldProductDataSource,
                    allowSorting: true,
                    columns: columns
                        .map(
                          (Cell cell) => GridTextColumn(
                              width: cell.widthScale * sCellWidth,
                              columnName: cell.label,
                              label: Label(
                                labelName: cell.label,
                              )),
                        )
                        .toList(),
                    columnWidthMode: ColumnWidthMode.fill,
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: sButtonForm,
                padding: EdgeInsets.only(left: 0.8 * sCellWidth),
                decoration: BoxDecoration(
                  color: kSecondColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      spreadRadius: 0.1,
                      offset:
                          Offset(0.0, -1.0), // shadow direction: bottom right
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Total Item
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Total Item",
                              style: yTextMiniAccent,
                            ),
                            Text(
                              totalItem.toString(),
                              style: yTextBold,
                            ),
                          ],
                        ),
                      ),
                      // Total Item Price
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Total Item Price",
                              style: yTextMiniAccent,
                            ),
                            Text(
                              Formatter().decimalGrouping(totalItemPrice),
                              style: yTextBold,
                            ),
                          ],
                        ),
                      ),

                      // Total Item Discount
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Total Item Discount",
                              style: yTextMiniAccent,
                            ),
                            Text(
                              Formatter().decimalGrouping(totalItemDiscount),
                              style: yTextBold,
                            ),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: kThirdColor,
                      ),
                      // Total Item Sold
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Total Item Sold",
                              style: yTextMiniAccent,
                            ),
                            Text(
                              Formatter().decimalGrouping(totalItemSold),
                              style: yTextBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String labelName;
  const Label({
    Key key,
    @required this.labelName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: sPaddingBody),
      alignment: Alignment.center,
      child: Text(
        labelName,
        style: yTextBoldAccent,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Cell {
  String label;
  double widthScale;

  Cell(String label, double widthScale) {
    this.label = label;
    this.widthScale = widthScale;
  }
}
