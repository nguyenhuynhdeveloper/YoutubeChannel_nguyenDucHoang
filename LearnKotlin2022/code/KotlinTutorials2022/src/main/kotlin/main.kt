package com.kotlin.tutorials
import com.kotlin.tutorials.enums.Quality
import com.kotlin.tutorials.enums.RequestError
import com.kotlin.tutorials.models.User

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
    //singleton(companion) object

}
