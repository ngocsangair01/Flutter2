//
//
// import 'dart:convert';
//
// TimetableDetail timetableDetailFromJson(String str) => TimetableDetail.fromJson(json.decode(str));
//
// String timetableDetailToJson(TimetableDetail data) => json.encode(data.toJson());
//
// class TimetableDetail {
//   TimetableDetail({
//     required this.week,
//     required this.from,
//     required this.timeDetail,
//   });
//
//   final int week;
//   final String from;
//   final String timeDetail;
//
//   TimetableDetail copyWith({
//     required int week,
//     required String from,
//     required String timeDetail,
//   }) =>
//       TimetableDetail(
//         week: week ?? this.week,
//         from: from ?? this.from,
//         timeDetail: timeDetail ?? this.timeDetail,
//       );
//
//   factory TimetableDetail.fromJson(Map<String, dynamic> json) => TimetableDetail(
//     week: json["week"],
//     from: json["from"],
//     timeDetail: json["timeDetail"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "week": week,
//     "from": from,
//     "timeDetail": timeDetail,
//   };
// }
