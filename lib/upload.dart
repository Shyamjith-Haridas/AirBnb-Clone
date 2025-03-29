import 'package:air_bnb_clone/model/place_model.dart';
import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            savePlacesToFirebase();
          },
          child: Text('Upload'),
        ),
      ),
    );
  }
}
