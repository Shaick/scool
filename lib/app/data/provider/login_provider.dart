import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scool/app/data/model/user_model.dart';
import 'package:scool/app/routes/app_routes.dart';

class LoginProvider {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('login_firebase');
  bool loading = false;
  final fb = FacebookLogin();

  User get user => _firebaseAuth.currentUser;

  Stream<UserModel> get onAuthStateChanged => _firebaseAuth
      .authStateChanges()
      .map((User currentUser) => UserModel.fromSnapshot(currentUser));

  Future signInWithCredentail(AuthCredential credential) async {
    await _firebaseAuth.signInWithCredential(credential);
  }

  // ignore: missing_return
  Future<UserModel> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;

      // atualizar nome do User
      await currentUser.updateProfile(displayName: name);
      await currentUser.updateProfile(
          photoURL: 'https://aux.iconspalace.com/uploads/guest-icon-256.png');

      await currentUser.reload();
      return UserModel.fromSnapshot(currentUser);
    } on FirebaseAuthException catch (e) {
      Get.back();
      print(e);
      switch (e.code) {
        case 'email-already-in-use':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Email já cadastrado."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'wrong-password':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Senha não confere."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'user-disable':
          Get.defaultDialog(
              title: "ERROR", content: Text("Usuário desativado."));
          break;
        case 'too-many-requests':
          Get.defaultDialog(
            title: "ERROR",
            content:
                Text("Muitas tentativas, dados incorretos, tente mais tarde."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'operation-not-allowed':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Login não autorizado."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        default:
          Get.defaultDialog(
            title: "ERROR",
            content: Text("${e.toString()}"),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
      }
      return null;
    }
  }

  // ignore: missing_return
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return UserModel.fromSnapshot(currentUser);
    } on FirebaseAuthException catch (e) {
      Get.back();
      print(e);
      switch (e.code) {
        case 'wrong-password':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Senha não confere."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'user-disable':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Usuário desativado."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'user-not-found':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Usuário não encontrado."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'too-many-requests':
          Get.defaultDialog(
            title: "ERROR",
            content:
                Text("Muitas tentativas, dados incorretos, tente mais tarde."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'unknown':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("db recebeu Campos vazios"),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
        case 'operation-not-allowed':
          Get.defaultDialog(
            title: "ERROR",
            content: Text("Login não autorizado."),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );

          break;
        default:
          Get.defaultDialog(
            title: "ERROR",
            content: Text("${e.toString()}"),
            cancel: Icon(
              Icons.warning,
              color: Colors.amber,
              size: 40,
            ),
          );
          break;
      }
      return null;
    }
  }

  //Logoff
  singOut() {
    box.write("auth", null);
    //box.erase();
    Get.toNamed(Routes.INITIAL);
    return _firebaseAuth.signOut();
  }

  loginFacebook() async {
    print('Starting Facebook Login');

    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (res.status) {
      case FacebookLoginStatus.Success:
        print('It worked');

        //Get Token
        final FacebookAccessToken fbToken = res.accessToken;

        //Convert to Auth Credential
        final AuthCredential credential =
            FacebookAuthProvider.credential(fbToken.token);

        //User Credential to Sign in with Firebase
        final result = await signInWithCredentail(credential);

        print('${result.user.displayName} is now logged in');
        Get.toNamed(Routes.DONE);

        break;
      case FacebookLoginStatus.Cancel:
        print('The user canceled the login');
        break;
      case FacebookLoginStatus.Error:
        print('There was an error');
        Get.toNamed(Routes.INITIAL);
        break;
    }
  }
}

/*   Future<void> login() async {
    try {
      // by default the login method has the next permissions ['email','public_profile']
      AccessToken accessToken = await FacebookAuth.instance.login();
      print(accessToken.toJson());
      // get the user data
      final userData = await FacebookAuth.instance.getUserData();
      print(userData);
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          break;
      }
    }
  } */
