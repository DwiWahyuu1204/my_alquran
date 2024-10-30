class GetTimeModels {
  final bool status;
  final Request request;
  final TimeData data;

  GetTimeModels(
      {required this.status, required this.request, required this.data});

  factory GetTimeModels.fromJson(Map<String, dynamic> json) {
    return GetTimeModels(
      status: json['status'],
      request: Request.fromJson(json['request']),
      data: TimeData.fromJson(json['data']),
    );
  }
}

class Request {
  final String path;

  Request({required this.path});

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      path: json['path'],
    );
  }
}

class TimeData {
  final int timestamp;
  final String zona;
  final String bagian;
  final DateInfo date;
  final TimeInfo time;

  TimeData({
    required this.timestamp,
    required this.zona,
    required this.bagian,
    required this.date,
    required this.time,
  });

  factory TimeData.fromJson(Map<String, dynamic> json) {
    return TimeData(
      timestamp: json['timestamp'],
      zona: json['zona'],
      bagian: json['bagian'],
      date: DateInfo.fromJson(json['date']),
      time: TimeInfo.fromJson(json['time']),
    );
  }
}

class DateInfo {
  final int year;
  final int month;
  final int date;
  final List<String> full;

  DateInfo({
    required this.year,
    required this.month,
    required this.date,
    required this.full,
  });

  factory DateInfo.fromJson(Map<String, dynamic> json) {
    return DateInfo(
      year: json['year'],
      month: json['month'],
      date: json['date'],
      full: List<String>.from(json['full']),
    );
  }
}

class TimeInfo {
  final int hour;
  final int minute;
  final int second;
  final String full;

  TimeInfo({
    required this.hour,
    required this.minute,
    required this.second,
    required this.full,
  });

  factory TimeInfo.fromJson(Map<String, dynamic> json) {
    return TimeInfo(
      hour: json['hour'],
      minute: json['minute'],
      second: json['second'],
      full: json['full'],
    );
  }
}
