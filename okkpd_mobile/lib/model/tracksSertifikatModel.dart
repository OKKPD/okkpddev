class TrakSertifikat {
  String no_sertifikat;
  String nama_usaha;
  String nama_jenis_komuditas;
  String luas_lahan;
  String tanggal_cetak;
  String tanggal_akhir;
  String status_aktif;


  TrakSertifikat(
      this.no_sertifikat,
      this.nama_usaha,
      this.nama_jenis_komuditas,
      this.luas_lahan,
      this.tanggal_cetak,
      this.tanggal_akhir,
      this.status_aktif
      );

  TrakSertifikat.fromJson(Map<String, dynamic> json)
      : no_sertifikat = json['no_sertifikat'],
        nama_usaha = json['nama_usaha'],
        nama_jenis_komuditas = json['nama_jenis_komuditas'],
        luas_lahan = json['luas_lahan'],
        tanggal_cetak = json['tanggal_cetak'],
        tanggal_akhir = json['tanggal_akhir'],
        status_aktif = json['status_aktif'];


  Map<String, dynamic> toJson() => {
    'no_sertifikat': no_sertifikat,
    'nama_usaha': nama_usaha,
    'nama_jenis_komuditas': nama_jenis_komuditas,
    'luas_lahan': luas_lahan,
    'tanggal_cetak': tanggal_cetak,
    'tanggal_akhir': tanggal_akhir,
    'status_aktif': status_aktif,
  };
}
