class Student {
  String? createdDate;
  String? lastModifiedDate;
  String? studentId;
  String? fullName;
  String? avatar;
  String? studentOfClass;
  String? major;
  String? dateOfBirth;
  int? id;
  int? createdBy;
  int? lastModifiedBy;

  Student(
      {this.createdDate,
        this.lastModifiedDate,
        this.studentId,
        this.fullName,
        this.avatar,
        this.studentOfClass,
        this.major,
        this.dateOfBirth,
        this.id,
        this.createdBy,
        this.lastModifiedBy});

  Student.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    lastModifiedDate = json['lastModifiedDate'];
    studentId = json['studentId'];
    fullName = json['fullName'];
    avatar = json['avatar'];
    studentOfClass = json['studentOfClass'];
    major = json['major'];
    dateOfBirth = json['dateOfBirth'];
    id = json['id'];
    createdBy = json['createdBy'];
    lastModifiedBy = json['lastModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdDate'] = this.createdDate;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['studentId'] = this.studentId;
    data['fullName'] = this.fullName;
    data['avatar'] = this.avatar;
    data['studentOfClass'] = this.studentOfClass;
    data['major'] = this.major;
    data['dateOfBirth'] = this.dateOfBirth;
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['lastModifiedBy'] = this.lastModifiedBy;
    return data;
  }
}
