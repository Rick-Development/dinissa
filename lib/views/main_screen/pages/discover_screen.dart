import 'package:dinissa/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  late Future<List<dynamic>> cryptoData;

  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    cryptoData = _apiService.fetchCryptoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: cryptoData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.black,
                  child: const Column(
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tokens (${snapshot.data!.length})',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Text('Sort By', style: TextStyle(fontSize: 16.sp)),
                          SizedBox(width: 8.0.w),
                          DropdownButton<String>(
                            value: 'Market Cap',
                            items: <String>['Market Cap', 'Price']
                                .map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return Card(
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(item['image'],
                                  width: 40.w, height: 40.h),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['name']),
                                  Text('Price: \$${item['current_price']}'),
                                  Text('Market Cap: \$${item['market_cap']}'),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '${item['price_change_percentage_24h'].toStringAsFixed(2)}%',
                                style: TextStyle(
                                  color:
                                      item['price_change_percentage_24h'] >= 0
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
