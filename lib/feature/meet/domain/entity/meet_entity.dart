class MeetEntity{
  final String? id;
  final String scheduledDate;
  final String? petId;
  final String pickupTime;

  const MeetEntity({
    this.id,
    required this.scheduledDate,
    this.petId,
    required this.pickupTime,
  });

  @override
  List<Object?> get props =>
      [id, scheduledDate, petId, pickupTime];
}