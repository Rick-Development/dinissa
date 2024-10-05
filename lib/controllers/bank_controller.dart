import 'package:get/get.dart';

import '../models/bank.dart';

class BankController extends GetxController {
  var banks = <Bank>[].obs; // Original list of banks
  var filteredBanks = <Bank>[].obs; // List to display (filtered or not)

  @override
  void onInit() {
    super.onInit();
    loadBanks();
  }

  void loadBanks() {
    var allBanks = [
      // Major Commercial Banks
      Bank(name: 'Access Bank Plc', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000014.png'),
      Bank(name: 'Zenith Bank Plc', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000015.png'),
      Bank(name: 'First Bank of Nigeria', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000016.png'),
      Bank(name: 'GTBank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000017.png'),
      Bank(name: 'United Bank for Africa (UBA)', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000018.png'),
      Bank(name: 'Ecobank Nigeria', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000019.png'),
      Bank(name: 'Stanbic IBTC Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000020.png'),
      Bank(name: 'Fidelity Bank Plc', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000021.png'),
      Bank(name: 'Polaris Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000022.png'),
      Bank(name: 'Union Bank of Nigeria', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000023.png'),
      Bank(name: 'Sterling Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000024.png'),
      Bank(name: 'Wema Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000025.png'),
      Bank(name: 'Unity Bank Plc', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000026.png'),

      // Microfinance Banks
      Bank(name: 'Accion Microfinance Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000027.png'),
      Bank(name: 'Advans La Fayette Microfinance Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000028.png'),
      Bank(name: 'Covenant Microfinance Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000029.png'),
      Bank(name: 'Finca Microfinance Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000030.png'),
      Bank(name: 'Fina Trust Microfinance Bank', logoUrl: 'https://cdn.jsdelivr.net/gh/wovenfinance/cdn@main/logos/000031.png'),
    ];

    banks.assignAll(allBanks);
    filteredBanks.assignAll(allBanks);
  }

  void filterBanks(String query) {
    if (query.isEmpty) {
      filteredBanks.assignAll(banks);
    } else {
      filteredBanks.assignAll(
        banks.where((bank) => bank.name.toLowerCase().contains(query.toLowerCase())).toList(),
      );
    }
  }
}
