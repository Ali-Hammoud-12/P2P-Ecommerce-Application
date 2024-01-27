class TASModel {
  String? id;
  String? tAS;

  TASModel({this.id, this.tAS});

  TASModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tAS = json['TAS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['TAS'] = this.tAS;
    return data;
  }
}