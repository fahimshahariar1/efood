import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/features/home/domain/models/banner_model.dart';

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
    return Column(
      children: [
        CarouselSlider.builder(
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
              child: Image.network(
                '${widget.bannerList?[index].image}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ): const Center(child: SizedBox(child: Text("No Data"),));
          },
        ),

      ],
    );
  }
}
