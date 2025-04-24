import 'package:dinissa/util/api_url.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/api_service.dart';

class UserController extends GetxController {
  bool isLoading = true;
  ApiService apiService = ApiService();
  GetStorage storage = GetStorage();

  Future<dynamic> fetchUser() async {
    String token = storage.read('userToken').toString();
    String url =  ApiUrl.userDetains;
    print(token); // Pass your token here

    // Map<String, dynamic> response =
        // await apiService.makePostRequest(url, params, token);
         Map<String, dynamic> response = await apiService.makeGetRequest(url, token);

    print(response); // Prints the response or error messageApi
  }
}
