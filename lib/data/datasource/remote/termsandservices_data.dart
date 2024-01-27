import 'package:senior_porj/link_api.dart';

import '../../../core/class/crud.dart';

class TermsData {
  Crud crud;
  TermsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.termsandservices, {});
    return response.fold((l) => l, (r) => r);
  }
}