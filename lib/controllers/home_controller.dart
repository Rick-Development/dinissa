import 'package:get/get.dart';
import 'package:dinissa/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  var topCryptos = <dynamic>[].obs;
  var cryptoNews = <dynamic>[].obs;
  var isLoading = true.obs;
  var hasError = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTopCryptos();
    fetchCryptoNews();
  }

  void fetchTopCryptos() async {
    try {
      isLoading(true);
      var data = await _apiService.fetchTopCryptos();
      topCryptos.assignAll(data);
      hasError(false);
    } catch (e) {
      hasError(true);
    } finally {
      isLoading(false);
    }
  }

  void fetchCryptoNews() async {
    try {
      isLoading(true);
      var data = await _apiService.fetchCryptoNews();
      cryptoNews.assignAll(data);
      hasError(false);
    } catch (e) {
      hasError(true);
    } finally {
      isLoading(false);
    }
  }
}
