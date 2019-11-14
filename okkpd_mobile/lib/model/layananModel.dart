class LayananModel{
  final String uid;
  final String kodeLayanan;
  final String namaLayanan;
  final String idIdentitasUsaha;
  final String kodePendaftaran;
  final String status;
  final String level;
  final String tanggalBuat;
  final String alasanPenolakan;

  const LayananModel(this.uid,this.namaLayanan,this.kodeLayanan,this.idIdentitasUsaha,this.kodePendaftaran,this.status,this.level,this.tanggalBuat,this.alasanPenolakan);

  LayananModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        namaLayanan = json['nama_layanan'],
        kodeLayanan = json['kode_layanan'],
        idIdentitasUsaha = json['id_identitas_usaha'],
        kodePendaftaran = json['kode_pendaftaran'],
        status = json['status'],
        level = json['level'],
        tanggalBuat = json['tanggal_buat'],
        alasanPenolakan = json['alasan_penolakan'];

  Map<String, dynamic> toJson() =>
      {
        'uid': uid,
        'nama_layanan': namaLayanan,
        'kode_layanan': kodeLayanan,
        'id_identitas_usaha': idIdentitasUsaha,
        'kode_pendaftaran': kodePendaftaran,
        'status': status,
        'level': level,
        'tanggal_buat': tanggalBuat,
        'alasan_penolakan': alasanPenolakan,
      };
}