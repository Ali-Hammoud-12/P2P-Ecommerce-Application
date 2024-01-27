import 'package:senior_porj/link_api.dart';

import '../../../core/class/crud.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response = await crud.postData(
        AppLink.Items, {"id": id.toString(), "usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
   viewItems(String userid) async {
    var response = await crud.postData(
        AppLink.itemsshop, {"usersid": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }
 
 
}
