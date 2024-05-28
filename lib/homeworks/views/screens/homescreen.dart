import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_44/homeworks/controllers/companies_controller.dart';
import 'package:lesson_44/homeworks/models/company.dart';
import 'package:lesson_44/homeworks/models/employee.dart';
import 'package:lesson_44/homeworks/models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final companyController = CompaniesController();

  void _showAddCompanyDialog() {
    String name = '';
    String location = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Company'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Company Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Location'),
                onChanged: (value) {
                  location = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies.add(Company(
                    name: name,
                    location: location,
                    employees: [],
                    products: [],
                  ));
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditCompanyDialog(int index) {
    String name = companyController.companies[index].name;
    String location = companyController.companies[index].location;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Company'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Company Name'),
                controller: TextEditingController(text: name),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Location'),
                controller: TextEditingController(text: location),
                onChanged: (value) {
                  location = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies[index].name = name;
                  companyController.companies[index].location = location;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddEmployeeDialog(int companyIndex) {
    String name = '';
    int age = 0;
    String position = '';
    List<String> skills = [];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Employee'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  age = int.parse(value);
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Position'),
                onChanged: (value) {
                  position = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Skills (comma separated)'),
                onChanged: (value) {
                  skills = value.split(',').map((e) => e.trim()).toList();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies[companyIndex].employees.add(
                    Employee(
                      name: name,
                      age: age,
                      position: position,
                      skills: skills,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditEmployeeDialog(int companyIndex, int employeeIndex) {
    Employee employee =
        companyController.companies[companyIndex].employees[employeeIndex];
    String name = employee.name;
    int age = employee.age;
    String position = employee.position;
    List<String> skills = employee.skills;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Employee'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: TextEditingController(text: name),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: age.toString()),
                onChanged: (value) {
                  age = int.parse(value);
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Position'),
                controller: TextEditingController(text: position),
                onChanged: (value) {
                  position = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Skills (comma separated)'),
                controller: TextEditingController(text: skills.join(', ')),
                onChanged: (value) {
                  skills = value.split(',').map((e) => e.trim()).toList();
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies[companyIndex]
                      .employees[employeeIndex] = Employee(
                    name: name,
                    age: age,
                    position: position,
                    skills: skills,
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies[companyIndex].employees
                      .removeAt(employeeIndex);
                });
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _showAddProductDialog(int companyIndex) {
    String name = '';
    double price = 0.0;
    bool inStock = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  price = double.parse(value);
                },
              ),
              Row(
                children: [
                  const Text('In Stock'),
                  Checkbox(
                    value: inStock,
                    onChanged: (bool? value) {
                      setState(() {
                        inStock = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies[companyIndex].products.add(
                    Product(
                      name: name,
                      price: price,
                      inStock: inStock,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditProductDialog(int companyIndex, int productIndex) {
    Product product =
        companyController.companies[companyIndex].products[productIndex];
    String name = product.name;
    double price = product.price;
    bool inStock = product.inStock;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: TextEditingController(text: name),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: price.toString()),
                onChanged: (value) {
                  price = double.parse(value);
                },
              ),
              Row(
                children: [
                  const Text('In Stock'),
                  Checkbox(
                    value: inStock,
                    onChanged: (bool? value) {
                      setState(() {
                        inStock = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController
                      .companies[companyIndex].products[productIndex] = Product(
                    name: name,
                    price: price,
                    inStock: inStock,
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  companyController.companies[companyIndex].products
                      .removeAt(productIndex);
                });
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade200,
        title: const Text(
          "Companies for hiring!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.notifications,
                color: Colors.teal,
                size: 29,
              ),
              Gap(5),
              Icon(
                Icons.settings,
                color: Colors.teal,
                size: 30,
              ),
              Gap(10),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: companyController.companies.map((company) {
            int companyIndex = companyController.companies.indexOf(company);
            return Card(
              color: Colors.teal.shade200,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${company.name ?? ''}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Location: ${company.location ?? ''}"),
                    const SizedBox(height: 8),
                    Text("Employees:"),
                    ...company.employees.asMap().entries.map((entry) {
                      int employeeIndex = entry.key;
                      Employee employee = entry.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "\nName: ${employee.name}, \n   Age: ${employee.age}, \n   Position: ${employee.position}, \n   Skills: ${employee.skills.join(', ')}",
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditEmployeeDialog(
                                  companyIndex, employeeIndex);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                companyController
                                    .companies[companyIndex].employees
                                    .removeAt(employeeIndex);
                              });
                            },
                          ),
                        ],
                      );
                    }).toList(),
                    const SizedBox(height: 8),
                    Text("Products:"),
                    ...company.products.asMap().entries.map((entry) {
                      int productIndex = entry.key;
                      Product product = entry.value;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "\nName: ${product.name}, \n   Price: ${product.price}, \n   In Stock: ${product.inStock}",
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditProductDialog(
                                  companyIndex, productIndex);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                companyController
                                    .companies[companyIndex].products
                                    .removeAt(productIndex);
                              });
                            },
                          ),
                        ],
                      );
                    }).toList(),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            _showEditCompanyDialog(companyIndex);
                          },
                          child: const Text('Edit Info'),
                        ),
                        TextButton(
                          onPressed: () {
                            _showAddEmployeeDialog(companyIndex);
                          },
                          child: const Text('Add Employee'),
                        ),
                        TextButton(
                          onPressed: () {
                            _showAddProductDialog(companyIndex);
                          },
                          child: const Text('Add Product'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              companyController.companies
                                  .removeAt(companyIndex);
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCompanyDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
