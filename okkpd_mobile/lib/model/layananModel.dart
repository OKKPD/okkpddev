class LayananModel{
  final String uid;
  final String kodeLayanan;
  final String namaLayanan;
  final String idIdentitasUsaha;
  final String kodePendaftaran;
  final String status;
  final String level;
  final String tanggalBuat;

  const LayananModel(this.uid,this.namaLayanan,this.kodeLayanan,this.idIdentitasUsaha,this.kodePendaftaran,this.status,this.level,this.tanggalBuat);

  LayananModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        namaLayanan = json['nama_layanan'],
        kodeLayanan = json['kode_layanan'],
        idIdentitasUsaha = json['id_identitas_usaha'],
        kodePendaftaran = json['kode_pendaftaran'],
        status = json['status'],
        level = json['level'],
        tanggalBuat = json['tanggal_buat'];

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
      };
}