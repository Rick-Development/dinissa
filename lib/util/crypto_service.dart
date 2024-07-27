import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  static const String apiUrl = 'https://api.coingecko.com/api/v3';

  static Future<List<dynamic>> fetchTopCryptos() async {
    final response = await http.get(Uri.parse('$apiUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load cryptos');
    }
  }

  static Future<List<dynamic>> fetchCryptoNews() async {
    // Placeholder for fetching news. You need to replace this with an actual API endpoint.
    return [
      {'title': 'Crypto Market Surges', 'summary': 'The crypto market has seen a significant surge...'},
      {'title': 'Bitcoin Hits New High', 'summary': 'Bitcoin price reaches an all-time high...'},
      {'title': 'Ethereum 2.0 Update', 'summary': 'Ethereum network update expected to improve...'},
    ];
  }
}
