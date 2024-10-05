import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_back_button.dart';
import 'claculate_loan.dart';

class LoanOfferFormScreen extends StatefulWidget {
  const LoanOfferFormScreen({super.key});

  @override
  _LoanOfferFormScreenState createState() => _LoanOfferFormScreenState();
}

class _LoanOfferFormScreenState extends State<LoanOfferFormScreen> {
  String selectedReason = 'Select a reason';

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // backgroundColor: Color(0xFF1F2D36),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Reason 1', style: TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    selectedReason = 'Reason 1';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Reason 2', style: TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    selectedReason = 'Reason 2';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Reason 3', style: TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    selectedReason = 'Reason 3';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF1F2D36),
      appBar: AppBar(
        // backgroundColor: Color(0xFF1F2D36),
        elevation: 0,
        leading: customBackButton(context: context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Improve your loan offer',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Share your work information to improve your chance of higher loan offers',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'How much do you want to borrow?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: '',
                hintStyle: const TextStyle(color: Colors.black54),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            Text(
              'You can up to 30k on first loan and up to 1m on subsequent loan',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Why are you want loan?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => _showBottomSheet(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedReason,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const Icon(Icons.arrow_drop_down, color: Colors.black),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You have a maximum of 24 months',
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 12,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Handle continue button action
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CalculateLoanScreen()));
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                  backgroundColor: AppColors.secondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
