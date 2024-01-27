class ItemsModel {
  String? itemsId;
  String? itemsUsersid;
  String? itemsName;
  String? itemsDescription;
  String? itemsQuantity;
  String? itemsImage;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCid;
  String? itemsPriceDiscount;
  String? itemsShipingPrice;
 String? usersName;
  String? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;

  ItemsModel(
      {this.itemsId,
      this.itemsUsersid,
      this.itemsName,
      this.itemsDescription,
      this.itemsQuantity,
      this.itemsImage,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCid,
      this.itemsPriceDiscount,
      this.itemsShipingPrice,
      this.usersName,
      this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDatetime,
      this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsUsersid = json['items_usersid'];
    itemsName = json['items_name'];
    itemsDescription = json['items_description'];
    itemsQuantity = json['items_quantity'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_datetime'];
    itemsCid = json['items_cid'];
    itemsPriceDiscount = json['itemspricediscount'];
   itemsShipingPrice = json['items_shippingprice'];
   usersName = json['users_name'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_usersid'] = this.itemsUsersid;
    data['items_name'] = this.itemsName;
    data['items_description'] = this.itemsDescription;
    data['items_quantity'] = this.itemsQuantity;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_datetime'] = this.itemsDate;
    data['items_cid'] = this.itemsCid;
    data['itemspricediscount'] = this.itemsPriceDiscount;
    data['items_shippingprice'] = this.itemsShipingPrice;
    data['users_name'] = this.usersName;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    return data;
  }
}