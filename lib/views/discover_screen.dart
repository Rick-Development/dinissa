import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<dynamic> cryptoData = [];

  @override
  void initState() {
    super.initState();
    fetchCryptoData();
  }

  Future<void> fetchCryptoData() async {
    final url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          cryptoData = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover'),
      ),
      body: cryptoData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Supply\n\$6,927,274',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'TVL\n\$4,927,274',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Total Borrow\n\$1,927,274',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'Assets\n8',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tokens (8)',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text('Sort By', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8.0),
                          DropdownButton<String>(
                            value: 'Market Cap',
                            items: <String>['Market Cap', 'Price']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cryptoData.length,
                    itemBuilder: (context, index) {
                      final item = cryptoData[index];
                      return ListTile(
                        leading: Image.network(item['image'], width: 40, height: 40),
                        title: Text(item['name']),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Price: \$${item['current_price']}'),
                            Text('Market Cap: \$${item['market_cap']}'),
                            Text('24h Change: ${item['price_change_percentage_24h']}%'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: Footer(initialIndex: 4),
    );
  }
}
