class MeditationModel {
  final int id;
  final String title;
  final String duration;
  final String audioUrl;
  final String imgUrl;

  MeditationModel({
    required this.id,
    required this.title,
    required this.duration,
    required this.audioUrl,
    required this.imgUrl,
  });

  factory MeditationModel.fromJson(Map json){
    return MeditationModel(
      id: json["id"],
      title: json["title"],
      duration: json["duration"],
      audioUrl: json["audioUrl"],
      imgUrl: json["imgUrl"],
    );
  }
}
