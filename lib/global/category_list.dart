import 'package:shop2_app/global/final_offers.dart';

final couponCodes = ["FIRST200", "FSCREATION", "INDIA75", "DEAL25"];

final categoryList = [
  'New Arrivals',
  'Clothes',
  'Electronics',
  'Bags',
  'Shoes',
];

final categoryListImagesUrl = [
  'assets/images/newArrival.png',
  'assets/images/clothesFilter.png',
  'assets/images/electronicsFilter.png',
  'assets/images/bagFilter.png',
  'assets/images/shoesFilter.png',
];

final subCategoryList = {
  'New Arrivals': ['All','Shoes', 'Clothes', 'Electronics', 'Bags'],
  'Shoes': ['All', 'Nike', 'Addidas', 'Sparx', 'Formal'],
  'Clothes': ['All','Shirt', 'T-shirt', 'Formal', 'Trousers'],
  'Electronics': ['All','Mobile', 'Headphone', 'Earbuds'],
  'Bags': ['All','Suitcas', 'Backpack', 'Trekking'],
};

List<Map<String, dynamic>> filterProducts(String cat) {
  // return products.where((product) => product['category'] == cat).toList();
  return products.where((product) => product['category'] == cat).toList();
  // print('final filter product length:${finalFilterdProducts.length}');
  // products[j]['category'] == categoryList[i]
}

List<Map<String, dynamic>> newProductsFilter() {
  print('New arrival called output: ');
  print(products.where((product) => product['newArrival'] == true).toList());
  return products.where((product) => product['newArrival'] == true).toList();
}

List<Map<String, dynamic>> subCategoryFilter(String cat) {
  // return products.where((product) => product['category'] == cat).toList();
  return products.where((product) => product['brand'] == cat).toList();
  // print('final filter product length:${finalFilterdProducts.length}');
  // products[j]['category'] == categoryList[i]
}

List<Map<String, dynamic>> newSubCategoryFilter(String cat) {
  print('Called newSubcategory filte output for cat: $cat ');
  print(products.where((product) => product['category'] == cat && product['newArrival'] == true).toList());
  return products.where((product) => product['category'] == cat && product['newArrival'] == true).toList();

}
