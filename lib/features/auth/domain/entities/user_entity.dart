class UserEntity {
  final String? uid;
  final String name;
  final String email;

  const UserEntity({
    this.uid,
    required this.name,
    required this.email,
  });
}
