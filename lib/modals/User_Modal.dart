class UserModal {
  String? username;
  String? password;
  String? email;
  String? image;

  UserModal(
    this.password,
    this.email,
  );
  factory UserModal.fromMap({required Map data}) {
    return UserModal(
      data['password'],
      data['email'],
    );
  }
}
