import 'package:dart_tutorial/dart_tutorial.dart' as dart_tutorial;
import 'package:dart_tutorial/functions.dart';
import 'package:dart_tutorial/models/bicycle.dart';
import 'package:dart_tutorial/models/car.dart';
import 'dart:core';

import 'package:dart_tutorial/models/vehicle.dart';

void main(List<String> arguments) {
  var firstName = 'Nguyen'; //this is a variable
  String lastName = 'Duc Hoang';
  print('firstname: $firstName, lastname : $lastName');
  String fullname = '$firstName $lastName';
  print(fullname);
  //multi-line string
  String poem = '''
    In a dark night,
    With anxious love inflamed,
    Forth unobserved I went, 
  ''';
  print(poem);
  print(r'This is a raw string \u128512');
  print('This is copyright: \u00a9');
  //check if a string is empty
  if (poem.isEmpty) {
    print('This string is empty');
  } else {
    print('This string is NOT empty');
  }
  bool isValidInput = firstName.isNotEmpty && lastName.isNotEmpty;
  print(isValidInput);
  print('2 add 3 is: ${add(2, 3)}');
  //named parameters
  print('5 times 6 is: ${multiply(y: 6, x: 5)}'); //order is not important
  print(multiply(x: 23));
  sayHello('Hoang');
  sayHello();
  String urlHome = getUrl('SERVER_X', port: 3002);
  print('today is ${getDateTimeString(day: 1, month: 7, year: 2022)}');
  doSomeTasks(
      param1: 1,
      param2: 2,
      completion: (int result) {
        print('The result is: $result');
      });
  //list of string
  final List<String> carBrands = [
    "Bentley",
    "Buick",
    "BMW",
    "Audi",
    "Fiat",
    "Mercedes-Benz"
  ];
  //carBrands = ["Toyota", "Honda"]; // cannot be re-assigned if "final"
  //carBrands[0] = "Honda"; //ok, if carBrands is "final"
  //carBrands[0] = "Honda"; //Failed, if carBrands is "const"
  print(carBrands);
  print('There are ${carBrands.length} brand names');
  //iterate through carBrands
  for (var i = 0; i < carBrands.length; i++) {
    String carBrand = carBrands[i];
    print(carBrand);
  }
  print('Iterate using forEach');
  // ignore: avoid_function_literals_in_foreach_calls
  carBrands.forEach((carBrand) {
    print(carBrand);
  });
  carBrands.shuffle();
  print('After shuffled');
  carBrands.asMap().forEach((index, carBrand) {
    print('index: $index, carBrand: $carBrand');
  });
  //insert more item
  carBrands.add('Mazda');
  print(carBrands);
  print('Add item to the first');
  carBrands.insert(0, 'Cadillac');
  print(carBrands);
  List<String> clonedCarBrands = [...carBrands];
  clonedCarBrands[0] = 'Honda';
  print('carBrands = $carBrands');
  print('clonedCarBrands = $clonedCarBrands');
  print('after sort ascending');
  clonedCarBrands.sort((a, b) => a.compareTo(b));
  print('clonedCarBrands = $clonedCarBrands');
  print('after sort descending');
  clonedCarBrands.sort((a, b) => b.compareTo(a));
  print('clonedCarBrands = $clonedCarBrands');
  //create an objet from class
  //Abstract class cannot be initialized
  /*
  Vehicle vehicle = Vehicle('vehicle xx', 2022);
  print(vehicle);
  */
  print('Init a Car object from class');
  Car car1 = Car("Lexus CT200H Hybrid", 2018, 119, 150);
  //update some fields
  car1.name = "Lexus CT200H F SPORT";
  car1.year = 2014;
  print(car1);
  car1.describe();
  print(car1.age);
  car1.age = 12; //you cannot change the property unless you add setter method
  print(car1.year);
  //add more class
  //create object from Bicycle class
  Bicycle bicycle1 =
      Bicycle(name: 'NEW TALON E+ 26', year: 2022, hasBasket: true);
  print(bicycle1);
  Bicycle bicycle2 =
      Bicycle(name: 'NEW TALON E+ 26', year: 2022, hasBasket: true);
  //bicycle1 and bicycle2 has the same contents
  print('haha');
  //How to compare contents of 2 objects ?
  //-Write your own method
  /*
  if (bicycle1.equals(bicycle2)) {
    print('2 objects has the same contents');
  }
  */
  //override the == operator
  if (bicycle1 == bicycle2) {
    print('2 objects has the same values/contents');
  }
  Bicycle bicycle3 = bicycle1;
  if (identical(bicycle1, bicycle3)) {
    print('bicycle1 and bicycle3 are identical');
  }
  print(bicycle1.hashCode);
  print(bicycle2.hashCode);
  print(bicycle3.hashCode);
  if (bicycle1.hashCode == bicycle3.hashCode) {
    print('2 identical objects have the same hashCode');
  }
  //clone an object with copyWith Method
  print(bicycle2);
  Bicycle bicycle4 = bicycle2.copyWith(year: 2019);
  Bicycle bicycle5 = bicycle2.copyWith(year: 2019, name: 'new bicycle');
  print(bicycle5);
  //you can add a property value to all objects(class level) = static
  print(Bicycle.maxSpeed);
  //an array of objects
  List<Car> cars = [
    Car("GLB 200 7G-DCT", 2021, 1.3, 163),
    Car("GLB 200 d 8G-DCT", 2020, 119, 150),
    Car("Lexus CT200H F SPORT", 2014, 109.7, 136),
    Car("Jetta Advance 1.6 TDI 105HP BlueMotion Technology DSG 7", 2011, 97.5,
        105),
    Car("Jetta Sport 1.4 TSI 160HP DSG 7 speed", 2011, 84.8, 160),
    Car("Bentley Flying Spur W12", 2013, 243.7, 528),
    Car("Bentley Brooklands 2008", 2007, 412.6, 537),
    Car("Continental GTC 6.0 W12", 2019, 363.1, 635),
    Car("Qashqai DIG-T 158 4WD Auto", 2021, 81.3, 158),
    Car("Nissan Laurel JC32 2.8 D", 2020, 172.5, 90),
  ];
  cars.insert(0, Car("Nissan Murano Z50 3.5 (234HP)", 2004, 213.5, 234));
  //insert to the last
  cars.add(Car("Bentley 8 Litre", 1930, 487.2, 230));
  //print('cars: $cars');
  cars.asMap().forEach((index, element) {
    print('$index - $element');
  });
  //filter cars which year is between 2013 and 2016
  List<Car> filteredCars =
      cars.where((car) => car.year >= 2013 && car.year <= 2016).toList();
  print('Filtered cars:');
  //change an object
  //filteredCars[0].name = 'haha';
  filteredCars.asMap().forEach((index, car) {
    print('$index - $car');
  });
  print("sort the list, by horsePower");
  //make a separated list, then sort
  List<Car> sortedCars = [...cars];
  sortedCars.sort(((car1, car2) => car2.horsePower.compareTo(car1.horsePower)));
  print('after cloned and sorted');
  sortedCars.forEach((car) {
    print(car);
  });
  //get car's name and add to a separated list
  
}
