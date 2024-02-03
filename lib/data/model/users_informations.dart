class UsersInformations {
  String id;
  final String fullName;
  final String emailAddress;
  final String password;
  final String profileImage;

  UsersInformations(
      {this.id = '',
      required this.fullName,
      required this.emailAddress,
      required this.password,
      required this.profileImage});

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email_address': emailAddress,
        'password': password,
        'profile_image': profileImage,
      };

  static UsersInformations fromJson(Map<String, dynamic> json) =>
      UsersInformations(
        id: json['id'] ?? '',
        fullName: json['full_name'] ?? '',
        emailAddress: json['email_address'] ?? '',
        password: json['password'] ?? '',
        profileImage: json['profile_image'] ?? '',
      );
}
