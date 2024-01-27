class ShopOrderDetailsModel2 {
  String? totalprice;
  String? usersName;
  String? addressId;
  String? addressCountry;
  String? addressStreet;
  String? addressUsersid;
  String? addressCity;
  String? addressName;

  ShopOrderDetailsModel2(
      {this.totalprice,
      this.usersName,
      this.addressId,
      this.addressCountry,
      this.addressStreet,
      this.addressUsersid,
      this.addressCity,
      this.addressName});

  ShopOrderDetailsModel2.fromJson(Map<String, dynamic> json) {
    totalprice = json['totalprice'];
    usersName = json['users_name'];
    addressId = json['address_id'];
    addressCountry = json['address_country'];
    addressStreet = json['address_street'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalprice'] = this.totalprice;
    data['users_name'] = this.usersName;
    data['address_id'] = this.addressId;
    data['address_country'] = this.addressCountry;
    data['address_street'] = this.addressStreet;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    return data;
  }
}