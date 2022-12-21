class SectionClass {
  String? createdDate;
  String? lastModifiedDate;
  String? name;
  String? numberOfUnit;
  int? startTime;
  int? endTime;
  double? percents;
  int? id;
  int? createdBy;
  int? lastModifiedBy;

  SectionClass(
      {this.createdDate,
        this.lastModifiedDate,
        this.name,
        this.numberOfUnit,
        this.startTime,
        this.endTime,
        this.percents,
        this.id,
        this.createdBy,
        this.lastModifiedBy});

  SectionClass.fromJson(Map<String, dynamic> json) {
    createdDate = json['createdDate'];
    lastModifiedDate = json['lastModifiedDate'];
    name = json['name'];
    numberOfUnit = json['numberOfUnit'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    percents = json['percents'];
    id = json['id'];
    createdBy = json['createdBy'];
    lastModifiedBy = json['lastModifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdDate'] = this.createdDate;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['name'] = this.name;
    data['numberOfUnit'] = this.numberOfUnit;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['percents'] = this.percents;
    data['id'] = this.id;
    data['createdBy'] = this.createdBy;
    data['lastModifiedBy'] = this.lastModifiedBy;
    return data;
  }
}
