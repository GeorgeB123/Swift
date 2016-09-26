//
//  Vector.swift
//  Assignment1
//
//  Created by George Bonnici-Carter on 8/16/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

import Foundation

public class Vector<T: MatrixData> : Matrix<T>, BasicVector{
    
    
    init(size: Int){
        super.init(rows: 1, columns: size)
    }
    
    init(size: Int, vector: [[T]]){
        super.init(rows: 1, columns: size, array: vector)
    }
    
    public var size: Int {
        get {
            return columns
        }
    }
    
    public func dot(v: Vector<T>) -> T {
        assert(self.columns == v.columns, "vectors are different size")
        var sum: T = T();
        for i in 0...columns-1 {
            sum = sum + arrays[0][i]*v[i];
        }
        return sum
    }
    
    public subscript(index: Int) -> T {
        get{
            return arrays[0][index]
        }
        set(newElm){
            return arrays[0].insert(newElm, atIndex: index)
        }
    }
    
     override public func copy() -> Vector<T> {
        return Vector<T>(size: self.columns, vector:self.arrays)
    }
    
    var matrixview: Matrix<T> {
        get {
            assert(column < 1, "invalid vector")
            return Matrix<T>(rows: 1, columns: column, array: arrays)
        }
    }
    
}

func *<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> T{
    var result: T
    result = lhs.dot(rhs)
    return result
}
func +<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    for i in 0...lhs.columns-1{
        lhs[0,i] = lhs[0,i]+rhs[0,i]
    }
    return lhs
}

func -<T: MatrixData>(lhs: Vector<T>, rhs: Vector<T>) -> Vector<T>{
    for i in 0...lhs.columns-1{
        lhs[0,i] = lhs[0,i]-rhs[0,i]
    }
    return lhs
}

// Vector and scalar operators
func +<T: MatrixData>(lhs: Vector<T>, rhs:T) -> Vector<T>{
    for i in 0...lhs.columns-1{
        lhs[0,i] = lhs[0,1]+rhs
    }
    return lhs
}
func -<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    for i in 0...lhs.columns-1{
        lhs[0,i] = lhs[0,1]-rhs
    }
    return lhs
}
func *<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    for i in 0...lhs.columns-1{
        lhs[0,i] = lhs[0,1]*rhs
    }
    return lhs
}
func /<T: MatrixData>(lhs: Vector<T>, rhs: T) -> Vector<T>{
    for i in 0...lhs.columns-1{
        lhs[0,i] = lhs[0,1]/rhs
    }
    return lhs
}
