import 'package:air_bnb_clone/config/routes/app_route_names.dart';
import 'package:air_bnb_clone/features/explore/view/components/place_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlaceListWidget extends StatefulWidget {
  const PlaceListWidget({super.key});

  @override
  State<PlaceListWidget> createState() => _PlaceListWidgetState();
}

class _PlaceListWidgetState extends State<PlaceListWidget> {
  final CollectionReference placeCollection =
      FirebaseFirestore.instance.collection('airBnbAppCollection');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: placeCollection.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error Fetching Data, Please try again later..'),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('List Is Empty...'),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final placeData = snapshot.data!.docs[index];
              return PlaceCardWidget(
                placeData: placeData,
                onTap: () {
                  Navigator.pushNamed(context, AppRouteNames.placeDetailScreen);
                },
              );
            },
          );
        }
      },
    );
  }
}
