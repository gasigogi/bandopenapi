import 'package:band_open_api/model/author.dart';
import 'package:band_open_api/model/photo.dart';
import 'package:band_open_api/model/sticker.dart';

class Comment {
  final bool isAudioIncluded;
  final int createdAt;
  final int emotionCount;
  final String commentKey;
  final Sticker sticker;
  final Photo photo;
  final String postKey;
  final Author author;
  final String bandKey;
  final String content;

  const Comment({
    this.isAudioIncluded = false,
    this.createdAt = 0,
    this.emotionCount = 0,
    this.commentKey = '',
    this.sticker = const Sticker(),
    this.photo = const Photo(),
    this.postKey = '',
    this.author = const Author(),
    this.bandKey = '',
    this.content = '',
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      isAudioIncluded: json['isAudioIncluded'] as bool? ?? false,
      createdAt: json['created_at'] as int? ?? 0,
      emotionCount: json['emotion_count'] as int? ?? 0,
      commentKey: json['comment_key'] as String? ?? '',
      sticker: Sticker.fromJson(json['sticker'] as Map<String, dynamic>? ?? {}),
      photo: Photo.fromJson(json['photo'] as Map<String, dynamic>? ?? {}),
      postKey: json['post_key'] as String? ?? '',
      author: Author.fromJson(json['author'] as Map<String, dynamic>? ?? {}),
      bandKey: json['band_key'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return [
      'isAudioIncluded: $isAudioIncluded',
      'createdAt: $createdAt',
      'emotionCount: $emotionCount',
      'commentKey: $commentKey',
      'sticker: {${sticker.toString().split('\n').join(', ')}}',
      'photo: {${photo.toString().split('\n').join(', ')}}',
      'postKey: $postKey',
      'author: {${author.toString().split('\n').join(', ')}}',
      'bandKey: $bandKey',
      'content: $content',
    ].join('\n');
  }
}
