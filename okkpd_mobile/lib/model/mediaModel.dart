class MediaModel {
  final String kodeLayanan;
  final String kodeDokumen;
  final String idMedia;
  final String namaMedia;
  final String namaDokumen;
  final String sudahAda;

  const MediaModel(this.kodeLayanan, this.kodeDokumen, this.idMedia,
      this.namaMedia, this.namaDokumen, this.sudahAda);

  MediaModel.fromJson(Map<String, dynamic> json)
      : kodeLayanan = json['kode_layanan'],
        kodeDokumen = json['kode_dokumen'],
        idMedia = json['id_media'],
        namaMedia = json['nama_media'],
        namaDokumen = json['nama_dokumen'],
        sudahAda = json['sudah_ada'];

  Map<String, dynamic> toJson() => {
        'kode_layanan': kodeLayanan,
        'kode_dokumen': kodeDokumen,
        'id_media': idMedia,
        'nama_media': namaMedia,
        'nama_dokumen': namaDokumen,
        'sudah_ada': sudahAda,
      };
}
