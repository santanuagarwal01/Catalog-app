import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog",
          textScaleFactor: 1.4,
        ),
      ),
      body: ListView.builder(
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ItemWidget(
              item: dummyList[index],
            ),
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
