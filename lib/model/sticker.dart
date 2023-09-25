class Sticker {
  final String url;
  final int width;
  final int height;

  const Sticker({
    this.url = '',
    this.width = 0,
    this.height = 0,
  });

  factory Sticker.fromJson(Map<String, dynamic> json) {
    return Sticker(
      url: json['url'] as String? ?? '',
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return [
      'url: $url',
      'width: $width',
      'height: $height',
    ].join('\n');
  }
}
