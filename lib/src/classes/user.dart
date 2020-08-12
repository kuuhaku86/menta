import 'package:menta/src/utils/user_type.dart';

class User {
  String nama_lengkap, nik, alamat, email, password;
  DateTime tanggal_lahir;
  int money;
  UserType type;

  User(this.nama_lengkap, this.nik, this.tanggal_lahir, this.alamat, this.money,
      this.email, this.password, this.type);
}
