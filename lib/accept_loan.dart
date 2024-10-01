import 'package:flutter/material.dart';
import 'package:flutter_app/app_colors.dart';
import 'package:flutter_app/dashed_line_painter.dart';
import 'package:flutter_app/loan_details.dart';

class AcceptLoan extends StatefulWidget {
  const AcceptLoan({super.key});

  @override
  State<AcceptLoan> createState() => _AcceptLoanState();
}

class _AcceptLoanState extends State<AcceptLoan> {
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top + 16,
              ),
              InkWell(
                onTap: Navigator.of(context).pop,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                height: 170,
                width: 170,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/images/confetti.jpg'),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'That was too easy!',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Congrats! You are eligible',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                height: 14,
              ),
              const Text(
                'Kindly allow 3-4hrs to reflect in your bank account',
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Stack(
                children: [
                  Container(
                    // height: 170,
                    // width: 170,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        ),
                    child: Image.asset('assets/images/bg.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 18,
                        ),
                        const Text(
                          'Transaction Summary',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: 300,
                          height:
                              1, // Height should match the strokeWidth in the painter
                          color: Colors.transparent,
                          child: CustomPaint(
                            painter: DashedLinePainter(
                              color: Colors.white,
                              dashWidth: 10,
                              dashSpace: 5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Purpose of loan',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14),
                            ),
                            const Text(
                              'School fees',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Next repayment date',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14),
                            ),
                            const Text(
                              '02/04/2021',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Interest rate',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14),
                            ),
                            const Text(
                              '10%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly payment',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14),
                            ),
                            const Text(
                              '₦ 5000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'No of payments',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14),
                            ),
                            const Text(
                              '24',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total payback amount',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 14),
                            ),
                            const Text(
                              '₦ 58,000',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red,
                      // fillColor: MaterialStateProperty.resolveWith<Color>(
                      //     (Set<MaterialState> states) {
                      //   if (states.contains(MaterialState.disabled)) {
                      //     return Colors.black;
                      //   }
                      //   return Colors.white;
                      // }),
                      value: agree,
                      onChanged: (val) {
                        setState(() {
                          agree = !agree;
                        });
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    // const SizedBox(
                    //   width: 4,
                    // ),
                    const Text(
                      'I agree to the Terms & Conditions and Policy',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const LoanDetails(),
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Accept loan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: Colors.white,
                    )),
                alignment: Alignment.center,
                child: const Text(
                  'Decline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
