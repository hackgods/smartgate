import 'dart:convert';
import 'package:http/http.dart' as http;

class FCM {
  var client = http.Client();

  sendMessage(String id,String Title, String Body) async{
    final body = {
      "to" : id,
      "collapse_key" : Title,
      "priority": "high",
      "notification" : {
        "title": Title,
        "body" : Body
      }
    };

    print(jsonEncode(body));

    var response = await client.post(Uri.https('fcm.googleapis.com', '/fcm/send'),
        body:jsonEncode(body),
        headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "authorization": "AAAAnWZ6VPs:APA91bEuH01LLjOeG9lwi5W2SW9qtrV1SI9VGs8u61hBl6ptxCq5cRuC2NQndx3JJ5XTQjKq0BkL2NQ6AABK30dc2wIOT7UK72xQOaeJkTPwokHrsamLh3CwdhYM9CyJ3hkZz_gomPjN",
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print(jsonMap);
    }

  }
}