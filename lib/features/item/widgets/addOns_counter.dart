import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant/util/dimensions.dart';

class AddonsCounter extends StatefulWidget {
  const AddonsCounter({Key? key}) : super(key: key);

  @override
  State<AddonsCounter> createState() => _AddonsCounterState();
}

class _AddonsCounterState extends State<AddonsCounter> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
          color: Theme.of(context).dialogBackgroundColor.withOpacity(0.2),),
        width: 80,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (counter > 0) {
                    counter--;
                  }
                });
              },
              child: Icon(CupertinoIcons.trash, size: 15, color: Theme.of(context).dialogBackgroundColor),
            ),
            Text("$counter"),
            InkWell(
              onTap: () {
                setState(() {
                  counter++;
                });
              },
              child: Icon(CupertinoIcons.add, size: 18, color: Theme.of(context).dialogBackgroundColor),
            ),
          ],
        ));
  }
}

