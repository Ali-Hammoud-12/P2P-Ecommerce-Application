import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';

class DetailsData {
  Crud crud;
  DetailsData(this.crud);
  getDetails(String ordersid) async {
    var response = await crud.postData(AppLink.details, {"ordersid": ordersid});
    return response.fold((l) => l, (r) => r);
  }
}
