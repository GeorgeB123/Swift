//
//  Fraction.swift
//  prog2.1
//
//  Created by George Bonnici-Carter on 7/28/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

import Foundation

final class Fraction : CustomStringConvertible, StringConvertibleNum {
    
    /**
     Converts string to a Fraction object.  Supports string
     syntax of the following format:
     "a" - converts it to fraction a/1
     "a/b" - converts it to fraction a/b
     
     - parameter string: String to convert
     - returns: Fraction? Fraction read from string, nil if
     syntax error in the string
     */
    static func readFromString(string: String) -> Fraction? {
        // Default values for numerator
        // and denomintor
        var num: Int = 0;
        var den: Int = 1;
        
        // Break the string into tokens separated by / symbol
        var tokens = string.componentsSeparatedByString("/")
        
        // If there is at least one token, then there is
        // a numerator value
        if tokens.count > 0 {
            // Try to convert numerator string to integer -
            // if not successful, return nil
            if let n = Int(tokens[0]) {
                num = n
            } else {
                return nil
            }
        }
        
        // If there is a second token, then there is
        // a denominator value
        if tokens.count > 1 {
            // Try to convert denominator string to integer -
            // if not successful, return nil
            if let d = Int(tokens[1]) {
                den = d
            } else {
                return nil
            }
        }
        // Return new fraction initialising its
        // numerator and denominator to values
        // read from the string
        return Fraction(num: num, den: den)
    }
    
    private let num: Int;
    private let den: Int;
    
    var decimal: Float{
        get {
            return Float(self.num)/Float(self.den)
        }
    }
    
    var description: String{
        return "\(self.num)/\(self.den)"
    }
    
    init() {

        self.num = 0
        self.den = 1
    }
    
    init(num: Int, den: Int){
        
        assert(den != 0, "Denominator cannot be zero")
        
        var num = num
        var den = den
        
        if(den < 0){
            num = -num;
            den = -den;
        }
        
        for gcd in (1...den).reverse() {
            if(num%gcd == 0 && den%gcd == 0){
                num /= gcd;
                den /= gcd;
                break;
            }
        }
        self.num = num
        self.den = den
        
    }
    
    private func reduce() {
        
    }
    
    convenience init(num: Int){
        self.init(num:num,den:1)
    }
    
    func add(f: Fraction) -> Fraction{
        return Fraction(num:self.num*f.den + self.den*f.num, den: self.den*f.den)
    }
    
    func subtract(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den - self.den*f.num,
                        den: self.den*f.den)
    }
    
    func multiply(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.num, den: self.den*f.den)
    }
    
  
    func divide(f: Fraction) -> Fraction {
        return Fraction(num: self.num*f.den, den: self.den*f.num)
    }
    
    static func add(f1: Fraction, to f2: Fraction) -> Fraction {
        return Fraction(num: f1.num*f2.den + f1.den*f2.num,
                        den: f1.den*f2.den)
    }
    
    static func subtract(f1: Fraction, from f2: Fraction) -> Fraction {
        return f2.subtract(f1);
    }
    
    static func multiply(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.multiply(f2)
    }
    
    static func divide(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.divide(f2)
    }
    
    func add(x: Int) -> Fraction {
        return Fraction(num: self.num + self.den*x,
                        den: self.den)
    }
    
    func subtract(x: Int) -> Fraction {
        return Fraction(num: self.num - self.den*x,
                        den: self.den)
    }
    
    func multiply(x: Int) -> Fraction {
        return Fraction(num: self.num*x, den: self.den)
    }
    
    func divide(x: Int) -> Fraction {
        return Fraction(num: self.num, den: self.den*x)
    }
    

    
}

func +(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.add(f2)
}

func -(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.subtract(f2)
}

func *(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.multiply(f2)
}

func /(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.divide(f2)
}
