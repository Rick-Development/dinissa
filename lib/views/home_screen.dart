import 'package:dinissa/views/layouts/footer.dart';
import 'package:flutter/material.dart';
import 'package:dinissa/util/app_constant.dart';

import '../util/app_colors.dart';
import '../util/crypto_card.dart';
import '../util/crypto_service.dart';
import '../util/news_card.dart';
import '../util/shortcut_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _topCryptos;
  late Future<List<dynamic>> _cryptoNews;

  @override
  void initState() {
    super.initState();
    _topCryptos = CryptoService.fetchTopCryptos();
    _cryptoNews = CryptoService.fetchCryptoNews();
  }

  @override
  Widget build(BuildContext context) {

    _topCryptos = CryptoService.fetchTopCryptos();
    _cryptoNews = CryptoService.fetchCryptoNews();
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Dinissa'),
        ),
        leading: Icon(Icons.settings),
        actions: [
          Padding(
              padding: EdgeInsets.only(right:  12.0),
            child: Icon(Icons.opacity),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding (
            padding: EdgeInsets.only(top: 20.0),
            child: SizedBox(
                height: 40,
                // Adjust the height as needed
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Cryptocurrency...',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                  ),
                  onChanged: (value) {
                    // You can handle search here
                  },
                )
            ),
          ),
            _balanceCard(context),
            shortcutsSection(context: context),
            // Text(
            //   "Top Cryptocurrencies",
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 16),
            FutureBuilder<List<dynamic>>(
              future: _topCryptos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var crypto = snapshot.data![index];
                      return CryptoCard(crypto: crypto);
                    },
                  );
                }
              },
            ),
            SizedBox(height: 16),
            Text(
              "Latest News",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            FutureBuilder<List<dynamic>>(
              future: _cryptoNews,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      var news = snapshot.data![index];
                      return NewsCard(news: news);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(initialIndex: 0),
    );
  }











  // List of options for the dropdown
  final List<String> options = ['Crypto Balance', 'Fiat Balance'];

  // Variable to store the currently selected option
  String selectedOption = 'Crypto Balance';

  // Balances
  final Map<String, String> balances = {
    'Crypto Balance': '30000 USDT',
    'Fiat Balance': '120000 NGN',
  };

  // Variable to track whether the balance is visible or hidden
  bool isBalanceVisible = true;

  Widget _balanceCard(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Dropdown select
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                // Value currently selected
                value: selectedOption,
                // List of dropdown items
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                // Event handler when a new item is selected
                onChanged: (String? newValue) {
                  // Update the selected option
                  if (newValue != null) {
                    setState(() {
                      selectedOption = newValue;
                    });
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Add funds logic here
                },
                child: Text("Add Funds"),
              ),

            ],
          ),
          // Balance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  Text(
                    isBalanceVisible ? balances[selectedOption] ?? '' : '*********', // Hide balance if visibility is toggled off
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(isBalanceVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isBalanceVisible = !isBalanceVisible;
                      });
                    },
                  ),
                ],
              ),
              // Add Funds button aligned with the balance column

            ],
          ),
        ],
      ),
    );
  }

}