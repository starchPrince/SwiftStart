//
//  main.swift
//  lesson2
//
//  Created by Сергей Буланов on 12.10.2022.
//

import Foundation
//Второй урок

print("Hello, World!")

// Составные операторы

var a = 10
a = 15
a = a + 6
a += 6

// Логические операторы

// логическое И
true && true
// Логическое  ИЛИ
true || false
// Логическое НЕ
!true

var y = 6
// блок if
if (y == 6 || y == 5) {
    print("Y = 6")
} else if y == 14 {
    print("Y = 5")
} else {
    print("y отсутствует")
}

//тернарный оператор
var o = 10
o == 10 ? print("o=10") : print("o != 10")

var h = 10
var i = true

let u = h + (i ? 5 : 10)

print(u)

// switch case

let userMark = 5

switch userMark {
case 1 : print("Не сдал")
case 2: print("Не сдал")
case 3: print("Удовлетворительно")
case 4: print("Хорошо")
case 5: print("Отлично")
default:
    print("Не пришел")
}

// fallthrough

let level: Character = "Б"

switch level {
    
case "Б":
    print("Это же Б")
    fallthrough
case "А": print("Это же А")
default: break
    
    
}

var z = -1 
var x = 4
var f = 4

var D = (x*x) - 4 * z * f

switch D {
case _ where D > 0:
    print("2 roots")
case _ where D == 0:
    print("1 root")
default:
    print("No roots")
}

// Циклы

// for - in

var totalSum = 0

for i in 1 ... 10 {
    print("i", i)
    print("totalSum", totalSum)
    totalSum += i
    print("totalSum result", totalSum)
}

var arrayMusic = ["Jazz", "Bluzz", "Reggy"]

for i in arrayMusic {
    print(i)
}

var country = ["Франция":"ЕС", "США":"НАТО", "Бельгия":"ЕС"]

for (ck, cv) in country {
    print("\(ck) входит в \(cv)")
}

for i in stride(from: 1, to: 10, by: 3) {
    print(i)
}
for i in stride(from: 1, through: 10, by: 3) {
    print(i)
}

//while

var k = 1
var resultSum = 0

while k <= 10 {
    resultSum += k
    k += 1
}
print(resultSum)

// repeat while

var l = 1
var result = 0

repeat {
    result += l
    l += 1
} while l <= 10

// Функции

func myFirstFunc(firstValue somevalue: Int, anotherValue: String, _ value: String) -> String {
    let c: String = String(somevalue) + anotherValue + value
    return c
}

print(myFirstFunc(firstValue: 9, anotherValue: "pa", "sha"))


var j = 3
var r = 4

func changeValue ( _ a: inout Int, _ b: inout Int) {
    let x = a
    a = b
    b = x
    }

print(j)
print(r)
changeValue(&j, &r)
print(j)
print(r)



//1. Написать функцию, которая определяет, четное число или нет.
func evenOrOdd (_ a: Int) {
    if a%2 == 0 {
        print(a, "четное")
    } else {
        print(a, "нечетное")
    }
}
evenOrOdd(2)

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func delenie (_ a: Int) {
    if a%3 == 0 {
        print(a, "делится на три без остатка")
    } else {
        print(a, "делится на три только с остатком")
    }
}
delenie(6)

//3. Создать возрастающий массив из 100 чисел.

var arrayDz: [Int] = []
for i in 1...100 {
    arrayDz.append(i)
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for i in arrayDz {
    if (i%2 == 0) || (i%3 != 0) {
        arrayDz.remove(at: arrayDz.firstIndex(of: i)!)
    }
}
print(arrayDz)


//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при
//помощи нее 50 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func fibonacci( _ n: Int) -> [Int] {
    var  array = [0,1]
    while array.count < n {
        array.append(array[array.count-1] + array[array.count-2])
    }
    return array
}



//6. * Заполнить массив элементов различными простыми числами. Натуральное число, большее
//единицы, называется простым, если оно делится только на себя и на единицу. Для
//нахождения всех простых чисел не больше заданного числа n (пусть будет 100), следуя
//методу Эратосфена, нужно выполнить следующие шаги:
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p.
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению
//переменной p это число.
//e. Повторять шаги c и d, пока возможно

var natArray: [Int] = []
for i in 2...100 {
    natArray.append(i)
}

for i in natArray {
    for number in natArray {
        if number % i == 0 && number != i {
            natArray.remove(at: natArray.firstIndex(of: number)!)
        }
    }
}
print(natArray)
