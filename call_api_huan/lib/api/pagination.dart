class Pagination {

  int next;
  int limit;
  int total;

  Pagination.fromJson(Map<String, dynamic> map):
        next = map["next"]??0,
        limit = map["limit"],
        total = map["total"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next'] = next;
    data['limit'] = limit;
    data['total'] = total;
    return data;
  }
}