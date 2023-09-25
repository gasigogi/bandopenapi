class Author {
  final String name;
  final String profileImageUrl;
  final String description;
  final String role;
  final String memberType;
  final bool isMemberCertified;
  final bool isMe;
  final String memberKey;
  final bool isMuted;
  final int createdAt;
  final String userKey;

  const Author({
    this.name = '',
    this.profileImageUrl = '',
    this.description = '',
    this.role = '',
    this.memberType = '',
    this.isMemberCertified = false,
    this.isMe = false,
    this.memberKey = '',
    this.isMuted = false,
    this.createdAt = 0,
    this.userKey = '',
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'] as String? ?? '',
      profileImageUrl: json['profile_image_url'] as String? ?? '',
      description: json['description'] as String? ?? '',
      role: json['role'] as String? ?? '',
      memberType: json['member_type'] as String? ?? '',
      isMemberCertified: json['member_certified'] as bool? ?? false,
      isMe: json['me'] as bool? ?? false,
      memberKey: json['member_key'] as String? ?? '',
      isMuted: json['is_muted'] as bool? ?? false,
      createdAt: json['created_at'] as int? ?? 0,
      userKey: json['user_key'] as String? ?? '',
    );
  }

  @override
  String toString() {
    return [
      'name: $name',
      'profileImageUrl: $profileImageUrl',
      'description: $description',
      'role: $role',
      'memberType: $memberType',
      'isMemberCertified: $isMemberCertified',
      'isMe: $isMe',
      'memberKey: $memberKey',
      'isMuted: $isMuted',
      'createdAt: $createdAt',
      'userKey: $userKey',
    ].join('\n');
  }
}
