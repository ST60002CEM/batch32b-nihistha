// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class PetDetailsView extends ConsumerWidget {
//   const PetDetailsView({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 20.0), // Add padding to the left
//           child: Image.asset('assets/images/logo.png'),
//         ),
//         title: RichText(
//           text: const TextSpan(
//             children: [
//               TextSpan(
//                 text: 'Adopt',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//               TextSpan(
//                 text: 'apet',
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.orange,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // backgroundColor: Color(0xFFB2967D),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/images/dashboard_image.png', // Replace with your image asset
//               width: double.infinity,
//               height: 180,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Hi, I am Leah',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'I am over 1 years of age. I was rescued at the shelter because I was being abused at the streets. I may have a feisty personality but you can easily win me over.',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Breed: Labrador',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Gender: Female',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'Size: Big',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 24),
//                   Center(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.brown,
//                         padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(24),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Handle apply now button press
//                       },
//                       child: Text(
//                         'Apply Now',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
