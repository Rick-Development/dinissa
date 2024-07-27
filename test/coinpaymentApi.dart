
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

Future<Map<String, dynamic>> coinpaymentsApiCall(String cmd, [Map<String, String>? req]) async {
  // Fill these in from your API Keys page
  String publicKey = 'c110adbfb8063396dfd29f3c1c6b00cfab6cc7a96d07873b4fafcbbe0c9a5f72';
  String privateKey = '96e8066735a138892cF14cf72d0a3ab69bc788fBb276d65E1C5af642A2351809';

  // Initialize the request map if null
  req = req ?? {};

  // Set the API command and required fields
  req['version'] = '1';
  req['cmd'] = cmd;
  req['key'] = publicKey;
  req['format'] = 'json'; // Supported values are json and xml

  // Generate the query string
  String postData = req.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');

  // Calculate the HMAC signature on the POST data
  var hmac = Hmac(sha512, utf8.encode(privateKey));
  String signature = hmac.convert(utf8.encode(postData)).toString();

  // Create HTTP headers
  Map<String, String> headers = {
    'HMAC': signature,
  };

  // Make the HTTP POST request
  var response = await http.post(
    Uri.parse('https://www.coinpayments.net/api.php'),
    headers: headers,
    body: postData,
  );

  // Parse and return data if successful
  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    if (jsonData is Map<String, dynamic> && jsonData.isNotEmpty) {
      return jsonData;
    } else {
      // If using Dart 2.6 or higher, use json.decode with reviver
      return {'error': 'Unable to parse JSON result'};
    }
  } else {
    return {'error': 'HTTP error: ${response.statusCode}'};
  }
}

// Get current coin exchange rates
void main() async {
  var rates = await coinpaymentsApiCall('rates');
  print(rates);
}
