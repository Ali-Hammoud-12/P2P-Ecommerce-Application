import 'package:senior_porj/link_api.dart';
import '../../../../core/class/crud.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);
  get() async {
    var response = await crud.postData(AppLink.categoryview, {});
    return response.fold((l) => 1, (r) => r);
  }
}
