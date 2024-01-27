class ShopOrderDetailsModel {
  String? orderdetailsQty;
  String? orderdetailsItemsid;
  String? orderdetailsOid;
  String? orderdetailsapprove;
  String? usersId;
  String? itemsName;
  String? totalprice;
  String? orderdetailsImage;
  String? usersName;

  ShopOrderDetailsModel(
      {this.orderdetailsQty,
      this.orderdetailsItemsid,
      this.orderdetailsOid,
      this.usersId,
      this.itemsName,
      this.totalprice,
      this.orderdetailsImage,
      this.orderdetailsapprove,
      this.usersName});

  ShopOrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderdetailsQty = json['orderdetails_qty'];
    orderdetailsItemsid = json['orderdetails_itemsid'];
    orderdetailsOid = json['orderdetails_oid'];
    usersId = json['users_id'];
    itemsName = json['items_name'];
    totalprice = json['totalprice'];
    orderdetailsImage = json['orderdetails_image'];
    usersName = json['users_name'];
    orderdetailsapprove = json['orderdetails_approve'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderdetails_qty'] = this.orderdetailsQty;
    data['orderdetails_itemsid'] = this.orderdetailsItemsid;
    data['orderdetails_oid'] = this.orderdetailsOid;
    data['users_id'] = this.usersId;
    data['items_name'] = this.itemsName;
    data['totalprice'] = this.totalprice;
    data['orderdetails_image'] = this.orderdetailsImage;
    data['users_name'] = this.usersName;
    data['orderdetails_approve'] = this.orderdetailsapprove;
    return data;
  }
}
