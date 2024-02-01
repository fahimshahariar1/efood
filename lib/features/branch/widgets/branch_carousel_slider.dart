
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_restaurant/features/home/domain/models/banner_model.dart';
import 'package:flutter_restaurant/util/dimensions.dart';
import 'package:flutter_restaurant/util/images.dart';

class BranchCarousel extends StatefulWidget {
  final List<BannerModel>? bannerList;

  const BranchCarousel({Key? key, this.bannerList}) : super(key: key);

  @override
  _BranchCarouselState createState() => _BranchCarouselState();
}

class _BranchCarouselState extends State<BranchCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
          child: CarouselSlider.builder(
            itemCount: widget.bannerList?.length ?? 0,
            options: CarouselOptions(
              padEnds: false,
              height: 100,
              //aspectRatio: 16/9,
              disableCenter: true,
              enlargeCenterPage: true,
              //enlargeStrategy: CenterPageEnlargeStrategy.zoom,
              viewportFraction: 0.8,
              autoPlayCurve: Curves.easeInOut,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return (widget.bannerList?.isNotEmpty ?? false)
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.fontSizeExtraSmallest),
                child: Image.network(
                  '${widget.bannerList?[index].image}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )
                  : Image.asset(Images.bannerNew);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.bannerList?.length ?? 4,
                (index) => _buildDotIndicator(index),
          ),
        ),
        SizedBox(height: Dimensions.paddingSizeDefault),
      ],
    );
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      width: _currentIndex == index ? 14 : 6,
      height: 4,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        //shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
        color: _currentIndex == index ? Theme.of(context).dialogBackgroundColor : Theme.of(context).dialogBackgroundColor.withOpacity(0.3),
      ),
    );
  }
}
