import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestService {
  static Future<List> query(String search) async {
    var response = await http.get("https://us-central1-momentumtest-bfdef.cloudfunctions.net/app/api/v1/account/findByUserId?userId=$search");
    // Check if response is success
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var responseData = json.decode(response.body);
      print(responseData);
      return responseData;
    } else {
      print("Query failed: ${search} ${response.body} (${response.statusCode})");
      return null;
    }
  }
}
