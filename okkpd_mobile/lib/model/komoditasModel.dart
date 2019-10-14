class KomoditasModel{
  String idDetail;
  String idLayanan;
  String idSektor;
  String idKomoditas;
  String idKelompok;
  String luasLahan;
  String namaJenisKomoditas;
  String namaLatin;

  KomoditasModel(this.idDetail,this.idLayanan,this.idSektor,this.idKomoditas,this.idKelompok,
      this.luasLahan,this.namaJenisKomoditas,this.namaLatin);

  KomoditasModel.fromJson(Map<String, dynamic> json)
      : idDetail = json['id_detail'],
        idLayanan= json['kode_layanan'],
        idSektor = json['id_sektor'],
        idKomoditas = json['kode_komoditas'],
        idKelompok = json['id_kelompok'],
        luasLahan = json['luas_lahan'],
        namaJenisKomoditas = json['nama_jenis_komoditas'],
        namaLatin = json['username'];

  Map<String, dynamic> toJson() =>
      {
        'id_detail': idDetail,
        'kode_layanan': idLayanan,
        'id_sektor': idSektor,
        'kode_komoditas': idKomoditas,
        'id_kelompok': idKelompok,
        'luas_lahan': luasLahan,
        'nama_jenis_komoditas': namaJenisKomoditas,
        'username': namaLatin,
      };
}