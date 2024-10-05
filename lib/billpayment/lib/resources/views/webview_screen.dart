// import 'package:flutter/material.dart';
//
// class WebViewScreen extends StatefulWidget {
//   final String redirectUrl;
//
//   const WebViewScreen({super.key, required this.redirectUrl});
//
//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }
//
// class _WebViewScreenState extends State<WebViewScreen> {
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     // Enable hybrid composition.
//     WebView.platform = SurfaceAndroidWebView();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text("Redirect Page"),
//       ),
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl: widget.redirectUrl,
//             javascriptMode: JavascriptMode.unrestricted,
//             onPageStarted: (String url) {
//               setState(() {
//                 isLoading = true;
//               });
//             },
//             onPageFinished: (String url) {
//               setState(() {
//                 isLoading = false;
//               });
//             },
//           ),
//           isLoading
//               ? const Center(child: CircularProgressIndicator())
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
