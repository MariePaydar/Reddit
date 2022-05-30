class DataOfCommunity {
  String name = "";
  bool isPublic = false;
  DataOfCommunity(this.name, this.isPublic);
}

class Data {
  String userName = "";
  String email = "";
  String password = "";
  String bio = "";
  List<DataOfCommunity> communitylist = [];
  Data(this.userName, this.email, this.password);
}
