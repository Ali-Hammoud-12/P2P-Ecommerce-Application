import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.addcart, {"usersid": usersid , "itemsid":itemsid});
    return response.fold((l) => l, (r) => r);
  }
  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.deletecart, {"usersid": usersid , "itemsid":itemsid });
    return response.fold((l) => l, (r) => r);
  }
   getCountCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.cartgetcountitems, {"usersid": usersid , "itemsid":itemsid });
    return response.fold((l) => l, (r) => r);
  }
  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.viewcart, {"usersid": usersid });
    return response.fold((l) => l, (r) => r);
  }
   rating(
    String itemsid,
    String userid,
    String comment,
    String rating,
  ) async {
    var response = await crud.postData(AppLink.addrating, {
      "itemsid": itemsid.toString(),
      "usersid": userid.toString(),
      "comment": comment.toString(),
      "rating": rating.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
   viewRating(String itemsid) async {
    var response = await crud.postData(AppLink.viewrating, {"itemsid": itemsid });
    return response.fold((l) => l, (r) => r);
  }

}