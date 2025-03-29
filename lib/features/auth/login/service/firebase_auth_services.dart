import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/features/auth/login/service/firebase_login_otp_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final fireStore = FirebaseFirestore.instance;
  final FirebaseLoginOtpService firebaseLoginOtpService =
      FirebaseLoginOtpService();

  Future<void> signIlnWithGoogleAccount(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication signInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: signInAuthentication.idToken, // JWT
          accessToken: signInAuthentication.accessToken,
        );

        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(authCredential);

        final User? user = userCredential.user;

        if (user != null) {
          final DocumentReference userRef =
              fireStore.collection('users').doc(user.uid);
          final DocumentSnapshot userSnapshot = await userRef.get();

          String customId = 'USR-${DateTime.now().millisecondsSinceEpoch}';

          if (!userSnapshot.exists) {
            // Add details to firestore database
            userRef.set({
              'uid': user.uid,
              'customId': customId,
              'username': user.displayName,
              'email': user.email,
              'profileImage': null,
              'mobile': user.phoneNumber,
              'createdAt': FieldValue.serverTimestamp(),
            });
          } else {
            customId = userSnapshot.get('customId') ?? customId;
          }

          if (context.mounted) {
            Navigator.pushReplacementNamed(context, AppRouteNames.homeScreen);
          }
        }
      }
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
    }
  }
}
