//
//  main.swift
//  lesson6
//
//  Created by Сергей Буланов on 19.10.2022.
//

import Foundation

print("Hello, World!")

// Generic

func swapToInt(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp
}

func swapTwoString(_ a: inout String, _ b: inout String) {
    let tmp = a
    a = b
    b = tmp
}

func swapTwoGeneric<T>(_ a: inout T, _ b: inout T) {
    let tmp = a
    a = b
    b = tmp
}
var tt = 21
var aa = 12
swapTwoGeneric(&tt, &aa)
print(tt)
print(aa)

var a = "world"
var b = "Hello"
swapTwoGeneric(&a, &b)
print(a)
print(b)


struct StackInt {
    
    var items = [Int] ()
    
    mutating func push (_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
}

struct StackGeneric<Element> {
    var items = [Element] ()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}


var stackOfString = StackGeneric<String>()
stackOfString.push("One")
stackOfString.push("Two")

var stackOfInt = StackGeneric<Int>()
stackOfInt.push(1)
stackOfInt.push(2)
//
//class SomeClass {
//
//}
//
//protocol SomeProtocol {
//
//}
//
//func someFunc<T: SomeClass, U: SomeProtocol> (some: T, someU: U) {
//
//}

func findIndexString(ofString valueToFind: String, in array:[String]) -> Int? {
    
    for (index, value) in array.enumerated() {
        
        if value == valueToFind {
            return index
        }
    }
    return nil
}


let stringArray = ["cat", "mouse", "dog"]

if let foundIndex = findIndexString(ofString: "mouse", in: stringArray){
    print(foundIndex)
}
 
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
    
}


class testInt: Equatable {
    
    let value: Int
    
    init(value: Int) {
        self.value = value
    }
    
    static func == (lhs: testInt, rhs: testInt) -> Bool {
        return lhs.value == rhs.value
    }
}


// subscripting

  
//let array = ["a", "b", "c"]
//array[0]
//
//subscript(index: Int) -> Int {
//    get {
//        // Возвращаем
//    }
//    set {
//        // Меняем
//    }
//}

struct TimesTable {
    let multiplaer: Int
    subscript(index: Int) -> Int {
        return multiplaer * index
    }
}

let threeTimeTable = TimesTable(multiplaer: 3)
print(threeTimeTable[6])



struct Welcome {
    var a = "Hello"
    var b = "Hi"
    var c = "Privet"
    
    subscript (index: Int) -> String {
        get{
            switch index {
            case 0: return a
            case 1: return b
            case 2: return c
            default: return "Nani"
            }
        }
        set {
            switch index {
            case 0: a = newValue
            case 1: b = newValue
            case 2: c = newValue
            default: break
            }
            
            
        }
    }
     
}



var w = Welcome()
print(w[2])
w[0] = "HELLLLLO"
print(w[0])

// Замыкания

let valueArray = [4,5,3,12,4,13,5,124,1]

func filterA(array: [Int], function: (Int)-> Bool) -> [Int] {
    var newFilterArray = [Int]()
    
    for i in array {
        if function(i) {
            newFilterArray.append(i)
        }
    }
return newFilterArray
}

func compare(i: Int) -> Bool {
    return i % 2 == 0
}
func noCompare(i: Int) -> Bool {
    return i%2 == 1
}

print  (filterA(array: valueArray, function: compare))
print(filterA(array: valueArray, function: noCompare))

print(filterA(array: valueArray, function: {(i: Int) -> Bool in
    return i % 2 == 0
}
))

let names = ["Аname1", "Бname2", "Вname3", "Гname4"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversNames = names.sorted(by: backward)
print(reversNames)
reversNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1 < s2
})

print(reversNames)

reversNames = names.sorted(by: {s1, s2 in return s1 > s2})
reversNames = names.sorted(by: {$0 > $1})
print(reversNames)
 
reversNames = names.sorted() {$0<$1}
print(reversNames)

var arrayI = [12, 2 , 3 , 4, 66 , 7]

var newArray = arrayI.map{$0 * 2}
print(newArray)


var lowerString = names.map{$0.lowercased()}

print(lowerString)


let newNewArray = arrayI.map{$0 % 2}.filter{ $0 == 1}
print(newNewArray)

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример:
//filter для массивов)
//3. *Добавить свой subscript, который будет возвращать nil в случае обращения к
//несуществующему индексу.

struct queuer<Element: Comparable> {
    var items = [Element]()
    mutating func add(_ item: Element) {
        items.append(item)
    }
    mutating func next() -> Element {
        print("Следующий в очереди \(items.first!)")
        return items.removeFirst()
    }
    
    func filter(item: Element) {
        print("Найти \(items.filter{$0 == item})")
    }
    
    mutating func propertySort() -> [Element] {
        return items.sorted(by: <)
    }
    
    subscript(index: Int) -> Element? {
        return (index < items.count ? items[index] : nil)
    }
    func printCount() {
        print(items.count)
    }
}

var ochered = queuer<String>(items: ["A"])
ochered.add("C")
ochered.add("D")
ochered.add("B")
print(ochered.items)
print("Очередь по порядку \(ochered.propertySort())")

ochered.next()
ochered.add("E")
print(ochered)

ochered.filter(item: "E")

print(ochered[2])
