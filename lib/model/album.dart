import 'package:band_open_api/model/author.dart';
import 'package:band_open_api/model/photo.dart';

class Album {
  final List<Photo> latestPhotos;
  final String photoAlbumKey;
  final String name;
  final int photoCount;
  final int createdAt;
  final Author owner;

  Album({
    List<Photo>? latestPhotos,
    this.photoAlbumKey = '',
    this.name = '',
    this.photoCount = 0,
    this.createdAt = 0,
    this.owner = const Author(),
  }) : latestPhotos = latestPhotos ?? [];

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      latestPhotos: (json['latest_photos'] as List<dynamic>?)
              ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      photoAlbumKey: json['photo_album_key'] as String? ?? '',
      name: json['name'] as String? ?? '',
      photoCount: json['photo_count'] as int? ?? 0,
      createdAt: json['created_at'] as int? ?? 0,
      owner: Author.fromJson(json['owner'] as Map<String, dynamic>? ?? {}),
    );
  }

  @override
  String toString() {
    return [
      'photoAlbumKey: $photoAlbumKey',
      'name: $name',
      'photoCount: $photoCount',
      'createdAt: $createdAt',
      'owner: {${owner.toString().split('\n').join(', ')}}',
    ].join('\n');
  }
}
