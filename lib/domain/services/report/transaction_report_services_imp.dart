import 'package:injectable/injectable.dart';
import 'package:kovio_coffee/domain/mapper/expense_model_mapper.dart';
import 'package:kovio_coffee/domain/mapper/transaction_report_model_mapper.dart';
import 'package:kovio_coffee/domain/model/expense_model.dart';
import 'package:kovio_coffee/domain/model/sold_product_report_model.dart';
import 'package:kovio_coffee/domain/model/transaction_filter_model.dart';
import 'package:kovio_coffee/domain/model/transaction_report_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kovio_coffee/domain/services/report/transaction_report_services.dart';
import 'package:kovio_coffee/infrastructure/model/expense.dart';
import 'package:kovio_coffee/infrastructure/model/transaction_detail.dart';
import 'package:kovio_coffee/infrastructure/model/transaction_header.dart';
import 'package:kovio_coffee/infrastructure/repository/expense_repo.dart';
import 'package:kovio_coffee/infrastructure/repository/transaction_detail_repo.dart';
import 'package:kovio_coffee/infrastructure/repository/transaction_header_repo.dart';

@LazySingleton(as: TransactionReportServices)
class TransactionReportServicesImp implements TransactionReportServices {
  @override
  Future<Either<String, List<TransactionReportModel>>>
      getAllTransactionByFilter(
          TransactionFilterModel transactionFilterModel) async {
    // Get All Transaction Header without Transaction Detail
    final getAllTransactionHeader = await TransactionHeaderRepo()
        .getAllTransactionReportByFilter(transactionFilterModel);
    if (getAllTransactionHeader.isLeft()) {
      return left(getAllTransactionHeader.fold(
        (failure) => failure,
        (r) => null,
      ));
    }

    List<TransactionHeader> listTransactionHeader =
        getAllTransactionHeader.fold(
      (l) => [],
      (listTransactionHeader) => listTransactionHeader,
    );
    List<TransactionReportModel> listTransactionHeaderModel = [];
    for (TransactionHeader transactionHeader in listTransactionHeader) {
      if (transactionFilterModel.listStatus
          .contains(transactionHeader.status)) {
        listTransactionHeaderModel.add(
          TransactionReportModelMapper()
              .toTransactionReportModel(transactionHeader),
        );
      }
    }

    return right(listTransactionHeaderModel);
  }

  @override
  Future<Either<String, List<ExpenseModel>>> getAllExpenseByFilter(
      TransactionFilterModel transactionFilterModel) async {
    final getAllExpense = await ExpenseRepo().getAllExpenseByDate(
      transactionFilterModel.dateFrom,
      transactionFilterModel.dateTo,
    );
    if (getAllExpense.isLeft()) {
      return left(getAllExpense.fold((failure) => failure, (r) => null));
    } else {
      List<ExpenseModel> expenseModels = [];
      try {
        for (Expense expense
            in getAllExpense.fold((l) => null, (listExpense) => listExpense)) {
          expenseModels.add(ExpenseModelMapper().toExpenseModel(expense));
        }
      } catch (error) {
        return left(error.toString());
      }
      return right(expenseModels);
    }
  }

  @override
  Future<Either<String, List<SoldProductReportModel>>>
      getAllSoldProductByFilter(
          TransactionFilterModel transactionFilterModel) async {
    // Get All Transaction Header without Transaction Detail
    final getAllTransactionHeader = await TransactionHeaderRepo()
        .getAllTransactionReportByFilter(transactionFilterModel);
    if (getAllTransactionHeader.isLeft()) {
      return left(getAllTransactionHeader.fold(
        (failure) => failure,
        (r) => null,
      ));
    }

    // Mapping List Transaction ID
    List<TransactionHeader> listTransactionHeader =
        getAllTransactionHeader.fold(
      (l) => [],
      (listTransactionHeader) => listTransactionHeader,
    );
    List<String> listTransactionId = [];
    for (TransactionHeader transactionHeader in listTransactionHeader) {
      if (transactionHeader.status == "Done") {
        listTransactionId.add(transactionHeader.id);
      }
    }

    // Get List Transaction Details
    final getListTransactionDetailByListTransactionId =
        await TransactionDetailRepo()
            .getListTransactionDetailByListTransactionId(listTransactionId);
    if (getListTransactionDetailByListTransactionId.isLeft()) {
      return left(getListTransactionDetailByListTransactionId.fold(
        (failure) => failure,
        (r) => null,
      ));
    }

    // Mapping List SoldProductReportModel
    List<TransactionDetail> listTransactionDetail =
        getListTransactionDetailByListTransactionId.fold(
      (l) => [],
      (listTransactionDetail) => listTransactionDetail,
    );
    List<SoldProductReportModel> listSoldProductReportModel = [];
    for (TransactionDetail transactionDetail in listTransactionDetail) {
      final index = listSoldProductReportModel
          .indexWhere((data) => data.productName == transactionDetail.itemName);
      final double totalPrice =
          transactionDetail.quantity * transactionDetail.itemPrice.toDouble();
      final double totalDiscount =
          transactionDetail.itemDiscount.toDouble() == 0
              ? 0
              : transactionDetail.quantity *
                  (transactionDetail.itemPrice.toDouble() -
                      transactionDetail.itemDiscount.toDouble());
      final double totalSold = totalPrice - totalDiscount;

      if (index >= 0) {
        // Update Data
        listSoldProductReportModel[index] = SoldProductReportModel(
          productName: transactionDetail.itemName,
          quantity: listSoldProductReportModel[index].quantity +
              transactionDetail.quantity,
          totalPrice: listSoldProductReportModel[index].totalPrice + totalPrice,
          totalDiscount:
              listSoldProductReportModel[index].totalDiscount + totalDiscount,
          totalSold: listSoldProductReportModel[index].totalSold + totalSold,
        );
      } else {
        // Insert Data
        listSoldProductReportModel.add(
          SoldProductReportModel(
            productName: transactionDetail.itemName,
            quantity: transactionDetail.quantity,
            totalPrice: totalPrice,
            totalDiscount: totalDiscount,
            totalSold: totalSold,
          ),
        );
      }
    }
    return right(listSoldProductReportModel);
  }
}
