import '../../../../../core/class/crud.dart';
import '../../../../../link_api.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);
  
  getPendingData(String usersid) async {
    var responce = await crud.postData(AppLink.viewpending, {"userid":usersid});
    return responce.fold((l) => 1, (r) => r);
  }

  approveOrder(String userid, String orderid, String itemsid) async {
    var responce = await crud
        .postData(AppLink.approve, {"usersid": userid, "ordersid": orderid, "itemsid":itemsid});
    return responce.fold((l) => 1, (r) => r);
  }

  getAcceptedData() async {
    var responce = await crud.postData(AppLink.viewaccepted, {});
    return responce.fold((l) => 1, (r) => r);
  }

  getArchiveData() async {
    var responce = await crud.postData(AppLink.viewarchiveOrders, {});
    return responce.fold((l) => 1, (r) => r);
  }


  getorderDetailsData(String usersid , String ordersid) async {
    var responce = await crud
        .postData(AppLink.shopownerorderdetails, {"usersid": usersid, "ordersid": ordersid});
    return responce.fold((l) => 1, (r) => r);
  }
  getorderDetailsData2(String usersid , String ordersid) async {
    var responce = await crud
        .postData(AppLink.shopownerorderdetails2, {"usersid": usersid, "ordersid": ordersid});
    return responce.fold((l) => 1, (r) => r);
  }
}