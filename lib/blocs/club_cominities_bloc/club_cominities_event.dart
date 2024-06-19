abstract class ClubCominitiesEvent {}

class LoadClubCominities extends ClubCominitiesEvent {}

class AddClubCominities extends ClubCominitiesEvent {
  final Map<String, dynamic> club;

  AddClubCominities(this.club);
}

class RemoveClubCominities extends ClubCominitiesEvent {
  Map<String, dynamic> club;

  RemoveClubCominities(this.club);
}
