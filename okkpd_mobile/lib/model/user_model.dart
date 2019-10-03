class UserModel{
  final String username;
  final String namaLengkap;
  final String alamatLengkap;
  final String kodeKota;
  final String kodeRole;
  final String idUser;
  final String idIdentitasUsaha;
  final String folder;

  UserModel(this.username,this.namaLengkap,this.alamatLengkap,this.kodeKota,
            this.kodeRole,this.idUser,this.idIdentitasUsaha,this.folder);

  UserModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        namaLengkap = json['nama_lengkap'],
        alamatLengkap = json['alamat_lengkap'],
        kodeKota = json['kode_kota'],
        kodeRole = json['kode_role'],
        idUser = json['id_user'],
        idIdentitasUsaha = json['id_identitas_usaha'],
        folder = json['folder'];

  Map<String, dynamic> toJson() =>
    {
      'username': username,
      'nama_lengkap': namaLengkap,
      'alamat_lengkap': alamatLengkap,
      'kode_kota': kodeKota,
      'kode_role': kodeRole,
      'id_user': idUser,
      'id_identitas_usaha': idIdentitasUsaha,
      'folder': folder,
    };
}