  
class HomeModel {
  String buyukluk;
  String yer;

  HomeModel({this.buyukluk, this.yer});

  HomeModel.fromJson(Map<String, dynamic> json) {
    buyukluk = json['buyukluk'];
    yer = json['yer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buyukluk'] = this.buyukluk;
    data['yer'] = this.yer;
    return data;
  }
}