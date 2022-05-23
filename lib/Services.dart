import 'Users.dart';
import 'package:http/http.dart' as http;
import 'strings.dart';

class Services {

  static Future <List<User>> getUsers() async {
    try{
      final response = await http.get(Uri.http(Strings.myIP, '/api/index.php'));
        if(200 == response.statusCode){
          final List<User> users = userFromJson(response.body);
          print(response.body);
          return users;

        } else{
          // ignore: deprecated_member_use
          return List<User>();
        }
    }
    catch(e)
    {
        // ignore: deprecated_member_use
        return List<User>();
    }
  }
}
