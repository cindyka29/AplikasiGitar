import 'dart:convert';

Smartglasses smartglassesFromJson(String str) =>
    Smartglasses.fromJson(json.decode(str));

String smartglassesToJson(Smartglasses data) => json.encode(data.toJson());

class Smartglasses {
  int packageId;
  int packageCode;
  String packageName;
  dynamic permalink;
  String packageDesc;
  String featureImg;
  String locationId;
  String comunityId;
  String nama_kelompok;

  Smartglasses({
    required this.packageId,
    required this.packageCode,
    required this.packageName,
    required this.permalink,
    required this.packageDesc,
    required this.featureImg,
    required this.locationId,
    required this.comunityId,
    required this.nama_kelompok,
  });

  factory Smartglasses.fromJson(Map<String, dynamic> json) => Smartglasses(
        packageId: json["package_id"],
        packageCode: json["package_code"],
        packageName: json["package_name"],
        permalink: json["permalink"],
        packageDesc: json["package_desc"],
        featureImg: json["feature_img"],
        locationId: json["location_id"],
        comunityId: json["comunity_id"],
        nama_kelompok: json["nama_kelompok"],
      );

  Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "package_code": packageCode,
        "package_name": packageName,
        "permalink": permalink,
        "package_desc": packageDesc,
        "feature_img": featureImg,
        "location_id": locationId,
        "comunity_id": comunityId,
        "package_name": nama_kelompok,
      };
}
