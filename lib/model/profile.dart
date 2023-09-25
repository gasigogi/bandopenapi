class Profile {
  final String userKey;
  final String profileImageUrl;
  final String name;
  final bool isAppMember;
  final bool isMessageAllowed;

  const Profile({
    this.userKey = '',
    this.profileImageUrl = '',
    this.name = '',
    this.isAppMember = false,
    this.isMessageAllowed = false,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      userKey: json['user_key'] as String? ?? '',
      profileImageUrl: json['profile_image_url'] as String? ?? '',
      name: json['name'] as String? ?? '',
      isAppMember: json['is_app_member'] as bool? ?? false,
      isMessageAllowed: json['message_allowed'] as bool? ?? false,
    );
  }

  @override
  String toString() {
    return [
      'userKey: $userKey',
      'profileImageUrl: $profileImageUrl',
      'name: $name',
      'isAppMember: $isAppMember',
      'isMessageAllowed: $isMessageAllowed',
    ].join('\n');
  }
}
