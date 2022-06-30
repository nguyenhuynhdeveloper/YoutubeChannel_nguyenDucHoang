import 'package:dart_tutorial/functions.dart';
import 'package:dart_tutorial/models/bicycle.dart';
import 'package:dart_tutorial/models/car.dart';
import 'package:dart_tutorial/models/vehicle.dart';
import 'package:dart_tutorial/repositories/category_repository.dart';
import 'package:dart_tutorial/repositories/movie_repository.dart';

void main(List<String> arguments) {
  var firstName = "Nguyen";
  String lastName = "Duc Hoang";
  String fullname = '$firstName $lastName';
  print(fullname);
  var poem = '''
    In a dark night,
    With anxious love inflamed,
    Forth unobserved I went,    
  ''';
  print(poem);
  //raw string
  print(r'This is a raw string with special characters');
  //check empty string
  if (poem.isEmpty) {
    //boolean type
    print('This string is empty');
  } else {
    print('String\' length : ${poem.length}');
  }
  bool isValidInput = firstName.isNotEmpty && lastName.isNotEmpty;
  print('isValid: $isValidInput');
  print(' 2 add 3 is: ${add(2, 3)}');
  //named parameters
  print('5 times 6 is ${multiply(x: 5.0, y: 6.0)}');
  //parameters's order is not important
  print('7 times 3 is ${multiply(y: 7.0, x: 3.0)}');
  //use default parameter
  print('omit y, so result is ${multiply(x: 3.0)}');
  String urlHome = getUrl('SERVER_X', port: 3002);
  print(urlHome);
  sayHello('Hoang');
  //optional parameter with default value
  sayHello();
  print(getDateTimeString(day: 31, month: 12, year: 2022));
  print(getDateTimeString(day: 31, month: 12));
  doSomeTasks(
      param1: 1,
      param2: 2,
      completion: (String result) {
        print('result is: $result');
      });
  //list of String
  final List<String> carBrands = [
    "Bentley",
    "Buick",
    "BMW",
    "Audi",
    "Fiat",
    "Mercedes-Benz"
  ];
  //iterate through carBrands,traditionally
  print('iterate through carBrands,traditionally');
  for (var i = 0; i < carBrands.length; i++) {
    print(carBrands[i]);
  }
  print('iterate using forEach');
  carBrands.forEach((carBrand) {
    print(carBrand);
  });
  carBrands.shuffle();
  print('After shuffled');
  carBrands.asMap().forEach((index, carBrand) {
    print('index: $index, carBrand: $carBrand');
  });
  carBrands.add("Mazda");
  print(carBrands);
  carBrands.insert(0, "Cadillac");
  print(carBrands);
  List<String> clonedCarBrands = [...carBrands];
  //change something
  clonedCarBrands[0] = "Honda";
  print(clonedCarBrands);
  clonedCarBrands.sort(((a, b) => a.compareTo(b))); //ascending
  //what about descending ?
  print(clonedCarBrands);
  Car car1 = Car("Lexus CT200H Hybrid", 2018, 119, 150);
  car1.name = "Lexus CT200H F SPORT";
  car1.year = 2014;
  //getter, setter
  print(car1.age); //getter
  car1.age = 2; //how to make this "read-only"
  print(car1.year);
  //method
  car1.describe();
  Bicycle bicycle1 =
      Bicycle(name: 'NEW TALON E+ 26', year: 2022, hasBasket: true);
  print(bicycle1);

  Bicycle bicycle2 =
      Bicycle(name: 'NEW TALON E+ 26', year: 2022, hasBasket: true);
  if (bicycle1 == bicycle2) {
    print("equal");
  }
  //How to compare contents of 2 objects ?
  //-Write your own method
  //-override == operator
  //-use Equaltable mixin/extends class
  //dart pub add equatable
  if (bicycle1.equals(bicycle2)) {
    print("2 objects has the same contents");
  }
  print(bicycle1.hashCode);
  print(bicycle2.hashCode);
  if (bicycle1 == bicycle2) {
    print("2 objects has the same contents");
  }
  //clone an object, create a method named "copyWith"
  Bicycle bicycle3 = bicycle2.copyWith(year: 2020);
  Bicycle bicycle4 = bicycle2.copyWith(year: 2020, name: "new bicycle");
  print(bicycle3.toString()); //debug to show more
  print(Bicycle.maxSpeed);
  //Vehicle vehicle1 = Vehicle(); //cannot initialize
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
  print(cars);
  print("Add 1 car to the first item");
  cars.insert(0, Car("Nissan Murano Z50 3.5 (234HP)", 2004, 213.5, 234));
  print(cars);
  print("Add to the last item");
  cars.add(Car("Bentley 8 Litre", 1930, 487.2, 230));
  print(cars);
  //filter cars which year is between 2013 and 2016
  List<Car> filteredCars =
      cars.where((car) => car.year >= 2013 && car.year <= 2016).toList();
  print("Filtered cars: ");
  print(filteredCars);
  cars[0].name = "kaka";
  print(cars);

  print("sort the list, by horsePower");
  //make a separated list, then sort
  List<Car> sortedCars = [...cars];
  sortedCars.sort((car1, car2) => car1.year - car2.year); //sort ascending
  print('cars = $cars');
  print('sortedCars = $sortedCars');
  //get car's name and add to a separated list
  List<String> carNames = cars.map((car) => car.name).toList();
  print(carNames);
  //key-value object
  final Map<String, Object> user = {
    'name': 'Hoang',
    'email': 'sunlight4d@gmail.com',
    'age': 18,
  };
  user['name'] = 'Henry'; //final is ok, but "const" is immutable
  print(user);
  //dart pub add http
  print('Begin task1');
  fetchMovies().then((movies) {
    print('finished task1');
    print('movies = $movies');
  });
  print('Begin task2');
  fetchCategories().then((categories) {
    print('finished task2');
    print('categories = $categories');
  });
}
