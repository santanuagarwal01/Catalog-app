import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.xl2.make(),
      ),
      body: Column(
        children: [
          _CartList().p16().expand(),
          Divider(thickness: 2.0),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart!;

    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            builder: (context, _, __) {
              return "\$${_cart.totalPrice}".text.xl4.make();
            },
            mutations: {RemoveMutation},
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.center.make(),
                ),
              );
            },
            child: "Buy".text.make(),
            style: ElevatedButton.styleFrom(
              primary: context.theme.buttonColor,
            ),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart!;
    VxState.watch(context, on: [RemoveMutation]);

    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(_cart.items[index]!.image)
                    .box
                    .p3
                    .make()
                    .wh(40, 40),
                title: "${_cart.items[index]?.name}".text.make(),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    RemoveMutation(_cart.items[index]);
                  },
                  color: Colors.red,
                ),
              );
            },
          );
  }
}
