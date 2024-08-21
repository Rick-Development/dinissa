import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/util/widgets/crypto_card.dart';
import 'package:dinissa/util/widgets/news_card.dart';
import 'package:dinissa/util/widgets/shortcut_widget.dart';
import '../../../util/widgets/balance_card.dart';
import '../../../controllers/home_controller.dart'; // Import the HomeController

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.0.w),
            child: const Icon(Icons.opacity),
          ),
        ],
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.hasError.value) {
          return const Center(child: Text('Error loading data'));
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BalanceCard(),
                Padding(
                  padding: EdgeInsets.only(top: 20.0.h),
                  child: shortcutsSection(context: context),
                ),
                SizedBox(height: 16.h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.topCryptos.length,
                  itemBuilder: (context, index) {
                    var crypto = controller.topCryptos[index];
                    return CryptoCard(crypto: crypto);
                  },
                ),
                SizedBox(height: 16.h),
                Text(
                  "Latest News",
                  style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.cryptoNews.length,
                  itemBuilder: (context, index) {
                    var news = controller.cryptoNews[index];
                    return NewsCard(news: news);
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
