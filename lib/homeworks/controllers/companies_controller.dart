import 'package:lesson_44/homeworks/models/company.dart';
import 'package:lesson_44/homeworks/models/employee.dart';
import 'package:lesson_44/homeworks/models/product.dart';

class CompaniesController {
  List<Company> companies = [
    Company(
      name: "Behruz Dev",
      location: "Tashkent",
      employees: [
        Employee(
          name: "Behruz",
          age: 18,
          position: "Director",
          skills: [
            "Flutter",
            "Python",
            "C",
          ],
        ),
      ],
      products: [
        Product(
          name: "B fresh",
          price: 39,
          inStock: true,
        ),
      ],
    ),
  ];
}
