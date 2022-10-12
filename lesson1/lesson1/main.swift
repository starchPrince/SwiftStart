//
//  main.swift
//  lesson1
//
//  Created by Сергей Буланов on 11.10.2022.
//

import Foundation

// Константа
 let max = 10

//Переменная

var min = 0

var welcomeMassege: String = "Hallo MiR"


// Преобразование типов

let three: Int = 3
let point: Double = 0.141
let pi: Double = Double(three) + point
print(pi)

// Опциональные типы

var g: Int = 11
var f: String? = "Mir"
f = nil
var futureTeacher: String?
futureTeacher = "Иван Иванов"
print("Наш будущий учитель \(futureTeacher)")
print("Наш будущий учитель \(futureTeacher!)")

if futureTeacher != nil {
    print("Наш будущий учитель \(futureTeacher!)")
    
} else {
    print("будущего учителя - нет")
}

if let knownTeacher = futureTeacher {
    print("Наш будущий учитель \(knownTeacher)")
} else {
    print("будущего учителя - нет")
    
}


// оператор объединения по nil

let defaultLunch = "pizza"
var specialLinch: String?

var myLunch: String = specialLinch  ?? defaultLunch

print("Мой обед сегодня \(myLunch)")

specialLinch = "pasta"

myLunch = specialLinch  ?? defaultLunch

print("Мой обед сегодня \(myLunch)")

// Коллекции
// Массивы
 
var natPark: [String]  = ["Park_1", "Park_2", "Park_3"]
print(natPark[1])
natPark.append("Park_4")
natPark.insert("Park_1.5", at: 1)
print(natPark)
natPark.removeLast()
natPark.remove(at: 1)
print(natPark)
natPark[0] = "Parrrk_One"
print(natPark)

// Cловарь

let fractions: [Double: String] = [0.25:"1/4", 0.5:"1/2", 1:"1"]

var countries: [String:String] = ["IT":"Italia", "FR":"France", "RU":"Russia"]
countries["AU"] = "Australia"
print(countries)
countries["AU"] = nil
print(countries)

// Set

var favGenres: Set<String> = ["Rock", "Classic", "Jazz", "rock"]
print(favGenres)

print(favGenres.count)

if favGenres.contains("Rock1") {
    print("Рок жив")
} else {
print("Рока уже нет")
}


// Решить квадратное уравнение

//ax^2 + bx + c = 0
//D = b^2  - 4 a c
//D < 0 no roots
//D = 0 x = - (b / 2a)
//D > 0 x1,2 = ((-b +- sqrtd(D))/(2a))

var a:Double = 4
var b:Double = 4
var c:Double = 1

var D = b*b - 4*a*c

if D < 0 {
    print("В данном уровнении корней нет")
} else if D == 0 {
    var x = -(b/(2*a))
    print("В уровнении один корень равный х = \(x)")
} else {
    var x1 = ((-b + sqrt(D))/(2*a))
    var x2 = ((-b - sqrt(D))/(2*a))
    print("В уровнении два корня. х1 = \(x1), x2 = \(x2)")
}


//Даны катеты прямоугольного треугольника найти периметр площадь и гипотенузу
var katA: Double = 10
var katB: Double = 12
// Расчет гипотенузы
var hypC = sqrt(katA*katA + katB*katB)
// Расчет периметра
var p: Double = katA + katB + hypC
//Расчет площади
var S: Double = 0.5 * katA * katB

print("Площадь треугольника S = \(Int(S)), Периметр треугольника P = \(Int(p)), гипотенуза C = \(Int(hypC))")


//Пользователь вводит сумму вклада и годовой процент  Найти сумму вклада через 5 лет

var dep = 1000
var proc = 10

var firstYear = dep + (dep / 100 * proc)
print(firstYear)
var secondYear = firstYear + (firstYear / 100 * proc)
print(secondYear)
var threeYear = secondYear + (secondYear / 100 * proc)
print(threeYear)
var fourYear = threeYear + (threeYear / 100 * proc)
print(fourYear)
var fiveYear = fourYear + (fourYear / 100 * proc)
print(fiveYear)
