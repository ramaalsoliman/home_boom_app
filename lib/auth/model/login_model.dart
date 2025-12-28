import 'dart:convert';

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String role;

  final String birthday;
  final String image;
  final String id_photo;
  final String number_phone;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
    final String active;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.role,
   
    required this.birthday,
    required this.image,
    required this.id_photo,
    required this.number_phone,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.active
  });

  User copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? role,
   
    String? birthday,
    String? image,
    String? id_photo,
    String? number_phone,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    String? active
  }) {
    return User(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      role: role ?? this.role,
  
      birthday: birthday ?? this.birthday,
      image: image ?? this.image,
      id_photo: id_photo ?? this.id_photo,
      number_phone: number_phone ?? this.number_phone,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      active: active??this.active
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'role': role,
     
      'birthday': birthday,
      'image': image,
      'id_photo': id_photo,
      'number_phone': number_phone,
      'emailVerifiedAt': emailVerifiedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'active':active
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      role: map['role'] ?? '',
     
      birthday: map['birthday'] ?? '',
      image: map['image'] ?? '',
      id_photo: map['id_photo'] ?? '',
      number_phone: map['number_phone'] ?? '',
      emailVerifiedAt: map['emailVerifiedAt'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      active: map['active']
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, firstname: $firstname, lastName: $lastname, role: $role, birthday: $birthday, image: $image, id_photo: $id_photo, number_phone: $number_phone, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt,active:$active)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.role == role &&
      
        other.birthday == birthday &&
        other.image == image &&
        other.id_photo == id_photo &&
        other.number_phone == number_phone &&
        other.emailVerifiedAt == emailVerifiedAt &&
        other.createdAt == createdAt &&
         other.active == active &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        role.hashCode ^
       
        birthday.hashCode ^
        image.hashCode ^
        id_photo.hashCode ^
        number_phone.hashCode ^
        emailVerifiedAt.hashCode ^
        createdAt.hashCode ^
          active.hashCode ^
        updatedAt.hashCode;
  }
}

class LoginResponse {
  final String mesege;
  final User user;
  final String token;

  LoginResponse({
    required this.mesege,
    required this.user,
    required this.token,
  });

  LoginResponse copyWith({
    String? mesege,
    User? user,
    String? token,
  }) {
    return LoginResponse(
      mesege: mesege ?? this.mesege,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mesege': mesege,
      'user': user.toMap(),
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      mesege: map['mesege'] ?? '',
      user: User.fromMap(map['user']),
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) => LoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponse(mesege: $mesege, user: $user, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is LoginResponse &&
      other.mesege == mesege &&
      other.user == user &&
      other.token == token;
  }

  @override
  int get hashCode => mesege.hashCode ^ user.hashCode ^ token.hashCode;
}
