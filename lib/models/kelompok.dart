class Kelompok {
  Kelompok({
    required this.idkelompok,
    required this.namakelompok,
  });
  int idkelompok;
  String namakelompok;
  factory Kelompok.fromJson(Map<String, dynamic> json) => Kelompok(
      idkelompok: json["id_kelompok"],
      namakelompok: json["nama_kelompok"] == null
          ? ''
          : json["nama_kelompok"].toString());
  Map<String, dynamic> toJson() => {
        "id_kelompok": idkelompok,
        "nama_kelompok": namakelompok,
      };
}
