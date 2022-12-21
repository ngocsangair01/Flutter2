class Subject {
  int? subjectId;
  String? subjectName;
  String? room;
  String? address;
  String? lesson;
  String? timeDetail;
  List<TimeTableDetails>? timeTableDetails;

  Subject(
      {this.subjectId,
        this.subjectName,
        this.room,
        this.address,
        this.lesson,
        this.timeDetail,
        this.timeTableDetails});

  Subject.fromJson(Map<String, dynamic> json) {
    subjectId = json['subjectId'];
    subjectName = json['subjectName'];
    room = json['room'];
    address = json['address'];
    lesson = json['lesson'];
    timeDetail = json['timeDetail'];
    if (json['timeTableDetails'] != null) {
      timeTableDetails = <TimeTableDetails>[];
      json['timeTableDetails'].forEach((v) {
        timeTableDetails!.add(new TimeTableDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subjectId'] = this.subjectId;
    data['subjectName'] = this.subjectName;
    data['room'] = this.room;
    data['address'] = this.address;
    data['lesson'] = this.lesson;
    data['timeDetail'] = this.timeDetail;
    if (this.timeTableDetails != null) {
      data['timeTableDetails'] =
          this.timeTableDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeTableDetails {
  int? week;
  String? from;
  String? timeDetail;

  TimeTableDetails({this.week, this.from, this.timeDetail});

  TimeTableDetails.fromJson(Map<String, dynamic> json) {
    week = json['week'];
    from = json['from'];
    timeDetail = json['timeDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['week'] = this.week;
    data['from'] = this.from;
    data['timeDetail'] = this.timeDetail;
    return data;
  }
}
