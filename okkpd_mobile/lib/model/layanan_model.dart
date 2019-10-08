class LayananModel{
  final String kode_layanan;
  final String nama_layanan;
  final String route;

  const LayananModel(this.kode_layanan,this.nama_layanan,this.route);

  LayananModel.fromJson(Map<String, dynamic> json)
      : kode_layanan = json['kode_layanan'],
        nama_layanan = json['nama_layanan'],
        route = json['route'];

  Map<String, dynamic> toJson() =>
    {
      'kode_layanan': kode_layanan,
      'nama_layanan': nama_layanan,
      'route': route,
    };
}