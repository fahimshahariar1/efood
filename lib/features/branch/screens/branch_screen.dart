
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/widgets/customizable_spacebar_widget.dart';
import 'package:flutter_restaurant/features/branch/widgets/branch_carousel_slider.dart';
import 'package:flutter_restaurant/features/branch/widgets/branch_product_list.dart';
import 'package:flutter_restaurant/features/branch/widgets/restaurant_info_widget.dart';

import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';



class Branch extends StatefulWidget {
  const Branch({Key? key}) : super(key: key);

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            pinned: true,
            expandedHeight: 250,

            flexibleSpace: Container(margin: EdgeInsets.zero,
              child: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                background: Image.asset(Images.restaurant, fit: BoxFit.cover,),
                title: CustomizableSpaceBarWidget(
                  builder: (context, scrollingRate) {
                    if (kDebugMode) {
                      print(scrollingRate);
                    }
                    return Container(
                      height: 100 - (scrollingRate * 200),
                      color: Colors.red,
                      child: const Column(
                        children: [

                            RestaurantInfo()
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),


            const SliverToBoxAdapter(
            child:  Column(
              children: [

                SizedBox(height: Dimensions.paddingSizeDefault,),

                BranchCarousel(),

                BranchProduct()
              ],
            ),
          ),

        ],
      ),

    );
  }
}





