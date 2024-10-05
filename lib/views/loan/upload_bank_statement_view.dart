// file: lib/views/upload_bank_statement_view.dart
import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/file_upload_controller.dart';
import '../../widgets/custom_back_button.dart';
import 'loan_offer_form.dart';

class UploadBankStatementView extends StatefulWidget {

  const UploadBankStatementView({super.key});
  @override
  State<UploadBankStatementView> createState() => UploadBankStatementViewState();
}

class UploadBankStatementViewState extends State<UploadBankStatementView>{

  final FileUploadController controller = Get.put(FileUploadController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Add Bank Statement'),
       leading: customBackButton(context: context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.selectedFile.value != null) {
                return Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.insert_drive_file, size: 40, color: Colors.red),
                      title: Text(controller.selectedFile.value!.fileName),
                      subtitle: Text('${controller.selectedFile.value!.fileSize} • ${controller.selectedFile.value!.fileDate}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.removeFile();
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    controller.pickFile();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.secondaryColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, color: AppColors.secondaryColor),
                        SizedBox(width: 10),
                        Text('Upload Bank Statement', style: TextStyle(color: AppColors.secondaryColor)),
                      ],
                    ),
                  ),
                );
              }
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle the save action
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoanOfferFormScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondaryColor,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Save', style: TextStyle(fontSize: 18,color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
