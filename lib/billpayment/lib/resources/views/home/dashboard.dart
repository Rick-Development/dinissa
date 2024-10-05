import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../app/Models/user/User.dart';
import '../../../app/http/controllers/user_controller.dart';
import '../../utils/app_colors.dart';
import '../../widgets/usable_dashboard_slider.dart';
import '../../widgets/balance_card.dart';
import '../../widgets/dashboard_topbar.dart';
import '../../widgets/useable_dashboard_card.dart';
import 'add_money/add_money.dart';
import 'bills_payment/bills_payment.dart';
import 'buy_giftcard/buy_giftcard.dart';
import 'crypto/crypto_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardView> {
  final bool _isBalanceVisible = true;


  @override
  Widget build(BuildContext context) {
   UserController userController = Get.put(UserController());
    GetStorage storage = GetStorage();
    var data = json.decode(storage.read('dashboard'));
    // print(data);
    // data['data'].forEach((k,v) {
    //   // print("\n");;
    //     print("$k : $v");
    // print("\n");
    // });
    final controller = SidebarXController(selectedIndex: 0, extended: true);
    final key = GlobalKey<ScaffoldState>();
    User user = User();
    // return  Obx(() {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const DasboardTopBar(),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Dashboard Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Handle navigation
                },
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {
                  // Handle navigation
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Handle navigation
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
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
                                // Get.snackbar("Message", 'Coming Soon...');
                                // Navigator.of(context).push(MaterialPageRoute(
                                //   builder: (_) => const TransferView(),
                                // ));
                                Get.to(const AddMoney());
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 35,
                                child: Text(
                                  'Add Money',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // const Gap(28),
                          const Spacer(
                            flex: 1,
                          ),
                          Expanded(
                            flex: 4,
                            child: InkWell(
                              onTap: () =>
                              {
                                // Get.snackbar("Message", 'Coming Soon...')
                                Get.to( CryptoView(), arguments: ['']),
                                // Get.to(WebsiteViewer(url: WebRoutes.tawktoLink,title: 'Trade Crypto',))
                              },
                              // onTap: () async {
                              //   var contact = "2348111218116";
                              //   var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I want to trade crpto";
                              //   var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I want to trade crpto')}";
                              //
                              //   try{
                              //     if(Platform.isIOS){
                              //       await launchUrl(Uri.parse(iosUrl));
                              //     }
                              //     else{
                              //       await launchUrl(Uri.parse(androidUrl));
                              //     }
                              //   } on Exception{
                              //     EasyLoading.showError('WhatsApp is not installed.');
                              //   }
                              // },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 35,

                                child: Text(
                                  'Trade Crypto',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
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
                      const Gap(33),
                      const Gap(7),

                      const Gap(13),
                      const UsableDashboardSlider(imagePaths: [
                        'assets/images/img_3.png',
                        'assets/images/dash_image.png',
                        'assets/images/img_2.png',
                      ]),

                      const Gap(16),
                      Wrap(
                        spacing: 14,
                        runSpacing: 14,
                        children: [
                          InkWell(
                            onTap: () =>
                            {
                              Get.to( const BuyGiftcardView())
                            },
                            child: const UsableDashboardCard(
                              backgroundColor: Color(0xBFC3E9E9),
                              title: 'Buy Gift Card',
                              iconBackgroundColor: Color(0xFF39D6D6),
                              icon: 'assets/svgs/dash_giftcard.svg',
                              // view:  null,
                            ),
                          ),
                          InkWell(
                              onTap: () async {
                                var contact = "2348111218116";
                                var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I want to Sell Giftcard";
                                var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I want to Sell Giftcard')}";

                                try{
                                  if(Platform.isIOS){
                                    await launchUrl(Uri.parse(iosUrl));
                                  }
                                  else{
                                    await launchUrl(Uri.parse(androidUrl));
                                  }
                                } on Exception{
                                  EasyLoading.showError('WhatsApp is not installed.');
                                }
                              },
                              // onTap: () =>
                              // {
                              //   // Get.to(WebsiteViewer(url: WebRoutes.tawktoLink,title: 'Sell Giftcard',))
                              // const SellGiftcardView()
                              // },
                              child: const UsableDashboardCard(
                                backgroundColor: Color(0xBFF7A9B7),
                                title: 'Sell Giftcard',
                                iconBackgroundColor: Color(0xFF2083AE),
                                icon: 'assets/svgs/dash_crypto.svg',
                              )),
                          InkWell(
                              onTap: () =>
                              {
                                Get.to(const BillsPaymentView())
                              },
                              child: const UsableDashboardCard(
                                backgroundColor: Color(0xBFF7F4A9),
                                title: 'Bill Payment',
                                iconBackgroundColor: Color(0xFF752999),
                                icon: 'assets/svgs/bill.svg',)
                          ),

                          InkWell(
                              onTap: () =>
                              {
                                // Get.to(const FlightReservation())
                                Get.snackbar("Message", 'Coming Soon...')
                              },
                              child: const UsableDashboardCard(
                                backgroundColor: Color(0xFF83EFFF),
                                title: 'Flight Reservation',
                                iconBackgroundColor: Color(0xFFD90429),
                                icon: 'assets/svgs/flight.svg',)
                          ),

                        ],
                      ),


                      const Gap(16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transaction History'),
                          InkWell(
                            child: Text('See all'),
                          )
                        ],
                      ),
                      const Gap(26),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No Transaction')
                        ],
                      ),

                      Gap(MediaQuery
                          .of(context)
                          .padding
                          .bottom + 18),
                    ],
                  ),
                ),
              ),
              // Visibility(
              //     visible: liveChatController.isLiveChatActive.value,
              //     child: SizedBox( height: MediaQuery
              //             .of(context)
              //             .size
              //             .height * 0.6,
              //         width: MediaQuery
              //             .of(context)
              //             .size
              //             .width * 0.6,
              //         child: WebsiteViewer(url: WebRoutes.tawktoLink,)
              //     )),
              Visibility(
                  visible: false,
                  child: SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.6,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.6,
                    // child: Tawk(
                    //   directChatLink: WebRoutes.tawktoLink,
                    //   visitor: TawkVisitor(
                    //     name: User().fullName,
                    //     email: User().email,
                    //   ),
                    // ),
                  )),
            ],
          ),
        ),
      );
    // });
  }
}

Widget dashCard(BuildContext context,String balance) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFf2f9fc),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 100,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(11),
          Text(
            'Account balance',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.black.withOpacity(.8),
                ),
          ),
          // const Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // const Gap(8),
              Text(
                balance,

                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                  fontFamily: 'Roboto',
                    ),
              ),
              const Gap(8),
              const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
