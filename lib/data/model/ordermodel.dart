class OrdersModel {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersShippingprice;
  String? ordersPrice;
  String? ordersTotal;
  String? ordersPaymentmethod;
  String? ordersCarrierid;
  String? ordersStatus;
  String? ordersDatetime;
  String? addressId;
  String? addressCountry;
  String? addressStreet;
  String? addressUsersid;
  String? addressCity;
  String? addressName;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersShippingprice,
      this.ordersPrice,
      this.ordersTotal,
      this.ordersPaymentmethod,
      this.ordersCarrierid,
      this.ordersStatus,
      this.ordersDatetime,
      this.addressId,
      this.addressCountry,
      this.addressStreet,
      this.addressUsersid,
      this.addressCity,
      this.addressName});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersid = json['orders_usersid'];
    ordersAddress = json['orders_address'];
    ordersShippingprice = json['orders_shippingprice'];
    ordersPrice = json['orders_price'];
    ordersTotal = json['orders_total'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersCarrierid = json['orders_carrierid'];
    ordersStatus = json['orders_status'];
    ordersDatetime = json['orders_datetime'];
    addressId = json['address_id'];
    addressCountry = json['address_country'];
    addressStreet = json['address_street'];
    addressUsersid = json['address_usersid'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_shippingprice'] = this.ordersShippingprice;
    data['orders_price'] = this.ordersPrice;
    data['orders_total'] = this.ordersTotal;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_carrierid'] = this.ordersCarrierid;
    data['orders_status'] = this.ordersStatus;
    data['orders_datetime'] = this.ordersDatetime;
    data['address_id'] = this.addressId;
    data['address_country'] = this.addressCountry;
    data['address_street'] = this.addressStreet;
    data['address_usersid'] = this.addressUsersid;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    return data;
  }
}