//
//  main.swift
//  Assignment1
//
//  Created by George Bonnici-Carter on 8/5/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

import Foundation

var A: Matrix<Int> = Matrix<Int>(rows: 4, columns: 3)
A[1,0]=6
var V: Vector<Int> = Vector<Int>(size: 4)
V[2]=3
var L: Vector<Int> = V.copy()
print("\(V.description)")
print("\(L.description)")
var t: Vector<Int>
t = V+L
print("\(t.description)")
print("\(A.description)")
print("\(A.copy())")
var B: Matrix<Int> = A.transpose
print("\(B.description)")
var C: Matrix<Int> = Matrix<Int>(rows: 4, columns: 3)
print("\(C.description)")
var D: Matrix<Int>
var number: Int
number = 3
C = A*number
print("\(C.description)")
var F = Matrix<Fraction>(rows: 1, columns: 2)
F[0,0] = Fraction(num: 3, den: 4)
F[0,1] = Fraction(num: -1, den: 2)
print("\(F.description)")
//var a: Int = A.subscript(row:2, column:1)
//print("\(a)")


