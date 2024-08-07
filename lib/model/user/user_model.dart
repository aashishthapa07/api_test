class UserModel {
  String? clientId;
  String? clientSecret;
  String? username;
  String? password;
  String? grantType;

  UserModel({
    this.clientId,
    this.clientSecret,
    this.username,
    this.password,
    this.grantType,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
    username = json['username'];
    password = json['password'];
    grantType = json['grant_type'];
  }

  factory UserModel.fromJsonFactory(Map<String, dynamic> json) {
    return UserModel(
      clientId: json['client_id'],
      clientSecret: json['client_secret'],
      username: json['username'],
      password: json['password'],
      grantType: json['grant_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['username'] = username;
    data['password'] = password;
    data['grant_type'] = grantType;
    return data;
  }
}
