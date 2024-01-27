class OrderDetailsModel {
  String? orderdetailsQty;
  String? itemsName;
  String? price;
  String? orderdetailsImage;
  String? orderdetailsApprove;
  String? addressId;
  String? addressCountry;
  String? addressStreet;
  String? addressUsersid;
  String? addressCity;
  String? addressName;
  String? usersName;

  OrderDetailsModel(
      {this.orderdetailsQty,
      this.itemsName,
      this.price,
      this.orderdetailsImage,
      this.orderdetailsApprove,
      this.addressId,
      this.addressCountry,
      this.addressStreet,
      this.addressUsersid,
      this.addressCity,
      this.addressName,
      this.usersName});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderdetailsQty = json['orderdetails_qty'];
    itemsName = json['items_name'];
    price = json['price'];
    orderdetailsImage = json['orderdetails_image'];
    orderdetailsApprove = json['orderdetails_approve'];
    addressId = json['address_id'];
    addressCountry = json['address_country'];
    addressStreet = json['address_street'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    usersName = json['users_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderdetails_qty'] = this.orderdetailsQty;
    data['items_name'] = this.itemsName;
    data['price'] = this.price;
    data['orderdetails_image'] = this.orderdetailsImage;
    data['orderdetails_approve'] = this.orderdetailsApprove;
    data['address_id'] = this.addressId;
    data['address_country'] = this.addressCountry;
    data['address_street'] = this.addressStreet;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    data['users_name'] = this.usersName;
    return data;
  }
}