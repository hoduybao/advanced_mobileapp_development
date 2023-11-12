import 'package:advanced_mobileapp_development/model/rate-dto.dart';

class TutorDTO{
  String id;
  String name;
  String avatar;
  String country;
  String avatarCountry;
  int rating;
  List<String> specialities=[];
  String description;
  String linkVideoIntro;
  String education;
  String languages;
  String interests;
  String experience;
  List<Rate> ratings=[];

  TutorDTO(
      this.id,
      this.name,
      this.avatar,
      this.country,
      this.avatarCountry,
      this.rating,
      this.specialities,
      this.description,
      this.linkVideoIntro,
      this.education,
      this.languages,
      this.interests,
      this.experience,
      this.ratings);
}