import 'package:senior_porj/link_api.dart';

import '../../../../core/class/crud.dart';
class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email   ) async {
    var response = await crud.postData(AppLink.checkemail, {
      "email" : email , 
   
     
    });
    return response.fold((l) => l, (r) => r);
  }
}