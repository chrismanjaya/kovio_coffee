import 'package:auto_route/auto_route_annotations.dart';
import 'package:kovio_coffee/presentation/activity/activity_page.dart';
import 'package:kovio_coffee/presentation/cashier/cashier_page.dart';
import 'package:kovio_coffee/presentation/expense/expense_page.dart';
import 'package:kovio_coffee/presentation/group/group_page.dart';
import 'package:kovio_coffee/presentation/home/home_page.dart';
import 'package:kovio_coffee/presentation/payment/payment_page.dart';
import 'package:kovio_coffee/presentation/product/product_page.dart';
import 'package:kovio_coffee/presentation/receipt/receipt_page.dart';
import 'package:kovio_coffee/presentation/report/report_expense/report_expense_page.dart';
import 'package:kovio_coffee/presentation/report/report_page.dart';
import 'package:kovio_coffee/presentation/report/report_transaction/report_transaction_page.dart';
import 'package:kovio_coffee/presentation/setting/about/about_page.dart';
import 'package:kovio_coffee/presentation/setting/branch/branch_page.dart';
import 'package:kovio_coffee/presentation/setting/setting_page.dart';
import 'package:kovio_coffee/presentation/sign_in/sign_in_page.dart';
import 'package:kovio_coffee/presentation/splash/splash_page.dart';
import 'package:kovio_coffee/presentation/user/user_page.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: CashierPage),
    MaterialRoute(page: PaymentPage),
    MaterialRoute(page: ReceiptPage),
    MaterialRoute(page: ActivityPage),
    MaterialRoute(page: ProductPage),
    MaterialRoute(page: ExpensePage),
    MaterialRoute(page: ReportPage),
    MaterialRoute(page: ReportTransactionPage),
    MaterialRoute(page: ReportExpensePage),
    MaterialRoute(page: UserPage),
    MaterialRoute(page: GroupPage),
    MaterialRoute(page: SettingPage),
    MaterialRoute(page: BranchPage),
    MaterialRoute(page: AboutPage),
  ],
)
class $Router {}
