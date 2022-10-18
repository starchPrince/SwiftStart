//
//  main.swift
//  lesson5
//
//  Created by Сергей Буланов on 18.10.2022.
//

import Foundation

//print("Hello, World!")
//
//// Протоколы
//
//protocol someProtocol {
//    // Описание протокола
//
//}
//
//struct someStruct: someProtocol {
//    //Реализация протокола
//}
//
//class SubClass: SuperClass, someProtocol {
//    // Реализация протокола
//}


protocol someProtocol {
    var mustBeSettable: Int {get set} // Читаем и изменяем
    var doesNotBeSettable: Int {get}  // Только читаем
    
}

protocol fullyNamed {
    var fullName: String {get}
}

struct Person: fullyNamed {
    var fullName: String
}

class Starship: fullyNamed {
    
    var prefix: String?
    var name: String
    init (name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : " ") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "uss")

print(ncc1701.fullName)


protocol NamedKnight {
    var nameKnight: String {get set}
}

struct Knight: NamedKnight {
    
    
    var name: String
    var nameKnight: String {
        get {
            return name
        }
        set {
            name = newValue + " knight of W"
        }
    }
}

var knightA = Knight(name: "Zxc")
print(knightA.nameKnight)
knightA.nameKnight = "QaZ"
print(knightA.nameKnight)


protocol Printable {
    var name: String {get}
}

struct HumanP: Printable {
    var name: String
    
    
}

struct AnimalP: Printable {
    var name: String
    
    
}

func printOut(object: Printable) {
    print(object.name)
}


protocol RandomNumberGen {
    
    func random() -> Double
}

class LinGen: RandomNumberGen {
    var lastResult = 42.0
    let a = 12.0
    let b = 18.0
    let c = 37.0
    
    func random() -> Double {
        lastResult = (lastResult * a + b - c)
        return lastResult
    }
}

let gen = LinGen()
print(gen.random())
print(gen.random())


protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
            
        case .off:
            self = .on
        }
    }
}

var light = OnOffSwitch.off
print(light)
light.toggle()
print(light)



// Расширения

//extension SomeType {
//    // доп функционал
//}

extension RandomNumberGen {
    func randomBool() -> Bool {
        print(random())
        return random() > 10000.0
    }
}

print(gen.randomBool())


extension Double {
    var km: Double {return self * 1000.0}
    var m: Double {return self}
    var sm: Double {return self / 100}
}

let one = 25.0.km
print(one)


// Полиморфизм

protocol Figure {
    func drawFigure()
}

class Rectangle: Figure {
    func drawFigure() {
        print("Draw rectangle")
    }
}

class Triangle: Figure {
    func drawFigure() {
        print("Draw Triangle")
    }
}

func draw(_ figure: Figure) {
    figure.drawFigure()
}
draw(Rectangle())
draw(Triangle())

protocol Named {
    var name: String {get}
}
protocol Aged {
    var age: Int {get}
}

struct PersonNA: Named, Aged {
var name: String
    var age: Int
}

func wishNA(to celebration: Named & Aged) {
    print("С Днём роджения \(celebration.name)  Тебе уже \(celebration.age) годиков")
    
}

let birth = PersonNA(name: "Lord K", age: 111)
wishNA(to: birth)






enum windows {
    case open, close
}

enum engine {
    case on, off
}

protocol Car: AnyObject {
    var model: String {get}
    var yearOfRelease: Int {get}
    var windowsStatus: windows {get set}
    var engineStatus: engine {get set}
}


extension Car {
    
    func Windows(status: windows) {
        switch status {
        case .open:
            print("\(model) Окна открыты")
            self.windowsStatus = .open
        case .close:
            print("\(model) Окна закрыты")
            self.windowsStatus = .close
            
        }
    }
    
    func Engine(status: engine) {
        switch status {
        case .off:
            print("\(model) Двигатель заглушен")
            self .engineStatus = .off
        case .on:
            print("\(model) Двигатель заведён")
            self.engineStatus = .on
        }
    }
}

protocol SportCar: Car {
    var maxSpeed: Int {get}
    var currentSpeed: Int {get set}
}

extension SportCar {
    func IncreaseSpeed(speed: Int) {
        if speed + currentSpeed <= maxSpeed {
            print("\(model) Едет со скоростью \(speed)")
            self.currentSpeed += speed
        } else {
            print("\(model) Не может разогнаться до скорости \(speed + currentSpeed) Максимальная скорость \(maxSpeed)")
        }
    }
    
    
}

class sportCar: SportCar {
    var maxSpeed: Int
    
    var currentSpeed: Int
    
    var model: String
    
    var yearOfRelease: Int
    
    var windowsStatus: windows
    
    var engineStatus: engine
    
    init(model: String, yearOfRelease: Int, maxSpeed:Int) {
        self.maxSpeed = maxSpeed
        self.currentSpeed = 0
        self.model = model
        self.yearOfRelease = yearOfRelease
        self.engineStatus = .off
        self.windowsStatus = .close
    }
    
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль: \(model)\n" +
        "Год выпуска \(yearOfRelease)\n" +
        "Статус двигателя \(engineStatus)\n" +
        "Статус окон \(windowsStatus)\n" +
        "Максимальная скорость \(maxSpeed) \n" +
        "Текущая скорость \(currentSpeed) \n"
    }
}

var SportCar1 = sportCar(model: "Maserati", yearOfRelease: 2027, maxSpeed: 570)
SportCar1.Engine(status: .on)
SportCar1.Windows(status: .open)
SportCar1.currentSpeed = 100

print(SportCar1)
SportCar1.IncreaseSpeed(speed: 471)
