import 'package:scool/app/controller/appData_controller.dart';
import 'package:scool/app/data/model/address.dart';
import 'package:scool/app/utils/configMaps.dart';
import 'package:scool/app/assistants/request.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress(Position position) async {
    String placeAddress = "";
    String st1, st2, st3; //   st4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if (response["status"].toString() == "REQUEST_DENIED") {
      placeAddress = "                      Verificar API";
    } else {
      if (response["status"].toString() != "failed") {
        //placeAddress = response["results"][0]["formatted_address"];
        st1 = response["results"][0]["address_components"][1]["short_name"];
        st2 = response["results"][0]["address_components"][2]["short_name"];
        st3 = response["results"][0]["address_components"][4]["short_name"];
        //st4 = response["results"][0]["address_components"][6]["long_name"];
        placeAddress = st1 + " " + st2 + " " + st3; // + " " + st4;

        Address userPickUpAddress = Address();
        userPickUpAddress.latitude = position.latitude;
        userPickUpAddress.longitude = position.longitude;
        userPickUpAddress.placeName = placeAddress;

        //AppData appData = Get.find<AppData>();
        AppData appData = Get.put(AppData());

        appData.updatePickUpLocationAddress(userPickUpAddress);
      }
    }

    return placeAddress;
  }
}
