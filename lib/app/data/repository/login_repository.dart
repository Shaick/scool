import 'package:scool/app/data/model/user_model.dart';
import 'package:scool/app/data/provider/login_provider.dart';

class LoginRepository {
  final LoginProvider apiClient = LoginProvider();

  Future<UserModel> createUserWithEmailAndPasswor(
      String email, String password, String name) {
    return apiClient.createUserWithEmailAndPassword(email, password, name);
  }

  Future<UserModel> signInWithEmailAndPassword(String email, String password) {
    return apiClient.signInWithEmailAndPassword(email, password);
  }

  void signOut() {
    apiClient.singOut();
  }
}
