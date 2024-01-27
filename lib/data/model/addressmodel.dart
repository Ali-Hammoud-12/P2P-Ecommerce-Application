class AddressModel {
  String? addressId;
  String? addressCountry;
  String? addressStreet;
  String? addressUsersid;
  String? addressCity;
  String? addressName;

  AddressModel(
      {this.addressId,
      this.addressCountry,
      this.addressStreet,
      this.addressUsersid,
      this.addressCity,
      this.addressName});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressCountry = json['address_country'];
    addressStreet = json['address_street'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_country'] = this.addressCountry;
    data['address_street'] = this.addressStreet;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    return data;
  }
}