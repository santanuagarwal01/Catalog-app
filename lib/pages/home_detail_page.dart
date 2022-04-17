import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';
import '../widgets/home_widgets/add_cart.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({required this.catalog, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        buttonHeight: 100,
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: Vx.mSymmetric(v: 8, h: 24),
        children: [
          "\$${catalog.price}".text.xl3.bold.green600.make(),
          AddToCart(catalog: catalog).wh(120, 50),
        ],
      ).backgroundColor(context.canvasColor),
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context).p8(),
            Expanded(
              child: VxArc(
                edge: VxEdge.TOP,
                height: 30,
                arcType: VxArcType.CONVEY,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.xl4.bold.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle!)
                          .make(),
                      SizedBox(height: 10),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed faucibus quam. Morbi est dui, eleifend vel arcu a, pretium pellentesque diam. Vestibulum id vehicula ipsum, vitae commodo libero. Sed faucibus enim non libero mattis sollicitudin. Cras pretium ipsum quis ligula eleifend commodo. Vestibulum nec risus pulvinar, convallis sem ut.md cklocd mm ejncjnejwnudfnex k nnnendmxe hnewudmewcnjeniud3ence jifneu4ndf3ndenc3j2ndncn32di."
                          .text
                          .center
                          .textStyle(context.captionStyle!)
                          .make()
                          .p16()
                          .scrollVertical()
                          .expand()
                    ],
                  ).py(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
