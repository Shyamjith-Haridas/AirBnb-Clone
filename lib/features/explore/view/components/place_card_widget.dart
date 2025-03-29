import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import 'guest_favourite_widget.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({
    super.key,
    required this.onTap,
    required this.placeData,
  });

  final VoidCallback onTap;
  final DocumentSnapshot<Object?> placeData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          19.verticalSpace,
          Stack(
            children: [
              Container(
                height: 350,
                width: 1.sw,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                //todo: another carousel instead of child
                child: AnotherCarousel(
                  images: placeData['imageUrls']
                      .map((url) => NetworkImage(url))
                      .toList(),
                  dotSize: 5.r,
                  autoplay: false,
                  dotSpacing: 10.w,
                  dotIncreaseSize: 6.r,
                  indicatorBgPadding: 0.0,
                  dotHorizontalPadding: 5.w,
                  animationCurve: Curves.easeInOut,
                  dotBgColor: TAppColors.transparent,
                ),
              ),

              // Guest favourite label
              if (placeData['guestFavourite'] == true)
                Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: GuestFavoriteWidget(),
                ),

              // Wishlist
              Positioned(
                right: 10.w,
                child: IconButton(
                  onPressed: () {
                    // todo: wish list function
                  },
                  icon: Icon(
                    Icons.favorite_rounded,
                    color: TAppColors.black,
                  ),
                ),
              )
            ],
          ),
          12.verticalSpace,

          // Place details
          Row(
            children: [
              Text(placeData['address'],
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const Spacer(),
              Icon(Icons.star, size: 18.h),
              5.horizontalSpace,
              Text(placeData['rating'].toString())
            ],
          ),

          // add this data in firebase
          Text('Viewed ${placeData['viewedCount']} times last week',
              style: TextStyle(color: Colors.black54)),

          Text(placeData['date'], style: TextStyle(color: Colors.black54)),
          Row(
            children: [
              Icon(Icons.currency_rupee, size: 16.h),
              Text(placeData['price'].toString(),
                  style: TextStyle(fontWeight: FontWeight.w600)),
              5.horizontalSpace,
              Text('night')
            ],
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}
