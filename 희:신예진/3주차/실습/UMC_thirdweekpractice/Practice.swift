//
//  Practice.swift
//  UMC_thirdweekpractice
//
//  Created by 신예진 on 2023/04/12.
//

//옵셔널 연습
import Foundation
import UIKit

let x : Int? = 10
let y : Int? = nil

if let xx = x {
    print("x = \(xx)")
}
else {
    print("x is optional")
}

if let yy = y{
    print("y=\(yy)")
}

//여러 옵셔널 바인딩
let name1 : String?
let name2 : String?

name1 = "UMC"
name2 = "화이팅"

if let nameFirst = name1,
   let nameSecond = name2 {
    print(nameFirst, nameSecond)
}

//guard let 사용

let x : Int? = 10
let y : Int? = nil

func opbinding() {
    guard let xx = x else{
        return print("x is optional")
    }
    print(xx)
    
    guard let yy = y else{
        return print("y is optional")
    }
    print(yy)
    
}

opbinding()

//옵셔널 체이닝
struct Student{
    let name : String
    let age : Int
}
var student : Student?
