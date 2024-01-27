import 'package:senior_porj/core/class/statusrequest.dart';


handlingData(response){
  if (response is StatusRequest){
   return response ; 
  }else {
   return StatusRequest.success ; 
  }
}