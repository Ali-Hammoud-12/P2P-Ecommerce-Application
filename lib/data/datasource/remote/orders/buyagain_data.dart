import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';

class BuyagainData {
  Crud crud;
 BuyagainData (this.crud);
  getData(String usersid) async {
    var response = await crud.postData(AppLink.buyagain, {"usersid":usersid});
    return response.fold((l) => l, (r) => r);
  }
}