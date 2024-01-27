import 'dart:io';

import 'package:senior_porj/link_api.dart';
import '../../../../core/class/crud.dart';

class ItemData {
  Crud crud;
  ItemData(this.crud);
  get(String usersid) async {
    var response = await crud.postData(AppLink.itemsview, {"usersid":usersid});
    return response.fold((l) => 1, (r) => r);
  }

  getListed(String usersid) async {
    var response = await crud.postData(AppLink.itemslistview, {"usersid":usersid});
    return response.fold((l) => 1, (r) => r);
  }

  add(Map data, File? file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.itemsadd, data, file);
    return response.fold((l) => 1, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.itemsdelete, data);
    return response.fold((l) => 1, (r) => r);
  }

  edit(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemsedit, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.itemsedit, data, file);
    }
    return response.fold((l) => 1, (r) => r);
  }

  sortCat(String catName) async {
    var responce =
        await crud.postData(AppLink.itemssortbycategory, {"category": catName});
    return responce.fold((l) => 1, (r) => r);
  }

  searchItems(String search,String userid) async {
    var responce =
        await crud.postData(AppLink.searchitems, {"search": search , "userid": userid});
    return responce.fold((l) => 1, (r) => r);
  }


  searchListedItems(String search,String userid) async {
    var responce =
        await crud.postData(AppLink.searchlisteditems, {"search": search , "userid": userid});
    return responce.fold((l) => 1, (r) => r);
  }

  analyticsview(String usersid) async {
    var responce =
        await crud.postData(AppLink.analytics, {"usersid": usersid});
    return responce.fold((l) => 1, (r) => r);
  }
  analyticstotalview(String usersid) async {
    var responce =
        await crud.postData(AppLink.analyticstotal, {"usersid": usersid});
    return responce.fold((l) => 1, (r) => r);
  }
}
