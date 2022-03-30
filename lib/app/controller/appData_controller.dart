import 'package:geolocator/geolocator.dart';
import 'package:scool/app/assistants/methods.dart';
import 'package:scool/app/data/model/address.dart';
import 'package:get/get.dart';

class AppData extends GetxController {
  Address pickUpLocation, dropOffLocation;
  Position currentPosition;
  String placeAddress;

  @override
  void onReady() {
    super.onReady();
    locatePosition();
  }

  void updatePickUpLocationAddress(Address pickUpAddess) {
    pickUpLocation = pickUpAddess;
    update();
  }

  void updateDropOffLocationAddress(Address dropOffAddress) {
    dropOffLocation = dropOffAddress;
    update();
  }

  void locatePosition() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    /* String address =  */
    placeAddress = await AssistantMethods.searchCoordinateAddress(position);
    placeAddress = placeAddress.substring(0, 35);

    //print("This is your address :: " + address);
  }
}
