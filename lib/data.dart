

class DataOfCommunity {
  String name = "";
  bool isPublic = false;
}

class Data {
  String userName = "";
  String email = "";
  String password = "";
  List<DataOfCommunity> citylist = [];
  Data(this.userName, this.email, this.password);
}
