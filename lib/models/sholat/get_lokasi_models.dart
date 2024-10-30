class GetLokasiModels {
  bool status;
  RequestModel request;
  List<DataModel> data;

  GetLokasiModels({
    required this.status,
    required this.request,
    required this.data,
  });

  factory GetLokasiModels.fromJson(Map<String, dynamic> json) {
    return GetLokasiModels(
      status: json['status'],
      request: RequestModel.fromJson(json['request']),
      data: List<DataModel>.from(
          json['data'].map((item) => DataModel.fromJson(item))),
    );
  }
}

class RequestModel {
  String path;
  String keyword;

  RequestModel({
    required this.path,
    required this.keyword,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      path: json['path'],
      keyword: json['keyword'],
    );
  }
}

class DataModel {
  String id;
  String lokasi;

  DataModel({
    required this.id,
    required this.lokasi,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      lokasi: json['lokasi'],
    );
  }
}
