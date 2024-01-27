import 'dart:io';

import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class ProfileData {
  Crud crud;
  ProfileData(this.crud);
  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.profilepic, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.profilepic, data, file);
    }
    return response.fold((l) => 1, (r) => r);
  }

  get(String userid) async {
    var response = await crud.postData(
        AppLink.showusers, {"usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
