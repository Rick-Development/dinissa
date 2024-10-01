
import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';

void customBottomSheetWidget({
  required BuildContext context,
  double initialHeight = 0.5,
  double maxHeight = 1.0,
  required Widget child
}) {
   showModalBottomSheet(
       context: context,
       elevation: 3,
       builder: (context) {
         return DraggableScrollableSheet(
             initialChildSize: initialHeight,
             minChildSize: bottomSheetMinSize,
             maxChildSize: maxHeight,
             expand: false,
             builder: (_, controller) {
               return child;
             }
         );
       },
       isScrollControlled: true,
       shape: const RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
               topRight: Radius.circular(8.0),
               topLeft: Radius.circular(8.0)
           )
       ),
       backgroundColor: Theme.of(context).cardColor
   );
 }