import 'package:hive/hive.dart';
import 'package:hotline_v2/src/models/UserAccount.dart';

class UserAccountBox {
  static const String _boxName = 'user_account';

  Future<Box<UserAccount>> getBox() async {
    return await Hive.openBox<UserAccount>(_boxName);
  }

  void closeHive() async {
    await Hive.box<UserAccount>('personal_info').close();
    await Hive.close();
  }
}
