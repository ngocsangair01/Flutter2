class User {
  String? createdDate;
  String? lastModifiedDate;
  String? username;
  String? password;
  int? id;
  String? createdBy;
  String? lastModifiedBy;

  User(
      {this.createdDate,
        this.lastModifiedDate,
        this.username,
        this.password,
        this.id,
        this.createdBy,
        this.lastModifiedBy});

  User.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    lastModifiedDate = json['lastModifiedDate'];
    username = json['username'];
    password = json['password'];
    id = json['id'];
    createdBy = json['createdBy'];
    lastModifiedBy = json['lastModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdDate'] = this.createdDate;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['username'] = this.username;
    data['password'] = this.password;
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['lastModifiedBy'] = this.lastModifiedBy;
    return data;
  }
}
