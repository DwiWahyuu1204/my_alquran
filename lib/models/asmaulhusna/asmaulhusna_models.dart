class AsmaulhusnaModels {
  final bool status;
  final RequestInfo request;
  final Info info;
  final List<Husna> data;

  AsmaulhusnaModels({
    required this.status,
    required this.request,
    required this.info,
    required this.data,
  });

  factory AsmaulhusnaModels.fromJson(Map<String, dynamic> json) {
    return AsmaulhusnaModels(
      status: json['status'] as bool,
      request: RequestInfo.fromJson(json['request'] as Map<String, dynamic>),
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((item) => Husna.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class RequestInfo {
  final String path;

  RequestInfo({required this.path});

  factory RequestInfo.fromJson(Map<String, dynamic> json) {
    return RequestInfo(
      path: json['path'] as String,
    );
  }
}

class Info {
  final int min;
  final int max;

  Info({required this.min, required this.max});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      min: json['min'] as int,
      max: json['max'] as int,
    );
  }
}

class Husna {
  final String arab;
  final int id;
  final String indo;
  final String latin;

  Husna({
    required this.arab,
    required this.id,
    required this.indo,
    required this.latin,
  });

  factory Husna.fromJson(Map<String, dynamic> json) {
    return Husna(
      arab: json['arab'] as String,
      id: json['id'] as int,
      indo: json['indo'] as String,
      latin: json['latin'] as String,
    );
  }
}
