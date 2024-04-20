class UserDataModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? profileUrl;
  String? createdAt;
  String? updatedAt;

  UserDataModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.profileUrl,
    this.createdAt,
    this.updatedAt,
  });

  UserDataModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? profileUrl,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profileUrl = json['profileUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['profileUrl'] = profileUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
