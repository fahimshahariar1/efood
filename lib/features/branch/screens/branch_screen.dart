
import 'package:flutter/material.dart';
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
        slivers: [ SliverAppBar(leading: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
            floating: true, snap: true,

            actions: [ Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: Dimensions.paddingSizeLarge),
                    child: Container(
                         height: Dimensions.paddingSizeMedium, width: Dimensions.paddingSizeMedium,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radiusSmall),color: Colors.white),
                        child: Icon(Icons.share, color: Theme.of(context).highlightColor,size: Dimensions.paddingSizeDefault,)),
                  )
                ],
              )
            ],
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset(Images.restaurant, fit: BoxFit.cover),
            ),
          ),

            SliverToBoxAdapter(
            child: Container( decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault)),
              child:  const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),

                    child: RestaurantInfo(),
                  ),
                  SizedBox(height: Dimensions.paddingSizeDefault,),

                  BranchCarousel(),
                  
                  BranchProduct()
                ],
              ),
            ),
          ),

        ],
      ),

    );
  }
}





