import 'dart:convert';
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../app/Models/user/User.dart';
import '../../../app/http/controllers/crypto_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/balance_card.dart';
import '../../widgets/dashboard_topbar.dart';
import '../home/crypto/deposit/deposit_coin.dart';
import '../home/crypto/sell_crypto.dart';
import '../home/transfer/transfer_view.dart';
import '../home/withdrawal/withdrawal_by_card_view.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  late CryptoController cryptoController;
  final random_num = Random(2);
  GetStorage storage = GetStorage();
  bool showRecent = false;
  bool onAsset = false;
  String selected = 'All transactions';
  final dropdownItems = [
    'All transactions',
    'Bill Payment',
    'Buy Gift Card',
    'Wallet Top-Ups',
    'Withdrawals',
    'Virtual Card',
    'Crypto',
  ];

  @override
  void initState() {
    super.initState();
    cryptoController = Get.put(CryptoController());
    print("oj");
  }

  @override
  Widget build(BuildContext context) {
    // final WalletController walletController = Get.put(WalletController());
    // walletController.fetchResponse();
    //
    // Wallet wallet = Wallet();
    // Map<String, dynamic> currencyDatas = wallet.getCurrencyData();

    User user = User();
    // UserController userController = Get.put(UserController());
    GetStorage storage = GetStorage();
    var data = json.decode(storage.read('dashboard'));

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const DasboardTopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // const Gap(24),
              BalanceCard(balance:data['data']['total_site_balance'] ?? 0.00),
              const Gap(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const TransferView(),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:  AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(33),
                        ),
                        height: 40,
                        child: Text(
                          'Add Money',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const WithdrawalByCardView(),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(33),
                        ),
                        height: 40,
                        child: Text(
                          'Withdraw',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(43),
              if (!onAsset) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Asset',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            onAsset = !onAsset;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primaryColor,
                          ),
                          child: Text(
                            'Transaction',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(13),
                Column(
                  children: cryptoController.cryptoList.map((crypto) {
                    // Each `crypto` is a Map<String, dynamic>
                    String key = crypto.keys.first;
                    String symbol0 = crypto.keys.last; // Assuming each map has only one key-value pair
                    dynamic value = crypto[key];
                    dynamic symbol = crypto[symbol0];

                    // Generate random percentage between -50% and +50%
                    double randomPercent = (random_num.nextDouble() * 100) - 50;
                    String percent = "${randomPercent.toStringAsFixed(2)}%";

                    // Customize the Row widget as needed
                    return InkWell(
                      onTap: () {
                        storage.write('sell_crypto', {
                          'name': value,
                          'short_name': symbol,
                          'address': crypto['address']
                        });
                        Get.to(const SellCryptoScreen());
                      },
                      child: Column(
                        children: [
                          const Gap(10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: assetWidget(
                              context,
                              decrease: percent.startsWith('-') ? true : false,
                              percent: percent,
                              assetName: value,
                              amount: '0.0000 ${symbol.toUpperCase()}',
                              nairaAmount: '\$0.00',
                              img: symbol.toLowerCase(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const Gap(15),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CurrencyList extends StatelessWidget {
  final Map<String, dynamic> currencyDatas;

  const CurrencyList({super.key, required this.currencyDatas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(), // Prevent nested scrolling
      shrinkWrap: true, // Makes the ListView fit the content
      itemCount: currencyDatas.length,
      itemBuilder: (context, index) {
        String key = currencyDatas.keys.elementAt(index);
        var value = currencyDatas[key];
        print(value);
        return CurrencyCard(
          currencyKey: key,
          currencyFullname: value['currency_fullname'],
          currencySymbol: value['currency_symbol'],
          rate: value['rate'],
          isDefault: value['is_default'],
          createdAt: value['created_at'],
        );
      },
    );
  }
}

class CurrencyCard extends StatelessWidget {
  final String currencyKey;
  final String currencyFullname;
  final String currencySymbol;
  final String rate;
  final int isDefault;
  final String createdAt;

  const CurrencyCard({super.key, 
    required this.currencyKey,
    required this.currencyFullname,
    required this.currencySymbol,
    required this.rate,
    required this.isDefault,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(1),
      child: ListTile(
        title: Text("$currencyKey ($currencyFullname)"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Currency Symbol: $currencySymbol", style: const TextStyle(
              fontFamily: 'Roboto'
            ),),
            Text("Rate: $rate"),
            Text("Is Default: ${isDefault == 1 ? 'Yes' : 'No'}"),
            Text("Created At: $createdAt"),
          ],
        ),
      ),
    );
  }
}
Widget transactionHistoryWidget(
    BuildContext context, {
      String title = '',
      String amount = '',
      String svg = '',
    }) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/icons/$svg.svg', // Path to your SVG asset
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          amount,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.green, // Adjust color as needed
          ),
        ),
      ],
    ),
  );
}
