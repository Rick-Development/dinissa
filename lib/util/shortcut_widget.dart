
import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';


Widget shortcutsSection({
  required BuildContext context
}) {
  return Container(
    margin: EdgeInsets.only(top: 16.0),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Shortcuts',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.s,
            children: [
              InkWell(
                onTap: () {
                  // Handle onTap
                },
                child: shortcutItem(
                  context: context,
                  icon: Icons.mobile_screen_share,
                  label: 'Send',
                  iconBackground: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle onTap
                },
                child: shortcutItem(
                  context: context,
                  icon: Icons.wifi,
                  label: 'Receive',
                  iconBackground: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle onTap
                },
                child: shortcutItem(
                  context: context,
                  icon: Icons.bolt,
                  label: 'Swap',
                  iconBackground: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle onTap
                },
                child: shortcutItem(
                  context: context,
                  icon: Icons.credit_card,
                  label: 'Buy',
                  iconBackground: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  // Handle onTap
                },
                child: shortcutItem(
                  context: context,
                  icon: Icons.credit_card,
                  label: 'Sell',
                  iconBackground: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget shortcutItem({
  required IconData icon,
  required String label,
  required Color iconBackground,
  required BuildContext context,
}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.035),
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: AppConstants.secondaryColor,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 2,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          )
        ),
        SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    ),
  );
}
