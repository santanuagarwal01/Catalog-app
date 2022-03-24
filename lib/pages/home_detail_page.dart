import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({required this.catalog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${catalog.price}".text.xl3.bold.green700.make(),
          ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: MyTheme.darkBluishColor,
              shape: StadiumBorder(),
            ),
            onPressed: null,
            child: "Buy".text.xl.bold.white.make(),
          ).wh(100, 50),
        ],
      ).p32().backgroundColor(Colors.white),
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).p16(),
            Expanded(
              child: VxArc(
                edge: VxEdge.TOP,
                height: 30,
                arcType: VxArcType.CONVEY,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text
                          .color(MyTheme.darkBluishColor)
                          .xl4
                          .bold
                          .make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle!)
                          .make(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
