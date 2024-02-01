import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_restaurant/features/home/domain/models/banner_model.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';
import 'package:flutter_restaurant/util/styles.dart';

class BranchCarousel extends StatefulWidget {
  final List<BannerModel>? bannerList;

  const BranchCarousel({Key? key, this.bannerList}) : super(key: key);

  @override
  State<BranchCarousel> createState() => _BranchCarouselState();
}

class _BranchCarouselState extends State<BranchCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              background: CarouselSlider.builder(
                itemCount: widget.bannerList?.length ?? 0,
                options: CarouselOptions(
                  height: 120,
                  aspectRatio: 16 / 9,
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.easeInOut,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemBuilder: (context, index, _) {
                  return (widget.bannerList?.isNotEmpty ?? false) ?
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network('${widget.bannerList?[index].image}', fit: BoxFit.cover, width: double.infinity,),

                  ) : Image.asset(Images.bannerNew, width: 350);
                },
              ),

              ),
            ),


          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverPersistentHeaderDelegate(
              child:  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    child: TextField(decoration: InputDecoration(enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).hintColor)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                      ),

                      hintText: "Search Item", hintStyle: poppinsRegular.copyWith(color: Theme.of(context).hintColor),
                      prefixIcon: Icon(CupertinoIcons.search, color: Theme.of(context).hintColor,
                      ),
                    ),
                    ),
                  )

              ),
            ),
        ],
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
