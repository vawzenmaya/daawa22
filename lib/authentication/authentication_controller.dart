import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daawatok/authentication/login_screen.dart';
import 'package:daawatok/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController
{
  static AuthenticationController instanceAuth = Get.find();

  late Rx<File?> _pickedFile;
  File? get profileImage => _pickedFile.value;

  void chooseImageFromGallery() async
  {
     final pickedImageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

     if(pickedImageFile != null)
     {
       Get.snackbar(
         "Profile Image",
         "successfully selected profile image.",
       );
     }

     _pickedFile = Rx<File?>(File(pickedImageFile!.path));
  }

  void createAccountForNewUser(File imageFile,String userName, String userEmail, String userPassword ) async
  {

    try
    {
      //1. create user in firebase
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      //save user profileimage storage
      String imageDownloaderUrl = await uploadImageToStorage(imageFile);
      //save user data to firebase database
      userModel.User user = userModel.User(
        name: userName,
        email: userEmail,
        image: imageDownloaderUrl,
        uid:  credential.user!.uid,


      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(credential.user!.uid)
          .set(user.toJson());
    }
    catch(error)
    {
      Get.snackbar("Account Creation Unsuccessful","Error Occured While Creating Account. Try Again.");

      showProgressBar = false;
      Get.to(LoginScreen());
    }

  }

  Future<String> uploadImageToStorage(File imageFile) async
  {
    Reference reference = FirebaseStorage.instance.ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadUrlOfUploadedImage = await taskSnapshot.ref.getDownloadURL();

    return downloadUrlOfUploadedImage;
  }
}

