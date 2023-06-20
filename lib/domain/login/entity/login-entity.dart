
class LoginEntity {
  int id;
  String email;
  String password;
  int times;

  LoginEntity({
    required this.id,
    required this.email,
    required this.password,
    required this.times
  });
}