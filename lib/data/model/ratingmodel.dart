class RatingModel {
  String? ratingId;
  String? ratingUsersid;
  String? ratingItemsid;
  String? ratingRate;
  String? ratingNote;
  String? itemsId;
  String? itemsUsersid;
  String? itemsName;
  String? itemsDescription;
  String? itemsQuantity;
  String? itemsImage;
  String? itemsActive;
  String? itemsPrice;
  String? itemsShippingprice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsCid;
  String? usersId;
  String? usersType;
  String? usersName;
  String? usersPhone;
  String? usersEmail;
  String? usersVerfiycode;
  String? usersApprove;
  String? usersPassword;

  RatingModel(
      {this.ratingId,
      this.ratingUsersid,
      this.ratingItemsid,
      this.ratingRate,
      this.ratingNote,
      this.itemsId,
      this.itemsUsersid,
      this.itemsName,
      this.itemsDescription,
      this.itemsQuantity,
      this.itemsImage,
      this.itemsActive,
      this.itemsPrice,
      this.itemsShippingprice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCid,
      this.usersId,
      this.usersType,
      this.usersName,
      this.usersPhone,
      this.usersEmail,
      this.usersVerfiycode,
      this.usersApprove,
      this.usersPassword});

  RatingModel.fromJson(Map<String, dynamic> json) {
    ratingId = json['rating_id'];
    ratingUsersid = json['rating_usersid'];
    ratingItemsid = json['rating_itemsid'];
    ratingRate = json['rating_rate'];
    ratingNote = json['rating_note'];
    itemsId = json['items_id'];
    itemsUsersid = json['items_usersid'];
    itemsName = json['items_name'];
    itemsDescription = json['items_description'];
    itemsQuantity = json['items_quantity'];
    itemsImage = json['items_image'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsShippingprice = json['items_shippingprice'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCid = json['items_cid'];
    usersId = json['users_id'];
    usersType = json['users_type'];
    usersName = json['users_name'];
    usersPhone = json['users_phone'];
    usersEmail = json['users_email'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    usersPassword = json['users_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_id'] = this.ratingId;
    data['rating_usersid'] = this.ratingUsersid;
    data['rating_itemsid'] = this.ratingItemsid;
    data['rating_rate'] = this.ratingRate;
    data['rating_note'] = this.ratingNote;
    data['items_id'] = this.itemsId;
    data['items_usersid'] = this.itemsUsersid;
    data['items_name'] = this.itemsName;
    data['items_description'] = this.itemsDescription;
    data['items_quantity'] = this.itemsQuantity;
    data['items_image'] = this.itemsImage;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_shippingprice'] = this.itemsShippingprice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cid'] = this.itemsCid;
    data['users_id'] = this.usersId;
    data['users_type'] = this.usersType;
    data['users_name'] = this.usersName;
    data['users_phone'] = this.usersPhone;
    data['users_email'] = this.usersEmail;
    data['users_verfiycode'] = this.usersVerfiycode;
    data['users_approve'] = this.usersApprove;
    data['users_password'] = this.usersPassword;
    return data;
  }
}
