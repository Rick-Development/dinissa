import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../widgets/custom_back_button.dart';

class EmploymentDetailsScreen extends StatefulWidget {
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
        title: Text(
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
            SizedBox(height: 20),
            _buildTextField(
              label: 'How much do they pay you per month',
              prefixIcon: Text('₦', style: TextStyle(color: Colors.black)),
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: 'Employment status',
              hintText: 'Select employment status',
              onTap: () => _showEmploymentStatusModal(context),
              readOnly: true,
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: 'Company Name',
            ),
            // SizedBox(height: 20),
            // _buildTextField(
            //   label: 'Company ID',
            // ),
            SizedBox(height: 20),
            _buildTextField(
              label: 'Employee ID',
            ),
            SizedBox(height: 20),
            _buildFileUploadField(
              label: 'Upload Educational Qualification',
              onTap: () async {
                await _pickFile();
              },
            ),
            if (_selectedFile != null) _buildFilePreview(_selectedFile!),
            Spacer(),
            Text(
              'We ask you about your income to better understand your needs',
              style: TextStyle(color: Colors.black, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                onPressed: () {
                  // Save action
                  print("Save tapped");
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
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
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(height: 10),
        TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: prefixIcon != null
                ? Center(
              widthFactor: 2,
              child: prefixIcon,
            )
                : null,
            contentPadding:
            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            filled: true,
            fillColor: Color(0xFFf2f6fa),
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
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFf2f6fa),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.upload_file, color: Colors.grey),
                SizedBox(width: 10),
                Text(
                  _selectedFile?.name ?? 'Upload File',
                  style: TextStyle(color: Colors.grey),
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
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 200,
        child: Image.memory(file.bytes!),
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'File selected: ${file.name}',
          style: TextStyle(color: Colors.black, fontSize: 14),
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
          padding: EdgeInsets.all(16.0),
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Employment Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListTile(
                title: Text('Employed'),
                onTap: () {
                  Navigator.pop(context);
                  // Set Employment status value
                },
              ),
              ListTile(
                title: Text('Self-employed'),
                onTap: () {
                  Navigator.pop(context);
                  // Set Employment status value
                },
              ),
              ListTile(
                title: Text('Unemployed'),
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
