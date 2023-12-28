import 'dart:convert';

import 'package:http/http.dart' as http;

///Class which sends data to API
class FormSender {
  ///Post function
  Future<String> postData({
    required String name,
    required String email,
    required String message,
  }) async {

    final uri = Uri.parse('https://api.byteplex.info/api/test/contact/');
    String successMessage = "";

    final Map<String, dynamic> requestData = {
      "name": name,
      "email": email,
      "message": message,
    };

    final String jsonData = jsonEncode(requestData);

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonData,
    );

    if (response.statusCode == 201) {
      successMessage = "Success!";
    } else {
      successMessage = "Error: ${response.statusCode}";
    }

    return successMessage;
  }
}
