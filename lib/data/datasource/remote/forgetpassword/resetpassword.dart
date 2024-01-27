import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';
class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email ,String password  ) async {
    var response = await crud.postData(AppLink.resetpassword, {
      "email" : email , 
      "password" : password  , 
     
    });
    return response.fold((l) => l, (r) => r);
  }
  change(String usersid ,String password  ) async {
    var response = await crud.postData(AppLink.changepassword, {
      "usersid" : usersid , 
      "password" : password  , 
     
    });
    return response.fold((l) => l, (r) => r);
  }
}