import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget shortcutsSection({required BuildContext context}) {
  return Container(
    margin: EdgeInsets.only(top: 16.0.h),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12.0.h),
            child: Text(
              'Shortcuts',
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    margin: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width * 0.035).w),
    child: Column(
      children: [
        CircleAvatar(
            backgroundColor: AppColors.secondaryColor,
            child: SizedBox(
              width: (MediaQuery.of(context).size.width * 2).w,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )),
        SizedBox(height: 4.0.h),
        Text(
          label,
          style: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
