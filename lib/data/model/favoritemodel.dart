class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
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
  String? usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDescription,
      this.itemsQuantity,
      this.itemsImage,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCid,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
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
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersid'] = this.favoriteUsersid;
    data['favorite_itemsid'] = this.favoriteItemsid;
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
    data['users_id'] = this.usersId;
    return data;
  }
}