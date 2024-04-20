const String tableNotes = 'assets';

class AssetsField {
  static final List<String> values = [
    "id",
    "surah",
    "gambar",
    "audio",
    "video"
  ];

  static const String id = '_id';
  static const String surah = 'surah';
  static const String gambar = 'gambar';
  static const String audio = 'audio';
  static const String video = 'video';
}

class Assets {
  final int? id;
  final String surah;
  final String gambar;
  final String audio;
  final String video;

  const Assets(
      {this.id,
      required this.surah,
      required this.gambar,
      required this.audio,
      required this.video});

  Assets copy(
          {int? id,
          String? surah,
          String? gambar,
          String? audio,
          String? video}) =>
      Assets(
        id: id ?? this.id,
        surah: surah ?? this.surah,
        gambar: gambar ?? this.gambar,
        audio: audio ?? this.audio,
        video: video ?? this.video,
      );
}
