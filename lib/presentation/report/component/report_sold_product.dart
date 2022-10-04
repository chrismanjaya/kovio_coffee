import 'package:flutter/material.dart';
import 'package:kovio_coffee/application/report/report_transaction_bloc.dart';
import 'package:kovio_coffee/domain/model/sold_product_report_model.dart';
import 'package:kovio_coffee/presentation/core/formatter.dart';
import 'package:kovio_coffee/presentation/core/widget_size.dart';
import 'package:kovio_coffee/presentation/core/widget_style.dart';
import 'package:kovio_coffee/presentation/report/component/chart_data.dart';
import 'package:kovio_coffee/presentation/report/component/chart_sold_product.dart';
import 'package:kovio_coffee/presentation/report/report_sold_product/report_sold_product_page.dart';

class ReportSoldProduct extends StatelessWidget {
  const ReportSoldProduct({
    Key key,
    @required this.state,
  }) : super(key: key);

  final ReportTransactionState state;

  @override
  Widget build(BuildContext context) {
    List<SoldProductReportModel> listData = state.listSoldProductReportModel;
    listData.sort((b, a) => a.quantity.compareTo(b.quantity));

    List<ChartData> _listChartData = [];
    if (listData.length > 0) {
      _listChartData.add(ChartData(
          "Top 1",
          listData[0].quantity,
          listData[0].productName +
              ": " +
              Formatter().decimalGrouping(listData[0].quantity.toDouble())));
    }
    if (listData.length > 1) {
      _listChartData.add(ChartData(
          "Top 2",
          listData[1].quantity,
          listData[1].productName +
              ": " +
              Formatter().decimalGrouping(listData[1].quantity.toDouble())));
    }
    if (listData.length > 2) {
      _listChartData.add(ChartData(
          "Top 3",
          listData[2].quantity,
          listData[2].productName +
              ": " +
              Formatter().decimalGrouping(listData[2].quantity.toDouble())));
    }
    if (listData.length > 3) {
      int totalQuantity = 0;
      for (int i = 3; i < listData.length; i++) {
        totalQuantity = totalQuantity + listData[i].quantity;
      }
      _listChartData.add(ChartData("Others", 1,
          "Others: " + Formatter().decimalGrouping(totalQuantity.toDouble())));
    }

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Report Sold Product: Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Title
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Chart Sold Product",
                        style: yTextNormal,
                      ),
                      Text(
                        Formatter().dateTimeToDateString(
                                state.transactionFilterModel.dateFrom) +
                            " to " +
                            Formatter().dateTimeToDateString(
                                state.transactionFilterModel.dateTo),
                        style: yTextMiniAccent,
                      ),
                    ],
                  ),
                ),
              ),
              // Button
              Container(
                margin: EdgeInsets.symmetric(horizontal: sPaddingBody),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReportSoldProductPage(
                          listSoldProductModel:
                              state.listSoldProductReportModel,
                          filter: state.transactionFilterModel,
                        ),
                      ),
                    );
                  },
                  style: yButtonFormDark,
                  child: Text(
                    "View Detail",
                    style: yTextNormalLink,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sPaddingBody,
          ),
          // Report Expense: Chart
          Container(
            child: ChartSoldProduct(
              chartData: _listChartData,
            ),
          ),
        ],
      ),
    );
  }
}
