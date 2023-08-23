import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Customer {
  final int id;
  final String fullName;
  final String birthday;
  final String address;
  final String phoneNumber;

  Customer({required this.id, required this.fullName, required this.birthday, required this.address, required this.phoneNumber});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      fullName: json['fullName'],
      birthday: json['birthday'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
    );
  }
}

void main() {
  runApp();
}

void runApp() async {
  while (true) {
    print("1. Add Customer");
    print("2. Get All Customers");
    print("3. Exit");

    String choice = stdin.readLineSync() ?? "";

    switch (choice) {
      case "1":
        await addCustomer();
        break;
      case "2":
        await getAllCustomers();
        break;
      case "3":
        return;
      default:
        print("Invalid choice.");
    }
  }
}

Future<void> addCustomer() async {
  print("Enter customer details:");
  print("Full Name:");
  String fullName = stdin.readLineSync() ?? "";
  print("Birthday (YYYY-MM-DD):");
  String birthday = stdin.readLineSync() ?? "";
  print("Address:");
  String address = stdin.readLineSync() ?? "";
  print("Phone Number:");
  String phoneNumber = stdin.readLineSync() ?? "";

  var response = await http.post(
    Uri.parse('http://localhost:8080/customers/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullName': fullName,
      'birthday': birthday,
      'address': address,
      'phoneNumber': phoneNumber,
    }),
  );

  if (response.statusCode == 201) {
    print("Customer added successfully.");
  } else {
    print("Failed to add customer.");
  }
}

Future<void> getAllCustomers() async {
  var response = await http.get(Uri.parse('http://localhost:8080/customers'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Customer> customers = data.map((json) => Customer.fromJson(json)).toList();

    for (var customer in customers) {
      print("Customer ID: ${customer.id}");
      print("Full Name: ${customer.fullName}");
      print("Birthday: ${customer.birthday}");
      print("Address: ${customer.address}");
      print("Phone Number: ${customer.phoneNumber}");
      print("-------------------------------");
    }
  } else {
    print("Failed to retrieve customers.");
  }
}
