
import 'package:my_pharmacy/features/home/data/models/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProductsByCategory(String categoryName);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsByPharmacy(String pharmacyName);

  Future<List<Product>> getProductsOnOffer(String pharmacyName);


}
