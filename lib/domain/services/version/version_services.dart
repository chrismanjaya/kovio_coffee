import 'package:kovio_coffee/domain/model/version_model.dart';

abstract class VersionServices {
  Future<VersionModel> getVersionInfo();
}
