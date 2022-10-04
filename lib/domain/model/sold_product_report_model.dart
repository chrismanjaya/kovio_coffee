import 'package:freezed_annotation/freezed_annotation.dart';

part 'sold_product_report_model.freezed.dart';

@freezed
abstract class SoldProductReportModel with _$SoldProductReportModel {
  factory SoldProductReportModel({
    String productName,
    int quantity,
    double totalPrice,
    double totalDiscount,
    double totalSold,
  }) = _SoldProductReportModel;

  factory SoldProductReportModel.empty() => SoldProductReportModel(
        productName: "",
        quantity: 0,
        totalPrice: 0,
        totalDiscount: 0,
        totalSold: 0,
      );
}
