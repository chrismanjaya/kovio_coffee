import 'package:kovio_coffee/domain/model/menu_model.dart';
import 'package:kovio_coffee/infrastructure/model/action.dart';
import 'package:kovio_coffee/infrastructure/model/menu.dart';

class MenuModelMapper {
  MenuModel toMenuModel(Menu menu, List<Action> listAction) {
    return MenuModel(
      id: menu.id,
      menuCode: menu.menuCode,
      menuName: menu.menuName,
      listAction: listAction,
    );
  }
}
