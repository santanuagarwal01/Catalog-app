class CatalogModel {
  static final items = [
    Item(
      name: "Iphone 12 Pro",
      color: "#33505a",
      desc: "Apple Iphone 12th Gen",
      id: 1,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc",
      price: 999,
    ),
  ];
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
}
