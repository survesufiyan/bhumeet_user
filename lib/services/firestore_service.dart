import 'package:get/get.dart';

class FirestoreService extends GetxService {
  static FirestoreService get to => Get.find();

  Future<bool> checkIfUserAvailable(String uid) async {
    // Check if user is available in Firestore
    return false;
  }
}
