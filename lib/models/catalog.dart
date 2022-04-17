class CatalogModel {
  static List<Item> items = [];

  //Get item by id
  Item getByID(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get item by position
  Item getByPos(int pos) => items[pos];
}

class Item {
  final String name;
  final int id;
  final num price;
  final String desc;
  final String image;
  final String color;

  Item({
    required this.name,
    required this.color,
    required this.desc,
    required this.id,
    required this.image,
    required this.price,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map["name"],
      color: map["color"],
      desc: map["desc"],
      id: map["id"],
      image: map["image"],
      price: map["price"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "color": color,
        "desc": desc,
        "image": image,
        "price": price,
      };
}
