abstract class SocialMediaEvent {}

class LoadSocialMedia extends SocialMediaEvent {}

class AddSocialMedia extends SocialMediaEvent {
  final Map<String, dynamic> media;

  AddSocialMedia(this.media);
}

class RemoveSocialMedia extends SocialMediaEvent {
  Map<String, dynamic> media;

  RemoveSocialMedia(this.media);
}
