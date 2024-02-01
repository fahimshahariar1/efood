
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/branch/widgets/branch_carousel_slider.dart';
import 'package:flutter_restaurant/features/branch/widgets/branch_product_list.dart';
import 'package:flutter_restaurant/features/branch/widgets/restaurant_info_widget.dart';
import 'package:flutter_restaurant/features/branch/widgets/search_field.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';


class Branch extends StatefulWidget {
  const Branch({Key? key}) : super(key: key);

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [


        SliverAppBar(
          leading: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,),
          actions: [

            Padding(padding: const EdgeInsets
                .only(right: 22),
              child: Container(
                height: 26, width: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius
                        .circular(2)
                ),
                child: Icon(
                  Icons.share,
                  color: Theme
                      .of(context)
                      .dialogBackgroundColor,
                  size: 17,),
              ),
            )
          ],

          pinned: true,
          expandedHeight: 280,
          flexibleSpace: Stack(children: [

            Container(margin: EdgeInsets.zero,
              child: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                background: Image.asset(
                    Images.restaurant,
                    fit: BoxFit.cover),
                title: Container(
                  height: 100,
                  color: Colors.transparent,
                  child: const RestaurantInfo(),),
              ),
            ),

          ]),
        ),

        const SliverToBoxAdapter(
            child: Column(
              children: [
                BranchCarousel(),

              ],
            )),

        SliverPersistentHeader(pinned: true,
            delegate: _SliverPersistentHeaderDelegate(
              child: Search(),
            )),

        const SliverToBoxAdapter(
          child: Column(children: [
              SizedBox(height: Dimensions.paddingSizeDefault),
              BranchProduct(),
            ],
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
