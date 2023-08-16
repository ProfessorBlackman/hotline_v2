import 'package:hotline_v2/src/models/UserAccount.dart';
import 'package:hotline_v2/src/models/services/user_account/UserAccountBox.dart';


class UserAccountRepository {
  static final UserAccountBox _userAccountBox = UserAccountBox();

  Future<void> addUserAccount(UserAccount userAccount) async {
    final box = await _userAccountBox.getBox();
    await box.add(userAccount);
  }

  Future<List<UserAccount>> getAll() async {
    final box = await _userAccountBox.getBox();
    return box.values.toList();
  }

  Future<void> updateUserAccount(UserAccount userAccount) async {
    final box = await _userAccountBox.getBox();
    final index = box.values.toList().indexWhere((x) => x.key == userAccount.key);
    await box.putAt(index, userAccount);
  }

  Future<void> deleteUserAccount(UserAccount userAccount) async {
    final box = await _userAccountBox.getBox();
    await box.delete(userAccount.key);
  }

  Future<String> get(String item) async {
    final box = await _userAccountBox.getBox();
    final userAccounts = box.values.toList();
    switch(item){
      case 'name':
        return userAccounts.map((userAccount) => userAccount.name).toString();
      case 'email':
        return userAccounts.map((userAccount) => userAccount.email).toString();
      case 'password':
        return userAccounts.map((userAccount) => userAccount.password).toString();
      default:
        return 'null';
    }
  }

  Future<bool> exists() async{
    final box = await _userAccountBox.getBox();
    final userAccounts = box.values.toList();
    if(userAccounts.isEmpty){
      return true;
    }
    return false;
  }
}
