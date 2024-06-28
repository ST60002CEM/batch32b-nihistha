// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class PetListingView extends ConsumerStatefulWidget {
//   const PetListingView({super.key});
//
//   @override
//   ConsumerState<PetListingView> createState() => _PetListingViewState();
// }
//
// class _PetListingViewState extends ConsumerState<PetListingView> {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener(
//         onNotification: (notification) {
//           if (notification is ScrollEndNotification) {
//             // Scroll garda feri last ma ho ki haina bhanera check garne ani data call garne
//             if (_scrollController.position.extentAfter == 0) {
//               // Data fetch gara api bata
//               // ref.read(commentViewModelProvider.notifier).getComments();
//             }
//           }
//           return true;
//         },
//         child: Scaffold(
//           backgroundColor: Color(0xFFFEFAE0),
//           appBar: AppBar(
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 20.0), // Add padding to the left
//               child: Image.asset('assets/images/logo.png'),
//             ),
//             title: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Adopt',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextSpan(
//                     text: 'apet',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.orange,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             backgroundColor: Color(0xFFFEFAE0),
//           ),
//           body: RefreshIndicator(
//             // Yo chai pull to refresh ko lagi ho
//             color: Colors.green,
//             backgroundColor: Colors.amberAccent,
//             onRefresh: () async {
//               ref.read(commentViewModelProvider.notifier).resetState();
//             },
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView.separated(
//                     separatorBuilder: (context, index) => const Divider(),
//                     controller: _scrollController,
//                     itemCount: state.comments.length,
//                     physics: const AlwaysScrollableScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       final comment = state.comments[index];
//                       return ListTile(
//                         leading: Text(comment.id.toString()),
//                         title: Text(comment.name),
//                         subtitle: Text(comment.email),
//                       );
//                     },
//                   ),
//                 ),
//                 // Data load huda feri progress bar dekhaune natra banda garne
//                 if (state.isLoading)
//                   const CircularProgressIndicator(color: Colors.red),
//
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//         ));
//   }
// }
