import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/theme.dart';

class OrderReceivedPage extends StatelessWidget {
  const OrderReceivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Order  Received',
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
          ListTile(
            title: Text('Thankyou, for your payment!',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade900)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
          ListTile(
            title: Text('XYZ Repairs are working on your car',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade900)),
          ),
          Image.asset(ImageAssets.repaircar),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
          ListTile(
            leading: Image.asset(ImageAssets.profile2),
            title: Text('XYZ REPAIRS'),
            subtitle: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Colors.grey.shade500.withOpacity(0.9),
                ),
                Text(' New York, USA',
                    style: textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                    width: 30, child: Image.asset(IconAssets.phoneoutline)),
                const SizedBox(width: 5),
                SizedBox(width: 30, child: Image.asset(IconAssets.msgoutline)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
