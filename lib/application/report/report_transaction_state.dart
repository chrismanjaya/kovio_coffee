part of 'report_transaction_bloc.dart';

@freezed
abstract class ReportTransactionState with _$ReportTransactionState {
  const factory ReportTransactionState({
    @required List<ExpenseModel> listExpenseModel,
    @required List<TransactionReportModel> listTransactionReportModel,
    @required List<SoldProductReportModel> listSoldProductReportModel,
    @required TransactionReportStatusModel transactionReportStatusModel,
    @required TransactionFilterModel transactionFilterModel,
    @required bool isLoading,
    @required String errorMessage,
  }) = _ReportTransactionState;

  factory ReportTransactionState.initial() => ReportTransactionState(
        listExpenseModel: [],
        listTransactionReportModel: [],
        listSoldProductReportModel: [],
        transactionReportStatusModel: TransactionReportStatusModel.empty(),
        transactionFilterModel: TransactionFilterModel.empty(),
        isLoading: false,
        errorMessage: "",
      );
}
