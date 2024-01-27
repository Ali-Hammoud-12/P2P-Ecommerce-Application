import 'package:get/get.dart';
import 'package:senior_porj/core/class/statusrequest.dart';
import 'package:senior_porj/core/services/services.dart';
import 'package:senior_porj/data/datasource/remote/address_data.dart';
import 'package:senior_porj/data/model/addressmodel.dart';

import '../core/constant/routes.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/remote/checkout_data.dart';
import '../data/model/carriermodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? carriername;
  String? deliveryType;
  String addressid = "0";
  late String priceorders;
  late String shippingorders;
  late String total;


  List<AddressModel> dataaddress = [];
  List<CarrierModel> data = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseShippingAddress(String val) async {
    addressid = val;
    update();
    data.clear();
    var response = await checkoutData.carrier(val);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CarrierModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  chooseCarrier(val) {
    carriername = val;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please Select Payment Method");
    }

    if (addressid == "0") {
      Get.snackbar("Error", "Please Select Your Address");
    }
    if (carriername == null) {
      Get.snackbar("Error", "Please Select Your Carrier");
    } else {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "usersid": myServices.sharedPreferences.getString("id"),
        "addressid": addressid,
        "shippingprice": shippingorders,
        "ordersprice": priceorders,
        "total":total,
        "paymentmethod": paymentMethod.toString(),
        "carrierid":carriername,
      };

      var response = await checkoutData.checkout(data);

      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.homePage);
          Get.snackbar("Success", "the order was successfully");
        } else {
          statusRequest = StatusRequest.none;
          Get.snackbar("Error", "try again");
        }
        // End
      }
      update();
    }
  }

  @override
  void onInit() {
    priceorders = Get.arguments['priceorder'];
    shippingorders = Get.arguments['shippingprice'];
    total = Get.arguments['total'];
    getShippingAddress();
    chooseShippingAddress(addressid);
    super.onInit();
  }
}
