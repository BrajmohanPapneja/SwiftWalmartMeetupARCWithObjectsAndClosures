//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//: Closures are very fundamental to Swift. and They are reference type. Here is an example of closure.

//var value = 0
//let increment :() -> Void = {
//
//    value += 1
//    print(value)
//}
//
//increment()
//increment()
//value = 15
//increment()
//increment()

//*/
 
//: What if Swift didn't have closures ? Well, We can simulate closures using class. because Class are also of refrence type.
/*
class Increment {
    var value = 0
    
    func invoke (){
        value+=1
        print(value)
    }
}

let increment = Increment()
increment.invoke()
increment.invoke()
increment.invoke()
increment.invoke()*/

//: The thing Closures closes over is stored property.


//: Here is an example that exhibits memory leak.

/* class Demo {
    var value = 0
    lazy var increment : (Int) -> Void = { by in
        self.value += by
        print(self.value)
    }
}

let demo = Demo()
demo.increment(3)*/

//: Here leak has occured. because demo instance holds closure and closure holds back demo instance using self

//; How we can solve this, if closure were not there.

class Demo
{
    var value = 0
    lazy var increment : Increment =
        Increment(demo: self)
}

class Increment {
    unowned let demo : Demo
    func invoke(by amount:Int) -> Void {
        
        demo.value += amount
        print(demo.value)
    }
    init(demo:Demo){
        self.demo = demo
    }
}

let demo = Demo()
demo.increment.invoke(by: 3)


//: Capturing list

/*class Demo {
    var value = 0
    lazy var increment : (Int) -> Void = {[unowned self] by in
        self.value += by
        print(self.value)
    }
}

let demo = Demo()
demo.increment(3)*/

//: Demo().increment(3)

//class Demo {
//    var value = 0
//    lazy var increment : (Int) -> Void = {[weak self] by in
//        guard let strongSelf = self else {
//            print("Nope")
//            return
//        }
//
//        strongSelf.value += by
//        print(strongSelf.value)
//    }
//}
//
//let demo = Demo()
//demo.increment(3)
//
//Demo().increment(3)

