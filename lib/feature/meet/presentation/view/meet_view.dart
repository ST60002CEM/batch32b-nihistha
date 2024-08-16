// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:intl/intl.dart';
//
// final mainColor = Color(0xff84D5D8);
//
// final scheduleMeetProvider = StateNotifierProvider<ScheduleMeetNotifier, ScheduleMeetState>((ref) {
//   return ScheduleMeetNotifier();
// });
//
// class ScheduleMeetState {
//   final DateTime selectedDate;
//   final TimeOfDay selectedTime;
//
//   ScheduleMeetState({required this.selectedDate, required this.selectedTime});
//
//   ScheduleMeetState copyWith({DateTime? selectedDate, TimeOfDay? selectedTime}) {
//     return ScheduleMeetState(
//       selectedDate: selectedDate ?? this.selectedDate,
//       selectedTime: selectedTime ?? this.selectedTime,
//     );
//   }
// }
//
// class ScheduleMeetNotifier extends StateNotifier<ScheduleMeetState> {
//   ScheduleMeetNotifier() : super(ScheduleMeetState(selectedDate: DateTime.now(), selectedTime: TimeOfDay(hour: 13, minute: 0)));
//
//   void updateDate(DateTime date) {
//     state = state.copyWith(selectedDate: date);
//   }
//
//   void updateTime(TimeOfDay time) {
//     state = state.copyWith(selectedTime: time);
//   }
// }
//
// class ScheduleMeetScreen extends ConsumerStatefulWidget {
//
//   @override
//   _ScheduleMeetScreenState createState() => _ScheduleMeetScreenState();
// }
//
// class _ScheduleMeetScreenState extends ConsumerState<ScheduleMeetScreen> {
//   Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: ref.read(scheduleMeetProvider).selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(Duration(days: 365)),
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: mainColor,
//             colorScheme: ColorScheme.light(primary: mainColor),
//             buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       ref.read(scheduleMeetProvider.notifier).updateDate(picked);
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context, WidgetRef ref) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: ref.read(scheduleMeetProvider).selectedTime,
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: mainColor,
//             colorScheme: ColorScheme.light(primary: mainColor),
//             buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null && picked.hour >= 13 && picked.hour < 18) {
//       ref.read(scheduleMeetProvider.notifier).updateTime(picked);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please select a time between 1 PM and 6 PM')),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(scheduleMeetProvider);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Schedule Meet-up'),
//         backgroundColor: mainColor,
//       ),
//       body: Container(
//         color: mainColor.withOpacity(0.1),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 'Select Date and Time',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainColor.withOpacity(0.8)),
//               ),
//               SizedBox(height: 20),
//               Card(
//                 elevation: 4,
//                 child: ListTile(
//                   title: Text("Date: ${DateFormat('yyyy-MM-dd').format(state.selectedDate)}"),
//                   trailing: Icon(Icons.calendar_today, color: mainColor),
//                   onTap: () => _selectDate(context, ref),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Card(
//                 elevation: 4,
//                 child: ListTile(
//                   title: Text("Time: ${state.selectedTime.format(context)}"),
//                   trailing: Icon(Icons.access_time, color: mainColor),
//                   onTap: () => _selectTime(context, ref),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   child: Text('Schedule Meet-up'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: mainColor,
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//                     textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                   ),
//                   onPressed: () {
//                     // TODO: Implement the scheduling logic
//                     print('Scheduled for ${DateFormat('yyyy-MM-dd').format(state.selectedDate)} at ${state.selectedTime.format(context)}');
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:adoptapet/feature/meet/presentation/view_model/meet_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:adoptapet/feature/meet/domain/entity/meet_entity.dart';

final mainColor = Color(0xff84D5D8);

final scheduleMeetProvider = StateNotifierProvider<ScheduleMeetNotifier, ScheduleMeetState>((ref) {
  return ScheduleMeetNotifier();
});

class ScheduleMeetState {
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  ScheduleMeetState({required this.selectedDate, required this.selectedTime});

  ScheduleMeetState copyWith({DateTime? selectedDate, TimeOfDay? selectedTime}) {
    return ScheduleMeetState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}

class ScheduleMeetNotifier extends StateNotifier<ScheduleMeetState> {
  ScheduleMeetNotifier() : super(ScheduleMeetState(selectedDate: DateTime.now(), selectedTime: TimeOfDay(hour: 13, minute: 0)));

  void updateDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void updateTime(TimeOfDay time) {
    state = state.copyWith(selectedTime: time);
  }
}

class ScheduleMeetScreen extends ConsumerStatefulWidget {
  final String? petId;

  const ScheduleMeetScreen({Key? key, required this.petId}) : super(key: key);

  @override
  _ScheduleMeetScreenState createState() => _ScheduleMeetScreenState();
}

class _ScheduleMeetScreenState extends ConsumerState<ScheduleMeetScreen> {
  Future<void> _selectDate(BuildContext context, WidgetRef ref) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: ref.read(scheduleMeetProvider).selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: mainColor,
            colorScheme: ColorScheme.light(primary: mainColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      ref.read(scheduleMeetProvider.notifier).updateDate(picked);
    }
  }

  Future<void> _selectTime(BuildContext context, WidgetRef ref) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: ref.read(scheduleMeetProvider).selectedTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: mainColor,
            colorScheme: ColorScheme.light(primary: mainColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked.hour >= 13 && picked.hour < 18) {
      ref.read(scheduleMeetProvider.notifier).updateTime(picked);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a time between 1 PM and 6 PM')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(scheduleMeetProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Meet-up'),
        backgroundColor: mainColor,
      ),
      body: Container(
        color: mainColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Select Date and Time',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainColor.withOpacity(0.8)),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Date: ${DateFormat('yyyy-MM-dd').format(state.selectedDate)}"),
                  trailing: Icon(Icons.calendar_today, color: mainColor),
                  onTap: () => _selectDate(context, ref),
                ),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 4,
                child: ListTile(
                  title: Text("Time: ${state.selectedTime.format(context)}"),
                  trailing: Icon(Icons.access_time, color: mainColor),
                  onTap: () => _selectTime(context, ref),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  child: Text('Schedule Meet-up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    final meetEntity = MeetEntity(
                      scheduledDate: DateFormat('yyyy-MM-dd').format(state.selectedDate),
                      petId: widget.petId,
                      pickupTime: state.selectedTime.format(context),
                    );
                    ref.read(meetViewModelProvider.notifier).scheduleMeet(meetEntity);
                    // TODO: Use the meetEntity to schedule the meet-up
                    print('Scheduled for ${meetEntity.scheduledDate} at ${meetEntity.pickupTime}');
                    // Here you would typically call a method on your view model to schedule the meet-up
                    // For example: ref.read(meetViewModelProvider.notifier).scheduleMeet(meetEntity);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}