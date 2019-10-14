class ExportModel{
  String namaProduk;
  String jenisProduk;
  String nomorHs;
  String namaEksportir;
  String alamatKantor;
  String alamatGudang;
  String id;
  String consignmentCode;
  String jumlahLot;
  String beratLot;
  String jumlahKemasan;
  String jenisKemasan;
  String beratKotor;
  String beratBersih;
  String pelabuhanBerangkat;
  String identitasTransportasi;
  String pelabuhanTujuan;
  String negaraTujuan;
  String negaraTransit;
  String pelabuhanTransit;
  String transporTasitransit;
  String idLayanan;
  String sertifikat;
  String mimeType;
  String tanggalUnggah;

  ExportModel(
      this.sertifikat,
      this.mimeType,
      this.idLayanan,
      this.id,
      this.alamatGudang,
      this.alamatKantor,
      this.beratBersih,
      this.beratKotor,
      this.beratLot,
      this.consignmentCode,
      this.identitasTransportasi,
      this.jenisKemasan,
      this.jenisProduk,
      this.jumlahKemasan,
      this.jumlahLot,
      this.namaEksportir,
      this.namaProduk,
      this.negaraTransit,
      this.negaraTujuan,
      this.nomorHs,
      this.pelabuhanBerangkat,
      this.pelabuhanTransit,
      this.pelabuhanTujuan,
      this.tanggalUnggah,
      this.transporTasitransit,
      );

  ExportModel.fromJson(Map<String, dynamic> json)
      : namaProduk = json['id_detail'],
        jenisProduk= json['id_detail'],
        nomorHs= json['id_detail'],
        namaEksportir= json['id_detail'],
        alamatKantor= json['id_detail'],
        alamatGudang= json['id_detail'],
        id= json['id_detail'],
        consignmentCode= json['id_detail'],
        jumlahLot= json['id_detail'],
        beratLot= json['id_detail'],
        jumlahKemasan= json['id_detail'],
        jenisKemasan= json['id_detail'],
        beratKotor= json['id_detail'],
        beratBersih= json['id_detail'],
        pelabuhanBerangkat= json['id_detail'],
        identitasTransportasi= json['id_detail'],
        pelabuhanTujuan= json['id_detail'],
        negaraTujuan= json['id_detail'],
        negaraTransit= json['id_detail'],
        pelabuhanTransit= json['id_detail'],
        transporTasitransit= json['id_detail'],
        idLayanan= json['id_detail'],
        sertifikat= json['id_detail'],
        mimeType= json['id_detail'],
        tanggalUnggah= json['id_detail'];

  Map<String, dynamic> toJson() =>
      {
        'nama_produk' : namaProduk,
        'jenis_produk' : jenisProduk,
        'nomor_hs' : nomorHs,
        'nama_eksportir' : namaEksportir,
        'alamat_kantor' : alamatKantor,
        'alamat_gudang' : alamatGudang,
        'id' : id,
        'consignment_code' : consignmentCode,
        'jumlah_lot' : jumlahLot,
        'berat_lot' : beratLot,
        'jumlah_kemasan' : jumlahKemasan,
        'jenis_kemasan' : jenisKemasan,
        'berat_kotor' : beratKotor,
        'berat_bersih' : beratBersih,
        'pelabuhan_berangkat' : pelabuhanBerangkat,
        'identitas_transportasi' : identitasTransportasi,
        'pelabuhan_tujuan' : pelabuhanTujuan,
        'negara_tujuan' : negaraTujuan,
        'negara_transit' : negaraTransit,
        'pelabuhan_transit' : pelabuhanTransit,
        'transportasi_transit' : transporTasitransit,
        'id_layanan' : idLayanan,
        'sertifikat' : sertifikat,
        'mime_type' : mimeType,
        'tanggal_unggah' : tanggalUnggah
      };
}