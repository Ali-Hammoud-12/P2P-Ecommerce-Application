class AnalyticsModel {
  String? total;
  String? itemsName;
  String? itemsImage;

  AnalyticsModel({this.total, this.itemsName, this.itemsImage});

  AnalyticsModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    itemsName = json['items_name'];
    itemsImage = json['items_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['items_name'] = this.itemsName;
    data['items_image'] = this.itemsImage;
    return data;
  }
}

class AnalyticsTotalModel {
  String? totalprofit;

  AnalyticsTotalModel({this.totalprofit});

  AnalyticsTotalModel.fromJson(Map<String, dynamic> json) {
    totalprofit = json['totalprofit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalprofit'] = this.totalprofit;
    return data;
  }
}