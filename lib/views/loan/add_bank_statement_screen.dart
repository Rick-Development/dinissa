import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/loan/upload_bank_statement_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/bank_controller.dart';
import '../../widgets/custom_back_button.dart';

class AddBankStatementScreen extends StatefulWidget {

  const AddBankStatementScreen({super.key});

  @override
  State<AddBankStatementScreen> createState() => AddBankStatementScreenState();

}

  class AddBankStatementScreenState extends State<AddBankStatementScreen>{

  late  BankController bankController = Get.put(BankController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Add bank statement'),
        leading: customBackButton(context: context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This process attaches one of your other bank accounts to your Didipay profile. We’ll get your statement of account from the bank.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text('Your Bank', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Bank',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
              onChanged: (value) {
                bankController.filterBanks(value);
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: bankController.filteredBanks.length,
                  itemBuilder: (context, index) {
                    final bank = bankController.filteredBanks[index];
                    return ListTile(
                      leading: Image.network(bank.logoUrl, width: 40, height: 40),
                      title: Text(bank.name),
                      onTap: () {
                        // Handle bank selection
                      },
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue button press
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UploadBankStatementView()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Continue', style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
