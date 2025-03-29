import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePlacesToFirebase() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('airBnbAppCollection');

  for (final PlaceModel place in listOfPlaces) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();

    ref.doc('das');
    await ref.doc(id).set(place.toMap());
  }
}

class PlaceModel {
  final String title;
  bool isActive;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String fullAddress;
  final String vendor;
  final String vendorProffession;
  final String vendorProfile;
  final int review;
  final String bedAndBathroom;
  final String yearsOfHosting;
  final double latitude;
  final double logitude;
  final List<String> imageUrls;
  final bool guestFavourite;
  final int viewedCount;

  PlaceModel({
    required this.title,
    required this.isActive,
    required this.rating,
    required this.date,
    required this.price,
    required this.address,
    required this.fullAddress,
    required this.vendor,
    required this.vendorProffession,
    required this.vendorProfile,
    required this.review,
    required this.bedAndBathroom,
    required this.yearsOfHosting,
    required this.latitude,
    required this.logitude,
    required this.imageUrls,
    required this.guestFavourite,
    required this.viewedCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isActive': isActive,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'fullAddress': fullAddress,
      'vendor': vendor,
      'vendorProffession': vendorProffession,
      'vendorProfile': vendorProfile,
      'review': review,
      'bedAndBathroom': bedAndBathroom,
      'yearsOfHosting': yearsOfHosting,
      'latitude': latitude,
      'logitude': logitude,
      'imageUrls': imageUrls,
      'guestFavourite': guestFavourite,
      'viewedCount': viewedCount,
    };
  }
}

List<PlaceModel> listOfPlaces = [
  PlaceModel(
    title: "SyIvan Resort",
    isActive: true,
    rating: 4.89,
    date: "23-28 Mar",
    price: 22523,
    address: "Manjalamkolly, Wayanad",
    fullAddress: "Manjalamkolly, 673121 Wayanad, India",
    vendor: "John Doe",
    vendorProffession: "Superhost",
    vendorProfile:
        "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    review: 120,
    bedAndBathroom: "6 guests • 3 Bedrooms • 4 Beds • 1 bathroom",
    yearsOfHosting: '5 years',
    latitude: 39.7392,
    logitude: -104.9903,
    guestFavourite: true,
    viewedCount: 314,
    imageUrls: [
      "https://images.unsplash.com/photo-1631049421450-348ccd7f8949?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1631048835184-3f0ceda91b75?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1631049421450-348ccd7f8949?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1610392734074-02f696fd30a8?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1587985064135-0366536eab42?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ],
  ),
  PlaceModel(
    title: "Cofygram cottages",
    isActive: true,
    rating: 4.98,
    date: "31 Mar - 5 Apr",
    price: 4666,
    address: "Kaniyambetta, Wayanad",
    fullAddress:
        "Kaniyambetta, Ambalachal Padavayal road Elanthilat Madam, 673124 Wayanad",
    vendor: "Emily Smith",
    vendorProffession: "Luxury Host",
    vendorProfile:
        "https://plus.unsplash.com/premium_photo-1679440415182-c362deb2fd40?q=80&w=2788&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    review: 89,
    bedAndBathroom: "2 guests • 1 Bedroom • 1 Bed • 1 Bathrrom",
    yearsOfHosting: '11 years',
    latitude: 34.0259,
    logitude: -118.7798,
    guestFavourite: false,
    viewedCount: 412,
    imageUrls: [
      "https://images.unsplash.com/photo-1639042503379-0b83a4bc33e9?q=80&w=2920&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1602693680203-a01c07f9dfae?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1601999705946-fbf42c3c6c66?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1621293954908-907159247fc8?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    ],
  ),
  PlaceModel(
    title: "Zostel Homes Wayanad",
    isActive: false,
    rating: 4.93,
    date: "6-11 Jun",
    price: 1769,
    address: "Thirunelli, Wayanad",
    fullAddress: "Himagiri Homes, Thirunelli Temple PO, 670646 Wayanad, India",
    vendor: "Michael Johnson",
    vendorProffession: "City Host",
    vendorProfile: "https://source.unsplash.com/100x100/?man,face",
    review: 69,
    bedAndBathroom: "4 guests • 2 Bedrooms • 2 Beds • 3 Bathrooms",
    yearsOfHosting: '6 months',
    latitude: 40.7128,
    logitude: -74.0060,
    guestFavourite: false,
    viewedCount: 984,
    imageUrls: [
      "https://images.unsplash.com/photo-1594130139005-3f0c0f0e7c5e?q=80&w=2912&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1631048730670-ff5cd0d08f15?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1631049035115-f96132761a38?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?q=80&w=2942&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1605346576608-92f1346b67d6?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ],
  ),
  PlaceModel(
    title: "Pauls Retreat Wayanad",
    isActive: true,
    rating: 4.86,
    date: "1-6 Apr",
    price: 2852,
    address: "Koyileri, Wayanad",
    fullAddress: "Pauls Retreat  Wayanad, 670646 Wayanad, India",
    vendor: "Sophia Paul",
    vendorProffession: "Eco-Friendly Host",
    vendorProfile:
        "https://images.unsplash.com/photo-1481214110143-ed630356e1bb?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    review: 93,
    bedAndBathroom: "4 guests • 1 Bedroom • 2 Beds • 1 Bathroom",
    yearsOfHosting: '5 years',
    latitude: -8.4095,
    logitude: 115.1889,
    guestFavourite: true,
    viewedCount: 136,
    imageUrls: [
      "https://plus.unsplash.com/premium_photo-1686090449192-4ab1d00cb735?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1686090449936-acfc6bc38f67?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://plus.unsplash.com/premium_photo-1686090448517-2f692cc45187?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1631049552240-59c37f38802b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1618221381711-42ca8ab6e908?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ],
  ),
  PlaceModel(
    title: "Golden Peak Estate Homestay",
    isActive: false,
    rating: 4.8,
    date: "12-17 Mar",
    price: 1810,
    address: "Kariambadi, Wayanad",
    fullAddress:
        "Samuval K P, Kannothukudiyil House Golden Peak Eastate Homestay Kariambadi Post Wayanad, 673591 Wayanad, India",
    vendor: "Samual KP",
    vendorProffession: "Luxury Castle Host",
    vendorProfile:
        "https://images.unsplash.com/photo-1610088441520-4352457e7095?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    review: 200,
    bedAndBathroom: "8 guests • 4 Bedroom  • 7 Beds • 3 Bathrooms",
    yearsOfHosting: "8 years",
    latitude: 55.9533,
    logitude: -3.1883,
    guestFavourite: false,
    viewedCount: 105,
    imageUrls: [
      "https://images.unsplash.com/photo-1586861635167-e5223aadc9fe?q=80&w=2788&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1576158831003-d41033ec31fd?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1590523277543-a94d2e4eb00b?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1615874959474-d609969a20ed?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "https://images.unsplash.com/photo-1612152605347-f93296cb657d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    ],
  ),
];
