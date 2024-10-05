import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/loan/loan_offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../widgets/custom_back_button.dart';

class EmploymentDetailsScreen extends StatefulWidget {
  const EmploymentDetailsScreen({super.key});

  @override
  _EmploymentDetailsScreenState createState() => _EmploymentDetailsScreenState();
}

class _EmploymentDetailsScreenState extends State<EmploymentDetailsScreen> {
  PlatformFile? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: customBackButton(context: context),
        title: const Text(
          'Employment Details',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildTextField(
              label: 'How much do they pay you per month',
              prefixIcon: const Text('₦', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Employment status',
              hintText: 'Select employment status',
              onTap: () => _showEmploymentStatusModal(context),
              readOnly: true,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Company Name',
            ),
            // SizedBox(height: 20),
            // _buildTextField(
            //   label: 'Company ID',
            // ),
            const SizedBox(height: 20),
            _buildTextField(
              label: 'Employee ID',
            ),
            const SizedBox(height: 20),
            _buildFileUploadField(
              label: 'Upload Educational Qualification',
              onTap: () async {
                await _pickFile();
              },
            ),
            if (_selectedFile != null) _buildFilePreview(_selectedFile!),
            const Spacer(),
           const Text(
              'We ask you about your income to better understand your needs',
              style: TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Save action
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoanOfferScreen()));
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    String? hintText,
    Widget? prefixIcon,
    bool readOnly = false,
    VoidCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        const SizedBox(height: 10),
        TextField(
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon != null
                ? Center(
              widthFactor: 2,
              child: prefixIcon,
            )
                : null,
            contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            filled: true,
            fillColor: const Color(0xFFf2f6fa),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          readOnly: readOnly,
          onTap: onTap,
        ),
      ],
    );
  }

  Widget _buildFileUploadField({
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFf2f6fa),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.upload_file, color: Colors.grey),
                const SizedBox(width: 10),
                Text(
                  _selectedFile?.name ?? 'Upload File',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilePreview(PlatformFile file) {
    if (file.extension == 'jpg' || file.extension == 'png' || file.extension == 'jpeg') {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 200,
        child: Image.memory(file.bytes!),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'File selected: ${file.name}',
          style: const TextStyle(color: Colors.black, fontSize: 14),
        ),
      );
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  void _showEmploymentStatusModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Employment Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: const Text('Employed'),
                onTap: () {
                  Navigator.pop(context);
                  // Set Employment status value
                },
              ),
              ListTile(
                title: const Text('Self-employed'),
                onTap: () {
                  Navigator.pop(context);
                  // Set Employment status value
                },
              ),
              ListTile(
                title: const Text('Unemployed'),
                onTap: () {
                  Navigator.pop(context);
                  // Set Employment status value
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
