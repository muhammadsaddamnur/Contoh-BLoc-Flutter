import 'package:contohblocpattern/models/user.dart';

class DbApi{
  Future<User> getUser() async{
    await Future.delayed(Duration(seconds: 1));
    User _user = User('Nicholas', 12, 150.0);
    return _user;
  }
}

DbApi api = DbApi();