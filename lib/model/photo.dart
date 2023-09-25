import 'package:band_open_api/model/author.dart';

class Photo {
  final int height;
  final int width;
  final int createdAt;
  final int commentCount;
  final String url;
  final int emotionCount;
  final String photoKey;
  final Author author;
  final String photoAlbumKey;
  final bool isVideoThumbnail;

  const Photo({
    this.height = 0,
    this.width = 0,
    this.createdAt = 0,
    this.commentCount = 0,
    this.url = '',
    this.emotionCount = 0,
    this.photoKey = '',
    this.author = const Author(),
    this.photoAlbumKey = '',
    this.isVideoThumbnail = false,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      height: json['height'] as int? ?? 0,
      width: json['width'] as int? ?? 0,
      createdAt: json['created_at'] as int? ?? 0,
      commentCount: json['comment_count'] as int? ?? 0,
      url: json['url'] as String? ?? '',
      emotionCount: json['emotion_count'] as int? ?? 0,
      photoKey: json['photo_key'] as String? ?? '',
      author: Author.fromJson(json['author'] as Map<String, dynamic>? ?? {}),
      photoAlbumKey: json['photo_album_key'] as String? ?? '',
      isVideoThumbnail: json['is_video_thumbnail'] as bool? ?? false,
    );
  }

  @override
  String toString() {
    return [
      'height: $height',
      'width: $width',
      'createdAt: $createdAt',
      'commentCount: $commentCount',
      'url: $url',
      'emotionCount: $emotionCount',
      'photoKey: $photoKey',
      'author: {${author.toString().split('\n').join(', ')}}',
      'photoAlbumKey: $photoAlbumKey',
      'isVideoThumbnail: $isVideoThumbnail',
    ].join('\n');
  }
}
