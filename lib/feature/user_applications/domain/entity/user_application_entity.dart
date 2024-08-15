import 'package:adoptapet/app/app.dart';

import '../../../pet_details/domain/entity/pet_details_entity.dart';

class UserApplicationEntity{
  final String? appid;
  final String name;
  final String email;
  final String phonenumber;
  final int age;
  final String occupation;
  final String address;
  final bool haveDog;
  final String livingSituation;
  final String reasonsForAdopting;
  final PetDetailsEntity? petDetails;

  UserApplicationEntity({
    this.appid,
    required this.name,
    required this.email,
    required this.age,
    required this.occupation,
    required this.address,
    required this.phonenumber,
    required this.haveDog,
    required this.livingSituation,
    required this.reasonsForAdopting,
    this.petDetails
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
        petDetails,
      ];
}