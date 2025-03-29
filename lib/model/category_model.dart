// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> saveCategoriesToFirebase() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('AppCategory');

  for (final CategoryModel categoryModel in categoryList) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();

    ref.doc('das');
    await ref.doc(id).set(categoryModel.toMap());
  }
}

class CategoryModel {
  final String title;
  final String image;

  CategoryModel({
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
    };
  }
}

final List<CategoryModel> categoryList = [
  CategoryModel(
    title: 'Rooms',
    image: 'assets/icons/categories/rooms.svg',
  ),
];
