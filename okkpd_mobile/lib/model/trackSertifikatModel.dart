
class TrackSertifikatModel{
  String nomorSertifikat;
  String namaUsaha;
  String namaJenisKomoditas;
  String luasLahan;
  String tanggalCetak;
  String tanggalAkhir;
  String statusAktif;

  TrackSertifikatModel(this.nomorSertifikat,this.namaUsaha,this.namaJenisKomoditas, this.luasLahan,this.tanggalCetak,this.tanggalAkhir,this.statusAktif);

  TrackSertifikatModel.fromJson(Map<String, dynamic> json)
      : nomorSertifikat = json['nomor_sertifikat'],
        namaUsaha = json['nama_usaha'],
        namaJenisKomoditas = json['nama_jenis_komoditas'],
        luasLahan = json['luas_lahan'],
        tanggalCetak = json['tanggal_cetak'],
        tanggalAkhir = json['tanggal_akhir'],
        statusAktif = json['status_aktif'];

  Map<String, dynamic> toJson() =>
      {
        'nomor_sertifikat': nomorSertifikat,
        'nama_usaha': namaUsaha,
        'nama_jenis_komoditas': namaJenisKomoditas,
        'luas_lahan': luasLahan,
        'tanggal_cetak': tanggalCetak,
        'tanggal_akhir': tanggalAkhir,
        'status_aktif': statusAktif,
      };
}
