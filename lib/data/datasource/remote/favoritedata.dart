import 'package:senior_porj/link_api.dart';

import '../../../core/class/crud.dart';


class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.AddFavorite, {"usersid": usersid , "itemsid":itemsid});
    return response.fold((l) => l, (r) => r);
  }
  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.RemoveFavorite, {"usersid": usersid , "itemsid":itemsid });
    return response.fold((l) => l, (r) => r);
  }

}