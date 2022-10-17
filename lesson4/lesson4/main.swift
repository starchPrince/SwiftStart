//
//  main.swift
//  lesson4
//
//  Created by Сергей Буланов on 16.10.2022.
//

import Foundation

print("Hello, World!")

// Введение в ООП
/*
 Инкапсуляция(Запрет передачи некоторых параметров из 1 класса в другой)
 Наследование (дочерние классы наследуют родительские, но добавляют что-то своё)
 Полиморфизм
 */

//Инкапсуляция

class People {
    private var city = "SaintP"
    var name = "Serj"
    
    func printHi() {
        print("Hi, \(city)")
    }
}

var peopleOne = People()
print(peopleOne.name)
peopleOne.printHi()

//peopleOne.city = "Tash"
peopleOne.printHi()

// Полиморфизм

var a = 5
var b = 10
var c = a + b
var aa = "Hello"
var bb = "World"
var cc = aa + bb


struct Resolution {
    var w = 0
    var h = 0
}

let hd = Resolution(w: 1920, h: 1080)

var cinema = hd
cinema.w = 2048

print(hd.w)
print(cinema.w)


// Класс
class VideoMode {
    var f = 0.0
}

let t  = VideoMode()
t.f = 25.0

let alsoT = t
alsoT.f = 30

print(t.f)
print(alsoT.f)



class Chessman {
    
    enum chessmanType {
        case king
        case castle
        case queen
    }
    enum chessmanColor {
        case white
        case black
    }
    
    let type: chessmanType
    let color: chessmanColor
    var coordinate: (String, Int)? = nil
    
    init(type: chessmanType, color: chessmanColor) {
        self.type = type
        self.color = color
    }
    
    init(type: chessmanType, color: chessmanColor, coordinate: (String, Int)) {
        self.type = type
        self.color = color
        self.setCoordinate(char: coordinate.0 ,  number: coordinate.1 )
    }
    
    
  final  func setCoordinate (char c: String, number n: Int){
        self.coordinate = (c,n)
    }
    func kill() {
        self.coordinate = nil
    }
    
}

var king = Chessman(type: .king, color: .black)
king.setCoordinate(char: "E", number: 7)

var queen = Chessman(type: .queen, color: .white, coordinate: ("E", 3))

// Наследование

class SomeChessman: Chessman {
    func printChessmanType() {
        print(self.type)
    }
//    override func setCoordinate(char c: String, number n: Int) {
//        self.coordinate = (c, n*2)
//        print(coordinate)
//    }
}

var castle = SomeChessman(type: .castle, color: .black, coordinate: ("F", 5))
castle.printChessmanType()
castle.setCoordinate(char: "B", number: 2)

//deinit {
//    // Когда будет удаление класса
//}


class SuperClass {
    init? (isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("Экземпляр создан")
        }
    }
    
    deinit {
        print("Класс deinit")
    }
}

class SubClass: SuperClass {
    deinit {
        print("SubCLass deinit")
    }
}

var obj = SubClass(isNil: false)
obj = nil


class Person {
    let name: String
    
    init(name: String) {
        self.name = name
            print("\(name) создан")
    }
    deinit {
        print("\(name) удален")
    }
}

var ref1: Person?
var ref2: Person?
var ref3: Person?

ref1 = Person(name: "Serg")
ref2 = ref1
ref3 = ref1

ref1 = nil
ref2 = nil
ref3 = nil

class Human {
    let name: String
    var child = [Human?]()
    weak var father: Human?
    weak var mother: Human?
    init(name: String) {
        self.name = name
        print("\(name) создан")
    }
    deinit {
        print("\(name) sloman")
    }
}

if 1 == 1 {
    let kirill = Human(name: "Кирилл")
    let olga = Human(name: "Ольга")
    let alex = Human(name: "Алекс")
    kirill.father = alex
    kirill.mother = olga
    alex.child.append(kirill)
    olga.child.append(kirill)
    
}


//Описать класс Car c общими свойствами автомобилей и пустым методом действия по
//аналогии с прошлым заданием.
//2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными
//свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него
//свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные
//действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его
//классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

class Car {
    
    enum EngineStatus: CustomStringConvertible {
        case on
        case off
        var description: String {
            switch self {
            case .off:
                return "Двигатель заглушен"
            case .on:
                return "Двигатель заведен"
            }
        }
    }
    
    enum WindoowsStatus: CustomStringConvertible {
        case opened
        case closed
        var description: String {
            switch self {
            case .closed:
                return "Окна закрыты"
            case .opened:
                return "Окна открыты"
            }
        }
    }
    
    enum TruckBodyType: CustomStringConvertible {
        case box, tank, refrigerator
        var description: String {
            switch self {
            case .box:
                return "Стандартный кузов"
            case .tank:
                return "Цистерна"
            case .refrigerator:
                return "Морозилка"
            }
        }
    }
    
    enum Action {
        case switchEngine(EngineStatus)
        case switchWindows(WindoowsStatus)
        case replaceTyres
    }
    
    
    
    let carBrand: String
    let yearOfRelease: Int
    var engineStatus: EngineStatus = .off
    var windowsStatus: WindoowsStatus = .closed
    
    
    
    init(carBrand: String, yearOfRelease: Int) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
    }
    
    func preform(action: Action) {
        
    }
}


class SportCar: Car, CustomStringConvertible {
    
    var zeroToHundredAcceleration: Double = 0.0
    var topSpeed: Int = 0
    
    var description: String {
        return "\(carBrand), Год выпуска \(yearOfRelease), Разгон от 0 до 100 \(zeroToHundredAcceleration), Максимальная скорость \(topSpeed), Состояние \(engineStatus), \(windowsStatus)"
    }
    
    init(carBrand: String, yearOfRelease: Int, zeroToHundredAcceleration: Double, topSpeed: Int) {
        self.zeroToHundredAcceleration = zeroToHundredAcceleration
        self.topSpeed = topSpeed
        super.init(carBrand: carBrand, yearOfRelease: yearOfRelease)
    }
    
    override func preform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engineStatus = status
        case .switchWindows(let status):
            windowsStatus = status
        case .replaceTyres:
            print("Произведена замена Шин")
            default:
            break
            
        }
    }
    
    
}

class TrunkCar: Car, CustomStringConvertible {
    
    let maxCargoSpace: Double
    var body: TruckBodyType?
    
    var description: String {
        let boddyDescription = body?.description ?? "Отцеплен"
        return "\(carBrand), Год выпуска \(yearOfRelease), Кузов \(boddyDescription)  \(maxCargoSpace) Состояние \(engineStatus), \(windowsStatus)"
    }
    init(carBrand: String, yearsOfRelease: Int, maxCargoSpace: Double, body:TruckBodyType?) {
        self.body = body
        self.maxCargoSpace = maxCargoSpace
        super.init(carBrand: carBrand, yearOfRelease: yearsOfRelease)
    }
    
    override func preform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engineStatus = status
        case .switchWindows(let status):
            windowsStatus = status
            
        default: break
        }
        
    }
    
}

var manTruck = TrunkCar(carBrand: "MAN", yearsOfRelease: 2023, maxCargoSpace: 30000, body: .tank)
manTruck.preform(action: .switchWindows(.opened))
manTruck.preform(action: .switchEngine(.on))
//print(manTruck)

var bugatti = SportCar(carBrand: "Bugatti", yearOfRelease: 2026, zeroToHundredAcceleration: 0.1, topSpeed: 370)
bugatti.preform(action: .replaceTyres)
bugatti.preform(action: .switchEngine(.on))
print(bugatti)
