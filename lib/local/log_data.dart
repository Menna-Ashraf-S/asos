class LogData {
  int? idSQL;
  String? username;
  String? email;
  String? password;

  LogData(dynamic obj) {
    if (obj['idSQL'] != null) {
      idSQL = obj['idSQL'];
    }
    username = obj['username'];
    email = obj['email'];
    password = obj['password'];
  }

  LogData.fromMap(Map<String, dynamic> data) {
    if (data['idSQL'] != null) {
      idSQL = data['idSQL'];
    }
    username = data['username'];
    email = data['email'];
    password = data['password'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> Data = {
      'username': username,
      'email': email,
      'password': password,
    };
    if (idSQL != null) {
      Data['idSQL'] = idSQL;
    }
    return Data;
  }
}
