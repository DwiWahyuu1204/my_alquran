class GetJadwalModels {
  bool? status;
  RequestModel? request;
  DataModel? data;

  GetJadwalModels({
    this.status,
    this.request,
    this.data,
  });

  factory GetJadwalModels.fromJson(Map<String, dynamic> json) =>
      GetJadwalModels(
        status: json['status'] as bool?,
        request: json['request'] != null
            ? RequestModel.fromJson(json['request'])
            : null,
        data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
      );
}

class RequestModel {
  String? path;
  String? year;
  String? month;
  String? date;

  RequestModel({
    this.path,
    this.year,
    this.month,
    this.date,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        path: json['path'] as String?,
        year: json['year'] as String?,
        month: json['month'] as String?,
        date: json['date'] as String?,
      );
}

class DataModel {
  int? id;
  String? lokasi;
  String? daerah;
  JadwalModel? jadwal;

  DataModel({
    this.id,
    this.lokasi,
    this.daerah,
    this.jadwal,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json['id'] as int?,
        lokasi: json['lokasi'] as String?,
        daerah: json['daerah'] as String?,
        jadwal: json['jadwal'] != null
            ? JadwalModel.fromJson(json['jadwal'])
            : null,
      );
}

class JadwalModel {
  String? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  JadwalModel({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });

  factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
        tanggal: json['tanggal'] as String?,
        imsak: json['imsak'] as String?,
        subuh: json['subuh'] as String?,
        terbit: json['terbit'] as String?,
        dhuha: json['dhuha'] as String?,
        dzuhur: json['dzuhur'] as String?,
        ashar: json['ashar'] as String?,
        maghrib: json['maghrib'] as String?,
        isya: json['isya'] as String?,
        date: json['date'] as String?,
      );
}
