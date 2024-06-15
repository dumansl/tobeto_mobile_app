class MediaAccountModel {
  final String behance;
  final String dribble;
  final String instagram;
  final String linkedIn;
  final String twitter;

  MediaAccountModel({
    required this.behance,
    required this.dribble,
    required this.instagram,
    required this.linkedIn,
    required this.twitter,
  });

  factory MediaAccountModel.fromMap(Map<String, dynamic> map) {
    return MediaAccountModel(
      behance: map['behance'],
      dribble: map['dribble'],
      instagram: map['instagram'],
      linkedIn: map['linkedIn'],
      twitter: map['twitter'],
    );
  }
}
