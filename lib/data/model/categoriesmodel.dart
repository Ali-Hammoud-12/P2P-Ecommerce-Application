class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDescription;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesImage,
      this.categoriesDescription,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDescription = json['categories_description'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_image'] = this.categoriesImage;
    data['categories_description'] = this.categoriesDescription;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}