# Javascript – **UK;EF**
### (Useful Knowledge; Easily Forgotten)


# Brief History
[**lmwptsfy** (let me wikipedia that s**t fo'you) ](https://en.wikipedia.org/wiki/JavaScript) :)

The actual name is ECMAScript2015. Originally it was called, Mocha, then liveScript. WFT where does the java come from?
it was tagged to the scrip to surf the waive of popularity that Java had a the time.
It started on Dec 1995 , from the NetScape browser. They decided to create a interpretative language
for people to add interactivity to their websites.

It is **bfw;ftw** (borne from the web and for the web)

###### Competition
In the early days it was NetScape vs Internet explorer who where developing their own implementations of ECMAScript2015.
They each added different functionalities and optimizations, trying to lure more users.
Eventually a standard was agreed upon.
### Reasons to love js
* Super flexible
* It has arguably the most active community.
* * That means that someone has already solve what ever issue you are having. Or have a answer close enoguh.
  * TONS of libraries. Sometimes way to many
* Cross platform compatibility; tons of devices will run it.
* Share-ability; your code becomes immediately available to millions!
* [**Atwood's Law:**](https://blog.codinghorror.com/the-principle-of-least-power/) *any application that can be written in JavaScript, will eventually be written in JavaScript.*
* * [take a peak](https://www.reddit.com/r/atwoodslaw/)

If you want to know more, check out [JavaScript the good parts](http://bdcampbell.net/javascript/book/javascript_the_good_parts.pdf)
>"JavaScript is a language with more than its share of bad parts."


# Vars
Variable, **OMG** they are lizzards, or octopi. They change to anything.
Js is also a VERY loosly typed language.

js uses dynamic typing: that means it can be any type and js will figure out how to treat it.



```JavaScript
//primitive types
var foo = 12;
var bar = "ref";
var wot = false;
var myNull = null;
var myUndefined = undefined;
//object type
var wup = {}
// Array object type
var oru = []
// function type
// Global variable
var zuf = function(){} // They are non static and can be easily overwritten to anything!
// Custom constucted
var ball = new Ball();

// you don't even need to declare the type.
rur = 12.4 + "px";

// Now lets say your applications is some sort of animations, as so often they are.
// you have frames. so naturally you crate a variable frames.
// SIDE NOTE: notice how it is array containing many different data types. You can do that.
// seem like nothing is wrong here right. Wrong! you just overwrote your global frames variable! it is lost! it is gone!
//
var frames = ["lor", 3, {}, function(){}];
// This is often considered one of the bad parts of js.
console.dir(window)
/*
All of these are global variable and anything has access to it and can overwrite them by mistake.
*/

```

There is two big categories.
* 1 primitive: they are immutable. They cannot be changed. can only be reassigned
* 2 objects:

```
someString = "ror";
someString[0] // outputs 'r'
someString[0] = 'p';
someString// outputs 'ror' => because it is immutable
```


Global namescpace pollution can be avoided with closures. More on that later.

# Objects
### you gotta love'em; no really you do!
##### Vocab and concepts
* Inheritance
* What about *this*
* Value and reference assignment

Objects are reference assignment.

```javascript
foo = 22;
bar = foo;
foo = foo*2;
console.log(foo,bar) //PAM! Assigment by values; the value is copies and they are separate

puf = {}
tof = puf;
puf.foo = 4;
console.log(puf, tof) they both have foo! Because it is by Reference!
```

We said earlier that everything in js is an object. lets prove that really quickly


``` JavaScript
// Oject literal syntax.
var person = {};
```
Think of an Obect as a table

| Properties | values|
|---|---|
|  foo | 4   |
| ^ also referred as keys | ^ values are well values |
``` JavaScript
// Creating a property using dot notation.
person.name = "Fer";
person.year = 1990;
person.getName = function(){return this.name;}
// index notation
person["languages"] = ["Spanish", "Englih"];

//you could also do them in line
var person = {
  name = "Fer"; //etc
}
```

Creating object
There are no classes, all the objects are the same.
* 1 Create an object
* 2 Contruct the object
* * object literal
* * with function

```JavaScript
// You could also create and construct them in line. Object literal
var person = {
  name: "Fer",
  name : "Fer",
  year : 1990,
  getName : function(){return this.name},
  languages : ["Spanish", "Englih"],
}
```

```JavaScript
// You could also create and construct them with a function
//This is a constructure function
var createPerson = function (_person) {
  _person.name= "Fer";
  _person.name = "Fer";
  _person.year = 1990;
  _person.getName = function(){return this.name};
  _person.languages = ["Spanish", "Englih"];
}
var person = {}; // empty object
createPerson(person); //the function does the job of assigning properties
// at this point the end result is the same

//this is the same as the two lines above
var personTwo = new createPerson();
```

> By convention constructor function are capitalized! Otherwise we have no way of differentiate them.

### Configuring object proprieties

Advanced!
```JavaScript
var person = {
  name : "fer",
}

Object.definePrioerty(person, "fullName", {
  value : "Default value",
  writable : true, //by default they are not writable
})
// by default the properties created this way are not enumerable,
// so if you want to iterate over them using the object keys, full name will not appear.
// try it
Object.keys(person)

Object.definePrioerty(person, "programmingLanguageOfChoie", {
  value : "JacaScript!", // this will be the default value. duh!
  writable : true,
  enumerable: true,
  configurable: true, //this will allow you modify it after it has been created.
})

```
So why bother with this extra complicated way of defining a function?
Because you can define getter and setters!

```JavaScript
Object.definePrioerty(person, "nickname", {
  // value : "Default value", // this make no sense because it will redundant with get and set
  // writable : true,
  enumerable: true,
  configurable: true, //this will allow you modify it after it has been created.
  get: function(){
    console.log("getting the name");
    return this._nickName;
  },
  set: function(_val){
    console.log("setting the name");
    this._nickName = _val;
  },
})
```
### Inheritance

* property lookup always starts with own object.
* if it can't fin it will go up in the look up chain, following the __proto__ Object
* *this* points at the first object in the lookup chain.

__proto__
```

var Tellarter = {

}
var tellarter  = Object.create(person);
tellarter.name = "fer"
console.dir(Tellarter);

```







# Functions

## Functions as Objects.

```JavaScript
var func = function (){ }; // this is a function declaration or function expresion
```
* This creates a structure in memory and assign it to the variable with name func.
* Every function has properties and values, and a prototype chain.
* All functions inherit from the function prototype, and eventually to the object prototype.

That is why you can use methods that are part of the objects prototypes.
You can also add new properties like any other regular objects. `demonstrate on web console`

###### Functions are callable (or invoked, or executed)
All objects that are callable and  return a value.

###### Vocab and concepts
Functions are first class:
* They can be assigned to a variable ( as we did above).
* it also means that we can pass them as arguments,
* or we can return a function.

```JavaScript
//you can name functions
function functionDeclaration(){}

//you can assign them to variables
var functionExpresion = function (){} // this is an anonymous function.
var namedFunc = function namedFunc(){} //not anonymous function.
/*
So why name your functions? Well sometimes it can be helpful in stack traces when debugging.
*/

//you can even assign and pass them
var foo = function(bar){//you can now use bar inside the foo}
foo(bar);

//Return yo func
var foo = function(wow){
  return function(){
    wow();
  }
}

//arguments
var funcArg = function(foo, bar /* the rest*/){
  var dubbleFoo = foo * 2;
  var allthearguments = arguments; // returns all the arguments as an array

}
```
# OOP (Object oriented programing)
#### Creating functions

```JavaScript
var add  = new Function(a, b, ""); // new operator with function constructure.
```

# Modules

 Closures!
```JavaScript
//this starts to look more like a library. like Three js or d3.
var MODULE = (function () {
  var public = {},
  privateVariable = 1;

  function privateMethod() {
    // ...  
  }
  public.moduleProperty = 1;
  public.moduleMethod = function () {// ...        };        

  return public;
}());
```
> There is also a way to have Cross-File Private State with modules. That is a more advance pattern.
