//
//  main.swift
//  lesson3
//
//  Created by Сергей Буланов on 13.10.2022.
//

import Foundation

print("Hello, World!")
//урок третий

// перечисления

var russianCurrency: String = "Rouble"
var dollarCurr: String = "Dollar"
var euroCurr: String = "String"

var currency: [String] = ["Rouble", "Dollar", "Euro"]

enum currency_enum {
    case Rouble
    case Dollar
    case Euro
    
}

print(currency_enum.Dollar)

var rouble: currency_enum = .Rouble
var dollar = currency_enum.Dollar

enum Direction: String {
    case Left = "Left"
    case Right = "Right"
}

enum Action {
    case Walk(maeters: Int)
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn(direction: Direction)
    
    enum action2 {
        case jump
        case fly
    }
}

var action = Action.Run(meters: 100, speed: 10)
action = .Stop
action = .Walk(maeters: 150)
action = .Run(meters: 100, speed: 4)
action = .Turn(direction: .Left)
switch action {
case .Stop: print("Stop")
case .Walk(let meters) where meters < 100:
    print("Прогулка \(meters) метров")
case.Walk:
    print("Прогулка")
case .Run(let meters, let speed):
    print("Пробежали \(meters) метров со скоростью \(speed) километров в секунду")
case .Turn(let direction) where direction == .Left:
    print(direction.rawValue)
default:
    break
}

//Структуры

//struct playerChess {
//    // Описание структуры
//
//}
//
//var Sergey: playerChess

struct playerChess {
    var name: String = " "
    var wins = 0
    
    func descriptions() {
        print("Игрок \(name) выйграл \(wins) матчей")
    }
    mutating func addWins(wins:Int){
        self.wins += wins
    }
}

var oleg = playerChess(name: "Олег", wins: 98)
var sergey = playerChess(name: "Сергей", wins: 99)

if sergey.wins > oleg.wins {
    print(sergey.name, " играет лучше чем ", oleg.name)
} else {
    print(oleg.name, " играеи лучше чем ", sergey.name)
}

sergey.descriptions()
oleg.descriptions()
sergey.addWins(wins: 4)
sergey.descriptions()


struct test{
    var a: Int
    var b: Int
    
    init(katetA: Int, katetB: Int){
        self.a = katetA
        self.b = katetB
    }
}


//Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик
//TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли
//двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить
//двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного
//объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять
//свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum engineStatus: String {
    case on = "Мотор заведен"
    case off = "Мотор заглущён"
}
enum windowsStatus: String {
    case open = "Окна открыты"
    case closed = "Окна закрыты"
}

struct SportCar {
    var carBrand: String
    var yearOfRelease: Int
    var bodyVolume: Int
    var engineStatus: engineStatus
    var windowsStatus: windowsStatus
    
    mutating func acEngine(action: engineStatus) {
        switch action {
        case .off:
            print(action.rawValue)
            self.engineStatus = .off
            
        case .on:
            print(action.rawValue)
            self.engineStatus = .on
        }
    
    }
    func description() {
        print("Автомобиль \(carBrand), \(yearOfRelease) года выпуска. \(engineStatus.rawValue)")
    }
    
}

struct TrunkCar {
    var carBrand: String
    var yearOfRelease: Int
    var trunkVolume: Int
    var engineStatus: engineStatus
    var windowsStatus: windowsStatus
    
    mutating func acWindows(action: windowsStatus) {
        switch action {
        case .closed:
            print(action.rawValue)
            self.windowsStatus = .closed
            
        case .open:
            print(action.rawValue)
            self.windowsStatus = .open
        }
    }
    func description() {
        print("Автомобиль \(carBrand), \(yearOfRelease) года выпуска. \(windowsStatus.rawValue)")
    }
}


var car1 = SportCar(carBrand: "Chevr", yearOfRelease: 2022, bodyVolume: 22, engineStatus: .on, windowsStatus: .closed)
print(car1.description())

var car12 = TrunkCar(carBrand: "Kamaz", yearOfRelease: 2021, trunkVolume: 33, engineStatus: .off, windowsStatus: .closed)
print(car12.description())
car12.acWindows(action: .open)
print(car12.description())

