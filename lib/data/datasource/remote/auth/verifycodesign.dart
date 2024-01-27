import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';
class VerifyCodesignData {
  Crud crud;
  VerifyCodesignData(this.crud);
  postdata(String email ,String verifycode ) async {
    var response = await crud.postData(AppLink.verifycodesign, {
      
      "email" : email , 
      "verifycode" : verifycode  , 
    });
    return response.fold((l) => l, (r) => r);
  }
  resendData(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}