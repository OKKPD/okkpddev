class MasterLayananModel{
  final String kodeLayanan;
  final String namaLayanan;
  final String route;

  const MasterLayananModel(this.kodeLayanan,this.namaLayanan,this.route);

  MasterLayananModel.fromJson(Map<String, dynamic> json)
      : kodeLayanan = json['kodeLayanan'],
        namaLayanan = json['namaLayanan'],
        route = json['route'];

  Map<String, dynamic> toJson() =>
    {
      'kodeLayanan': kodeLayanan,
      'namaLayanan': namaLayanan,
      'route': route,
    };
}