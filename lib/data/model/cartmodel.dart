class CartModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersid;
  String? cartItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsDescription;
  String? itemsQuantity;
  String? itemsImage;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCid;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDescription,
      this.itemsQuantity,
      this.itemsImage,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCid});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDescription = json['items_description'];
    itemsQuantity = json['items_quantity'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCid = json['items_cid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_description'] = this.itemsDescription;
    data['items_quantity'] = this.itemsQuantity;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cid'] = this.itemsCid;
    return data;
  }
}