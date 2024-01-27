class CarrierModel {
  String? carrierId;
  String? carrierName;

  CarrierModel({this.carrierId, this.carrierName});

  CarrierModel.fromJson(Map<String, dynamic> json) {
    carrierId = json['carrier_id'];
    carrierName = json['carrier_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carrier_id'] = this.carrierId;
    data['carrier_name'] = this.carrierName;
    return data;
  }
}