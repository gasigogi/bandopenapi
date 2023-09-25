import 'package:band_open_api/model/author.dart';
import 'package:band_open_api/model/photo.dart';
import 'package:band_open_api/model/sticker.dart';

class Post {
  final Author author;
  final String postKey;
  final String content;
  final int commentCount;
  final int createdAt;
  final List<Photo> photos;
  final int emotionCount;
  final String bandKey;
  final Map<int, Sticker> sticker;

  Post({
    this.author = const Author(),
    this.postKey = '',
    this.content = '',
    this.commentCount = 0,
    this.createdAt = 0,
    List<Photo>? photos,
    this.emotionCount = 0,
    this.bandKey = '',
    Map<int, Sticker>? sticker,
  })  : photos = photos ?? [],
        sticker = sticker ?? {};

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      author: Author.fromJson(json['author'] as Map<String, dynamic>? ?? {}),
      postKey: json['post_key'] as String? ?? '',
      content: json['content'] as String? ?? '',
      commentCount: json['comment_count'] as int? ?? 0,
      createdAt: json['created_at'] as int? ?? 0,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      emotionCount: json['emotion_count'] as int? ?? 0,
      bandKey: json['band_key'] as String? ?? '',
      sticker: Map<int, Sticker>.from(json['sticker']
              ?.map((k, v) => MapEntry(int.parse(k), Sticker.fromJson(v))) ??
          {}),
    );
  }

  @override
  String toString() {
    return [
      'author: {${author.toString().split('\n').join(', ')}}',
      'postKey: $postKey',
      'content: $content',
      'commentCount: $commentCount',
      'createdAt: $createdAt',
      'photos: {${photos.map((e) => e.toString().split('\n').join(', ')).toList()}}',
      'emotionCount: $emotionCount',
      'bandKey: $bandKey',
      'sticker: {${sticker.entries.map((entry) => '${entry.key}=${entry.value.toString().split('\n').join(', ')}')}}'
    ].join('\n');
  }
}
