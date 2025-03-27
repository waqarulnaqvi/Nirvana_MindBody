class AudioPlayerModel{
  String title;
  String subtitle;
  String audioUrl;
  String imageUrl;
  String firebaseImageUrl;
  String? youtubeUrl ;

  AudioPlayerModel({required this.title,required this.subtitle, required this.audioUrl, required this.imageUrl,required this.firebaseImageUrl,this.youtubeUrl});
}