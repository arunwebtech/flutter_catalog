import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  //catalog field
  late CatalogModel _catalogModel;

  //Collection Id or Store Id of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalogModel;

  set catalogModel(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalogModel = newCatalog;
  }

  //get item in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalogModel.getById(id)).toList();

  // get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
