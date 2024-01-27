import 'package:senior_porj/core/class/crud.dart';

import '../../../link_api.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
   addData(String usersid, String name, String city, String street, String country) async {
    var response = await crud.postData(AppLink.addressadd, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "country": country,
      
    });
    return response.fold((l) => l, (r) => r);
  }


  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.addressview, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.addressdelete, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
