import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
  String username;
  String password;
  String nomComplet;
  String telephone;
  RegisterModel({
    required this.username,
    required this.password,
    required this.nomComplet,
    required this.telephone,
  });

  RegisterModel copyWith({
    String? username,
    String? password,
    String? nomComplet,
    String? telephone,
  }) {
    return RegisterModel(
      username: username ?? this.username,
      password: password ?? this.password,
      nomComplet: nomComplet ?? this.nomComplet,
      telephone: telephone ?? this.telephone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'nomComplet': nomComplet,
      'telephone': telephone,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      username: map['username'] as String,
      password: map['password'] as String,
      nomComplet: map['nomComplet'] as String,
      telephone: map['telephone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegisterModel(username: $username, password: $password, nomComplet: $nomComplet, telephone: $telephone)';
  }

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.password == password &&
      other.nomComplet == nomComplet &&
      other.telephone == telephone;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      password.hashCode ^
      nomComplet.hashCode ^
      telephone.hashCode;
  }
}
