import 'dart:convert';

class ScanModel {
  int? id;
  String? tipo;
  final String value;

  ScanModel({
    this.id,
    this.tipo,
    required this.value,
  }) {
    if (value.contains('http')) {
      tipo = 'http';
    } else {
      tipo = 'GEO';
    }
  }

  factory ScanModel.fromRawJson(String str) =>
      ScanModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "value": value,
      };
}
