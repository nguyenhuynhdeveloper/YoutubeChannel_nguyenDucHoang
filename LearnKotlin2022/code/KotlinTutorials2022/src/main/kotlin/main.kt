package com.kotlin.tutorials
import com.kotlin.tutorials.enums.Quality
import com.kotlin.tutorials.enums.RequestError
import com.kotlin.tutorials.models.*
import com.kotlin.tutorials.storage.MongoDBRepository
import com.kotlin.tutorials.storage.MyDBRepository
import com.kotlin.tutorials.utilities.Calculation
import java.net.URI
import java.net.http.HttpClient
import java.net.http.HttpRequest
import java.net.http.HttpResponse
import java.net.http.HttpResponse.BodyHandlers
import kotlinx.coroutines.*
import java.util.Objects
import kotlin.system.*



//define a function
fun sayHello(name: String):Unit {
    //Unit => no return(void)
    println("Hello "+name)
}
//function with Named Arguments
fun showColor(red:Int, green:Int, blue:Int, alpha:Float) {
    println("Color: ${red} - ${green} - ${blue} - ${alpha}")
}
//function which return value
fun sum(x:Double, y:Double):Double {
    return x + y
}
//infix functions : can be called without using the period and brackets.
infix fun Int.plus(x: Int): Int {
    return this + x
}
//another example
//one-line function
infix fun Float.times(x: Float): Float = this * x
infix fun String.loves(name: String) = "${this} loves ${name}"
//function with Variadic Arguments = vararg
fun like(vararg fruits: String) {
    for (fruit in fruits) {
        println("I like "+fruit)
    }
}
fun main() {
    //println("hello world")
    //variable
    //var x: Int = 3
    val y = 5 //val => cannot be changed
    //y = 123 //cannot be reassigned
    println("value of y is: $y") //string template
    //println(x)
    showColor(red = 100, green = 200, blue = 255, alpha = 0.5f)
    sayHello(name = "Hoang")
    /*
    some comments here
    You can type anything, description,...
     */
    println("sum 2 and 3 is: ${sum(2.0, 3.0)}")
    println("sum 2 and 3 is: ${sum(x = 2.0, y = 3.0)}")
    like("orange", "kiwi", "apple", "banana")
    //call infix function
    val z = 12 plus 4
    println("z = $z")
    println("10 plus 2 is: ${10 plus 2}")
    println("3 multiply 2 is : ${3.0f times 2.0f}")
    var aString = "John" loves "Anna"
    println(aString)
    var name:String = "Hoang" //this cannot be null
    //name = null //error
    var email:String? //this can be null
    email = "hoang@gmail.com"
    email = null //ok
    println(email)
    //?: => default value , or Elvis
    println("email's length is ${email?.length ?: 0}")
    //!! = I confirm that "name" is NOT NULL
    println("name's length = ${name.length}")
    //Higher order function is:
    //- function that takes another function as parameter
    //- function returns a function
    fun doSomething(x: Int, y: Int, completion: (Int)->Unit) {
        println("Do something")
        completion(111)
    }
    //call this function
    /*
    doSomething(x = 1, y = 2, completion = {result:Int ->
        run {
            println("result = $result")
        }
    })
     */
    doSomething(1, 2) { result: Int ->
        run {
            println("result = $result")
        }
    }
    //function that return function
    //function that return function
    fun operation(x: Double): (y:Float) -> Float {
        return fun(y:Float):Float {
            return y * y
        }
    }
    println(operation(x = 10.0)(10.0f))
    //labda function
    val getFullName:(String, String) -> String = { firstName: String, lastName: String -> run {
        println("this is a lambda function")
        "$firstName $lastName"
    }}
    println(getFullName("Nguyen", "duc hoang"))
    val url:(Int, Int) -> String = {page: Int, limit: Int  -> "https:yourServerName:port/items?page=$page&limit=$limit" }
    println(url(0, 10))
    val squaredNumber:(Int) -> Int = {x -> x * x}
    println(squaredNumber(20))
    url(1, 20).let {               // 1
        println("It means that url NOT NULL")                // 2
        println(it)
        println("do something more...")
    }
    val user1 = User(1, "Hoang", "sunlight4d@gmail.com")
    val user2 = User(1, "Hoang", "sunlight4d@gmail.com")
    println(user1 == user2)
    //content are the same => hashcodes are the same
    println(user1.hashCode() == user2.hashCode())
    //clone an entire object
    val user3:User = user1.copy()
    println(user3 == user1)
    //but they have not the same addresses
    println(user3 === user1)
    //clone and change some fields
    val user4:User = user1.copy(id = 11, name="Hoang2")
    println(user4)
    val quality:Quality = Quality.NORMAL
    //switch-case
    val qualityMessage:String = when(quality) {
        //this is like "map function"
        Quality.BAD -> "This is bad"
        Quality.NORMAL -> "Quality is normal"
        Quality.GOOD -> "Yes, it's good"
        Quality.EXCELLENT -> "Wow, excellent"
    }
    println("qualityMessage= $qualityMessage")
    val requestError:RequestError = RequestError.INTERNAL_ERROR
    println(requestError)
    println(requestError.message)
    println(requestError.wordCount())
    //define a key-value object
    val person1 = object {
        var name = "Hoang"
        var email = "sunlight4d@gmail.com"
        var age = 18
        override fun toString(): String = "name: $name, email: ${this.email}, age: $age"
    }
    println(person1)
    var person2 = mutableMapOf<String, Any>(
        "name" to "John",
        "email" to "john@gmail.com",
        "age" to 22
    )
    person2["name"] = "Henry"
    println("name = ${person2["name"]}")
    println("address = ${person2["address"] ?: "no address"}")
    //companion object, like "static"
    println(Calculation.multiply(2, 3))
    //inheritance
    //sealed type is abstract, so it cannot be initiated
    //val vehicle1 = Vehicle("aa", "bb", 123.0)
    val bicycle1:Bicycle = Bicycle("vihaha", 2022,  hasBasket = true)
    val car1:Car = Car("GLB 200 7G-DCT",2020,81.3f, horsePower = 163)
    println(bicycle1)
    println(bicycle1.name)
    println(bicycle1.hasBasket)
    //you can print multiple fields
    with(bicycle1) {
        println("name = $name, hasBasket = $hasBasket")
    }
    //update multiple properties
    bicycle1.apply {
        year = 2022
        hasBasket = false
    }
    println(bicycle1)
    fun describeVehicle(vehicle: Vehicle):String {
        return when(vehicle) {
            is Bicycle -> "This is a bicycle"
            is Car -> "This is a car"
            else -> "I donot know"
        }
    }
    println(describeVehicle(bicycle1))
    //Extension Functions
    //add more function to Car class
    fun Car.run(speed: Double) {
        println("$name running at speed: $speed")
    }
    car1.run(1122.0)
    val someNumbers = mutableListOf<Int>(1, 3, 5, -2, -8, 7)
    someNumbers[2] = 33
    for (item in someNumbers) {
        println(item)
    }
    if(someNumbers.any {it < 0}) {
        println("At least 1 item is negative")
    }
    if (someNumbers.all { it < 100 }) {
        println("all items are < 100")
    }
    if (someNumbers.none { it == 100 }) {
        println("No item has value = 1000")
    }
    val someFloats = listOf<Float>(3.5f, 2.2f, 4.6f, 1.8f)
    //someFloats[3] = 22 //cannot change
    //list of objects
    var cars = mutableListOf<Car>(
        Car("GLB 200 7G-DCT", 2020,81.3f, 163),
        Car("GLB 200 d 8G-DCT", 2020,119f, 150),
        Car("Lexus CT200H F SPORT", 2014,109.7f, 136),
        Car("Lexus CT200H Hybrid", 2018,119f, 150),
        Car("Jetta Advance 1.6 TDI 105HP BlueMotion Technology DSG 7", 2011,97.5f, 105),
        Car("Jetta Sport 1.4 TSI 160HP DSG 7 speed", 2011,84.8f, 160),
        Car("Bentley Flying Spur W12", 2013,243.7f, 528),
        Car("Bentley Brooklands 2008", 2007,412.6f, 537),
        Car("Continental GTC 6.0 W12", 2019,363.1f, 635),
        Car("Qashqai DIG-T 158 4WD Auto", 2021,81.3f, 158),
        Car("Nissan Laurel JC32 2.8 D", 2020,172.5f, 90),
    )
    //cars[1].name = "abc"
    println(cars)
    println("add to the first item")
    cars.add(0, Car("Nissan Murano Z50 3.5 (234HP)", 2004,213.5f, 234),)
    println(cars)
    println("add to the last item")
    cars.add(Car("Bentley 8 Litre", 1930,487.2f, 230),)
    println(cars)
    var filteredCars = cars.filter { it.year in 2013..2016 }
    for(car in filteredCars) {
        println(car)
    }
    filteredCars = cars.filter { it.name.contains("lexus", true) }
    filteredCars.forEach {
        println(it)
    }
    //sort a list
    println("Sort by horse power")
    var sortedCars = cars.sortedBy { it.horsePower }
    sortedCars = cars.sortedByDescending { it.horsePower }
    sortedCars.forEach {
        println(it)
    }
    //get only car's names
    var carNames = cars.map { it.name }
    carNames.forEach { println(it) }
    println("There are ${carNames.count()} cars")
    println("First name: ${carNames.first()}, last name: ${carNames.last()}")
    //split/partition a list
    val (newerCars, olderCars) = cars.partition { it.year > 2019 }
    println(newerCars)
    println(olderCars)
    println(cars.minOf { it.horsePower })
    println(cars.maxOf { it.horsePower })
    val connectionString = "Server=myServerAddress;Database=myDataBase;Uid=myUsername;Pwd=myPassword;"
    val repository:MyDBRepository = MyDBRepository(connectionString)
    repository.makeConnection(connectionString)
    //Delegated Properties = make a separated class that override getter/setter
    val user5 = User(11, "Ted", "ted@gmail.com")
    user5.age = 30
    println(user5.age)
    //Standard Delegates: lazy, observable
    println(user5.description)
    //from key-value object => custom Object
    val productA = Product(mapOf(
        "name" to "iphone 14",
        "price" to 2000
    ))
    println(productA)
    //test observable property
    productA.description = "haha"
    productA.description = "hehe"
    //property's type is Int
    //observable with validation = Vetoable
    productA.count = 2
    productA.count = 3
    productA.count = -1
    println(productA.count)
    //https://zetcode.com/kotlin/getpostrequest/
    val urlGetRandomUser = "https://randomuser.me/api"
    val urlGetDetailCountry = "https://api.zippopotam.us/us/33162"
    /*
    suspend fun callApi(urlString:String):HttpResponse<String> {
        val client = HttpClient.newBuilder().build();
        val request = HttpRequest.newBuilder()
            .uri(URI.create(urlString))
            .build();
        return client.sendAsync(request, BodyHandlers.ofString())
    }
    */

}
