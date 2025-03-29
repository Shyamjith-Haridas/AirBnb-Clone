import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseLoginOtpService {
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  // Check if the mobile number exists
  Future<bool> checkIfNumberExists(String mobileNumber) async {
    final querySnapshot =
        await userRef.where('mobile', isEqualTo: mobileNumber).get();

    return querySnapshot.docs.isNotEmpty;
  }

  // Save the mobile number
  Future<void> saveMobileNumber(String mobileNumber) async {
    await userRef.add(
      {
        'uid': null,
        'customId': 'USR-${DateTime.now().millisecondsSinceEpoch}',
        'username': null,
        'email': null,
        'profileImage': null,
        'mobile': mobileNumber,
        'createdAt': FieldValue.serverTimestamp(),
      },
    );
  }
}
