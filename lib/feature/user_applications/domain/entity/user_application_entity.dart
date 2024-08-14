import '../../../pet_details/domain/entity/pet_details_entity.dart';

class ApplicationEntity {
  final String? appid;
  final String? petId;
  final String? name;
  final String? email;
  final String? phonenumber;
  final PetDetailsEntity? petDetails; // Add this line if you want to manage pet details

  ApplicationEntity({
    this.appid,
    this.petId,
    this.name,
    this.email,
    this.phonenumber,
    this.petDetails,
  });

  ApplicationEntity copyWith({
    String? appid,
    String? petId,
    String? name,
    String? email,
    String? phonenumber,
    PetDetailsEntity? petDetails,
  }) {
    return ApplicationEntity(
      appid: appid ?? this.appid,
      petId: petId ?? this.petId,
      name: name ?? this.name,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      petDetails: petDetails ?? this.petDetails,
    );
  }
}
