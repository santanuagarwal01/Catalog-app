import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartModel {
  CatalogModel? _catalog;
  CatalogModel? get catalog => _catalog;
  set catalog(CatalogModel? newCatalog) => _catalog = newCatalog;

  final List<int> _itemIds = [];

  List<Item?> get items => _itemIds.map((id) => _catalog?.getByID(id)).toList();

  num? get totalPrice =>
      items.fold(0, (total, current) => total! + current!.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item? item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.add(item!.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item? item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart?._itemIds.remove(item!.id);
  }
}
