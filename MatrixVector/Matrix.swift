//
//  Matrix.swift
//  Assignment1
//
//  Created by George Bonnici-Carter on 8/10/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

import Foundation


public class Matrix<T: MatrixData>: CustomStringConvertible, BasicMatrix, MatrixArithmetic {
    
    let row: Int
    let column: Int
    //private let matrix: Matrix<T>
    var arrays: [[T]]
    
    init(rows: Int, columns: Int){
        assert(rows>0&&columns>0, "invalid matrix size")
        self.row = rows
        self.column = columns
        self.arrays = Array(count: rows, repeatedValue: Array(count: columns, repeatedValue: T()))
    }
    
    init(rows: Int, columns: Int, array: [[T]]){
        self.row = rows
        self.column = columns
        self.arrays = array
    }
    
    public var description: String{
        var print: String = String("Size of matrix is \(row) by \(column) :")
        print = print + "\n"
        for i in 0...row-1{
            print = print + "["
            for j in 0...column-1{
                if(i==row-1 && j==column-1){
                    print = print + "\(arrays[i][j])" + "]"
                }else if(j==column-1){
                    print = print + "\(arrays[i][j])" + "]"
                }else{
                    print = print + "\(arrays[i][j])" + ", "
                }
            }
            if(i != row){
                print = print + "\n"
            }
        }
        return print
    }
    
    
    // Returns the number of rows in the matrix
    public var rows: Int {
        get { return self.row }
    }
    
    // Returns the number of columns in the matrix
    public var columns: Int {
        get { return self.column }
    }
    
    // Returns a matrix that is a transpose of the current matrix
    public var transpose: Matrix<T> {
        get {
            let matrixCopy: Matrix<T> = Matrix<T>(rows: self.columns, columns: self.row)
            for i in 0...row-1{
                for j in 0...column-1{
                    matrixCopy.arrays[j][i]=self.arrays[i][j]
                }
            }
            return matrixCopy
        }
    }
    
    // Returns/sets the element value at the given row and column index
    public subscript(row: Int, column: Int) -> T {
        get{
            assert(row<self.rows&&column<self.columns, "invalid matrix size")
            return self.arrays[row][column]
        }
        set(elem){
            assert(row<self.rows&&column<self.columns, "invalid matrix size")
            arrays[row][column] = elem
        }
    }
    
    // Returns a new object that is a copy of the current matrix
    public func copy() -> Matrix<T>{
        return Matrix<T>(rows: self.row, columns: self.column, array: self.arrays)
    }
    
    public var vectorview: Vector<T> {
        get{
            assert(self.row == 1 || self.column ==  1, "Must be single row matrix or single column matrix to convert")
            if(column == 1){
                self.arrays = self.transpose.arrays
                return Vector<T>(size: row, vector: arrays)
            } else {
                return Vector<T>(size: column, vector: arrays )
            }
        }
    }
    
    // Select row vector from matrix
    public func row(index: Int) -> Vector<T>{
        assert(index >= 0 && index < self.row, "invalid index in matrix")
        let arr: [[T]] = [arrays[index]]
        return Vector<T>(size: column, vector: arr)
    }
    
    // Select column vector from matrix
    public func column(index: Int) -> Vector<T>{
        assert(index >= 0 && index < self.column, "invalid index in matrix")
        var data = [T]()
        for i in 0...row-1{
            data.append(arrays[i][index])
        }
        let temp: [[T]] = [data]
        return Vector<T>(size: row, vector: temp)
    }

}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    assert(lhs.columns == rhs.rows, "Matrices are imcomparable")
    let resultMatrix: Matrix<T> = Matrix<T>(rows: lhs.row, columns: rhs.column)
    for i in 0...lhs.rows-1{
        for j in 0...rhs.columns-1{
            for k in 0...lhs.columns-1{
                resultMatrix[i,j] = resultMatrix[i,j] + (lhs[i,k]*rhs[k,j])
            }
        }
    }
    return resultMatrix
}

public func +<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    assert(lhs.columns == rhs.columns && lhs.rows == rhs.rows, "Matrices are imcomparable")
    for i in 0...lhs.rows-1{
        for j in 0...lhs.columns-1{
            lhs[i,j] = lhs[i,j] + rhs[i,j];
        }
    }
    return lhs
}

public func -<T: MatrixData>(lhs: Matrix<T>, rhs: Matrix<T>) -> Matrix<T>{
    assert(lhs.columns == rhs.columns && lhs.rows == rhs.rows, "Matrices are imcomparable")
    for i in 0...lhs.rows-1{
        for j in 0...lhs.columns-1{
            lhs[i,j] = lhs[i,j] - rhs[i,j];
        }
    }
    return lhs
}

public func +<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    for i in 0...lhs.rows-1{
        for j in 0...lhs.columns-1{
            lhs[i, j] = lhs[i, j] + rhs;
        }
    }
    return lhs
}

public func -<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    for i in 0...lhs.rows-1{
        for j in 0...lhs.columns-1{
            lhs[i,j] = lhs[i,j] - rhs;
        }
    }
    return lhs
}

public func *<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    for i in 0...lhs.rows-1{
        for j in 0...lhs.columns-1{
            lhs[i,j] = lhs[i, j] * rhs;
        }
    }
    return lhs
}

public func /<T: MatrixData>(lhs: Matrix<T>, rhs: T) -> Matrix<T>{
    for i in 0...lhs.rows-1{
        for j in 0...lhs.columns-1{
            lhs[i,j] = lhs[i, j] / rhs;
        }
    }
    return lhs
}
