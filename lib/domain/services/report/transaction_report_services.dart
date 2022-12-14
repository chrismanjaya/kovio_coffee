import 'package:dartz/dartz.dart';
import 'package:kovio_coffee/domain/model/expense_model.dart';
import 'package:kovio_coffee/domain/model/sold_product_report_model.dart';
import 'package:kovio_coffee/domain/model/transaction_filter_model.dart';
import 'package:kovio_coffee/domain/model/transaction_report_model.dart';

abstract class TransactionReportServices {
  Future<Either<String, List<TransactionReportModel>>>
      getAllTransactionByFilter(
    TransactionFilterModel transactionFilterModel,
  );
  Future<Either<String, List<ExpenseModel>>> getAllExpenseByFilter(
    TransactionFilterModel transactionFilterModel,
  );
  Future<Either<String, List<SoldProductReportModel>>>
      getAllSoldProductByFilter(TransactionFilterModel transactionFilterModel);
}
