
import 'package:lesson_44/homeworks/models/employee.dart';
import 'package:lesson_44/homeworks/models/product.dart';

class Company{
  String name;
  String location;
  List<Employee> employees;
  List<Product> products;

  Company({
    required this.name,
    required this.location,
    required this.employees,
    required this.products,
  });
}



