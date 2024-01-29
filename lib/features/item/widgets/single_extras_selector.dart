import 'package:flutter/material.dart';
import 'package:flutter_restaurant/common/models/product_model.dart';
import 'package:flutter_restaurant/localization/language_constrants.dart';
import 'package:flutter_restaurant/utill/dimensions.dart';
import 'package:flutter_restaurant/utill/styles.dart';

class SingleSelector extends StatefulWidget {
  final Product product;

  const SingleSelector({Key? key, required this.product}) : super(key: key);

  @override
  State<SingleSelector> createState() => _SingleSelectorState();
}

class _SingleSelectorState extends State<SingleSelector> {
  int? selectedOption;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.product.variations?.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.product.variations![index].values?.length,
          itemBuilder: (context, token) {
            return Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Column(
                  children: [
                    ListTile(
                      leading: Radio(
                        value: token,
                        groupValue: selectedOption,
                        onChanged: (int? value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                      ),
                      title: Text("${widget.product.variations![index].values![token].label}", style: poppinsRegular,),
                      trailing: Text("\$${widget.product.variations![index].values![token].optionPrice}", style: poppinsRegular,),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
