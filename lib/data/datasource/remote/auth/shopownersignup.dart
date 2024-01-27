import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';
class ShopOwnerSignupData {
  Crud crud;
  ShopOwnerSignupData(this.crud);
  postdata(String username ,String password ,String email ,String phone ) async {
    var response = await crud.postData(AppLink.shopownersignUp, {
      "username" : username , 
      "password" : password  , 
      "email" : email , 
      "phone" : phone  , 
    });
    return response.fold((l) => l, (r) => r);
  }
}