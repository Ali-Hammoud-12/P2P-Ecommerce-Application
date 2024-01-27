import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';

class PendingData {
  Crud crud;
  PendingData(this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.pendingorders, {"usersid":usersid});
    return response.fold((l) => l, (r) => r);
  }
 
}
