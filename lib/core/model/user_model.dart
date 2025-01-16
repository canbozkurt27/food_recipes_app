// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String name;
  String mail;
  String password;
  UserModel({
    required this.name,
    required this.mail,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mail': mail,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      mail: map['mail'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? name,
    String? mail,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      mail: mail ?? this.mail,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, mail: $mail, password: $password)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.mail == mail &&
      other.password == password;
  }

  @override
  int get hashCode => name.hashCode ^ mail.hashCode ^ password.hashCode;
}
