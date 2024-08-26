import 'package:get/get.dart';

class SavingHistoryController extends GetxController {
  // Observable variables to manage state
  var historyList = <SavingHistoryItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch or initialize data
    fetchHistory();
  }

  void fetchHistory() {
    // This is where you would typically make an API call
    // For demonstration, we're using a static list
    historyList.value = [
      SavingHistoryItem(date: 'Oct 19, 2021', time: '3:30 PM', amount: '₦35,000', description: 'Savings via mastercard**** *** **** 0000'),
      SavingHistoryItem(date: 'Oct 20, 2021', time: '4:00 PM', amount: '₦72,000', description: 'Savings via visa**** *** **** 1111'),

      SavingHistoryItem(date: 'Jun 19, 2021', time: '3:30 PM', amount: '₦54,000', description: 'Savings via mastercard**** *** **** 0000'),
      SavingHistoryItem(date: 'May 20, 2021', time: '4:00 PM', amount: '₦29,000', description: 'Savings via visa**** *** **** 1111'),

      SavingHistoryItem(date: 'Mar 19, 2021', time: '3:30 PM', amount: '₦15,000', description: 'Savings via mastercard**** *** **** 0000'),
      SavingHistoryItem(date: 'Aug 20, 2021', time: '4:00 PM', amount: '₦22,000', description: 'Savings via visa**** *** **** 1111'),

      SavingHistoryItem(date: 'jan 19, 2021', time: '3:30 PM', amount: '₦50,000', description: 'Savings via mastercard**** *** **** 0000'),
      SavingHistoryItem(date: 'Feb 20, 2021', time: '4:00 PM', amount: '₦12,000', description: 'Savings via visa**** *** **** 1111'),
    ];
  }
}

class SavingHistoryItem {
  final String date;
  final String time;
  final String amount;
  final String description;

  SavingHistoryItem({
    required this.date,
    required this.time,
    required this.amount,
    required this.description,
  });
}
