class Band {
  final String name;
  final String bandKey;
  final String cover;
  final int memberCount;

  const Band({
    this.name = '',
    this.bandKey = '',
    this.cover = '',
    this.memberCount = 0,
  });

  factory Band.fromJson(Map<String, dynamic> json) {
    return Band(
      name: json['name'] as String? ?? '',
      bandKey: json['band_key'] as String? ?? '',
      cover: json['cover'] as String? ?? '',
      memberCount: json['member_count'] as int? ?? 0,
    );
  }

  @override
  String toString() {
    return [
      'name: $name',
      'bandKey: $bandKey',
      'cover: $cover',
      'memberCount: $memberCount',
    ].join('\n');
  }
}
