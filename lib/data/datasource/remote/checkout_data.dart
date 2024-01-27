import '../../../core/class/crud.dart';
import '../../../link_api.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout,data);
    return response.fold((l) => l, (r) => r);
  }
  carrier(String addressid) async {
    var response = await crud.postData(AppLink.carrier, {"addressid":addressid});
    return response.fold((l) => l, (r) => r);
  }
}