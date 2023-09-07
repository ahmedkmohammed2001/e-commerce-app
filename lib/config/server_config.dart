import 'package:new_test_99/modules/register/register.dart';

class ServerConfig {
  static const domainNameServer = 'http://192.168.225.138:8000';
  static const register = '/api/register';
  static const login = '/api/login';
  static const getCategories = '/api/category-list';
  static const getProduct = '/api/product-list?category_id=';
  static const getProductbyid = '/api/product-list?product_id=';
  static const logout = '/api/logout';
  static const search = '/api/product-list?name=';
  static const makelike = '/api/like-item';
}
