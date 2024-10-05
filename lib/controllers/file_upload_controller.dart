// file: lib/controllers/file_upload_controller.dart
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import '../models/file_model.dart';

class FileUploadController extends GetxController {
  var selectedFile = Rxn<FileModel>();

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      selectedFile.value = FileModel(
        fileName: file.name,
        fileSize: '${file.size / 1024} Kb',
        fileDate: DateTime.now().toString(),
        filePath: file.path!,
      );
    }
  }

  void removeFile() {
    selectedFile.value = null;
  }
}
