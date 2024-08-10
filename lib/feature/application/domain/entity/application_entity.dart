import 'package:adoptapet/app/app.dart';

class ApplicationEntity{
  final String? appid;
  final String name;
  final String email;
  final String phonenumber;
  final int age;
  final String occupation;
  final String address;
  final String haveDog;
  final String livingSituation;
  final String reasonsForAdopting;
  final String petId;
  final String userId;

  ApplicationEntity({
    required this.appid,
    required this.name,
    required this.email,
    required this.age,
    required this.occupation,
    required this.address,
    required this.phonenumber,
    required this.haveDog,
    required this.livingSituation,
    required this.reasonsForAdopting,
    required this.petId,
    required this.userId,

});



  @override
  List<Object?> get props =>
      [appid,
        name,
        phonenumber,
        email,
        address,
        occupation,
        age,
        haveDog,
        reasonsForAdopting,
        livingSituation,
        petId,
        userId];
}