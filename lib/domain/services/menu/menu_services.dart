import 'package:dartz/dartz.dart';
import 'package:kovio_coffee/domain/model/menu_model.dart';

abstract class MenuServices {
  Future<Either<String, List<MenuModel>>> getAllMenu();
}
