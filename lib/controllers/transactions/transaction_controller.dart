import 'package:get/get.dart';

class TransactionController extends GetxController {
  // Explicitly typed as RxList<Map<String, dynamic>>
  RxList<Map<String, dynamic>> transactionList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var selectedFilter = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactionHistory();
  }

  Future<void> fetchTransactionHistory() async {
    isLoading.value = true;

    transactionList.value = [
      {'id': 1, 'date': '2024-08-01', 'time': '08:30:12', 'type': 'Deposit', 'amount': 1500.00, 'description': 'Monthly Salary', 'details': 'Salary from ABC Corp', 'status': 'Completed'},
      {'id': 2, 'date': '2024-08-02', 'time': '12:15:45', 'type': 'Purchase', 'amount': -120.00, 'description': 'Online Shopping', 'details': 'Bought electronics', 'status': 'Completed'},
      {'id': 3, 'date': '2024-08-03', 'time': '09:50:33', 'type': 'Transfer', 'amount': -500.00, 'description': 'Rent Payment', 'details': 'Paid rent for August', 'status': 'Pending'},
      {'id': 4, 'date': '2024-08-04', 'time': '17:22:19', 'type': 'Withdrawal', 'amount': -100.00, 'description': 'ATM Withdrawal', 'details': 'ATM at downtown branch', 'status': 'Completed'},
      {'id': 5, 'date': '2024-08-05', 'time': '14:05:03', 'type': 'Deposit', 'amount': 200.00, 'description': 'Freelance Work', 'details': 'Logo design payment', 'status': 'Completed'},
      {'id': 6, 'date': '2024-08-06', 'time': '10:45:21', 'type': 'Purchase', 'amount': -45.00, 'description': 'Coffee Shop', 'details': 'Morning espresso', 'status': 'Completed'},
      {'id': 7, 'date': '2024-08-07', 'time': '11:30:47', 'type': 'Deposit', 'amount': 300.00, 'description': 'Stock Dividends', 'details': 'Q2 earnings from stocks', 'status': 'Completed'},
      {'id': 8, 'date': '2024-08-08', 'time': '16:18:29', 'type': 'Transfer', 'amount': -250.00, 'description': 'Credit Card Payment', 'details': 'Visa card payment', 'status': 'Pending'},
      {'id': 9, 'date': '2024-08-09', 'time': '19:05:11', 'type': 'Purchase', 'amount': -30.00, 'description': 'Restaurant', 'details': 'Dinner with friends', 'status': 'Completed'},
      {'id': 10, 'date': '2024-08-10', 'time': '13:45:56', 'type': 'Deposit', 'amount': 75.00, 'description': 'Gift from Friend', 'details': 'Birthday present', 'status': 'Completed'},
      {'id': 11, 'date': '2024-08-11', 'time': '07:40:28', 'type': 'Withdrawal', 'amount': -50.00, 'description': 'Cash Withdrawal', 'details': 'Morning ATM withdrawal', 'status': 'Completed'},
      {'id': 12, 'date': '2024-08-12', 'time': '15:50:34', 'type': 'Deposit', 'amount': 500.00, 'description': 'Bonus', 'details': 'Quarterly performance bonus', 'status': 'Completed'},
      {'id': 13, 'date': '2024-08-13', 'time': '09:30:20', 'type': 'Purchase', 'amount': -200.00, 'description': 'Groceries', 'details': 'Supermarket shopping', 'status': 'Completed'},
      {'id': 14, 'date': '2024-08-14', 'time': '18:12:55', 'type': 'Transfer', 'amount': -150.00, 'description': 'Utility Bill', 'details': 'Electricity bill payment', 'status': 'Pending'},
      {'id': 15, 'date': '2024-08-15', 'time': '12:20:40', 'type': 'Deposit', 'amount': 100.00, 'description': 'Refund', 'details': 'Refund for returned item', 'status': 'Completed'},
      {'id': 16, 'date': '2024-08-16', 'time': '20:00:30', 'type': 'Purchase', 'amount': -60.00, 'description': 'Cinema', 'details': 'Movie night', 'status': 'Completed'},
      {'id': 17, 'date': '2024-08-17', 'time': '14:35:17', 'type': 'Deposit', 'amount': 450.00, 'description': 'Freelance Project', 'details': 'Payment for mobile app development', 'status': 'Completed'},
      {'id': 18, 'date': '2024-08-18', 'time': '10:25:50', 'type': 'Withdrawal', 'amount': -100.00, 'description': 'ATM Withdrawal', 'details': 'ATM at mall', 'status': 'Completed'},
      {'id': 19, 'date': '2024-08-19', 'time': '11:45:12', 'type': 'Purchase', 'amount': -90.00, 'description': 'Clothing', 'details': 'Bought a new jacket', 'status': 'Completed'},
      {'id': 20, 'date': '2024-08-20', 'time': '08:15:30', 'type': 'Deposit', 'amount': 600.00, 'description': 'Tax Refund', 'details': 'Federal tax refund', 'status': 'Completed'},
    ];


    isLoading.value = false;
  }

  void filterTransactions(String filter) {
    selectedFilter.value = filter;
    // Implement filtering logic based on the selected filter
  }

  void viewTransactionDetails(int transactionId) {
    // Implement logic to navigate to transaction details screen
  }
}
