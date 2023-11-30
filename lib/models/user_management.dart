import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';

class UserManagement {
  late SharedPreferences _prefs;
  List<User> users = [];

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<List<User>> loadUsers() async {
    List<String>? userList = _prefs.getStringList('users');
    users = userList?.map((name) => User(name: name)).toList() ?? [];
    return users;
  }

  Future<void> _saveUsers() async {
    List<String> userList = users.map((user) => user.name).toList();
    await _prefs.setStringList('users', userList);
  }

  Future<bool> createUser(String name) async {
    await initPrefs();

    if (!userExists(name)) {
      users.add(User(name: name));
      await _saveUsers();
      return true;
    } else {
      return false;
    }
  }

  bool userExists(String name) {
    return users.any((user) => user.name == name);
  }
}
