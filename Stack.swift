//
//  Stack.swift
//  prog4.1
//
//  Created by George Bonnici-Carter on 8/3/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

import Foundation

/**
 A Stack of objects
 
 */
class Stack<T>: LinkedList<T> {
    
    override init(list: LinkedList<T>? = nil){
        super.init(list: list);
    }
    
    override var description: String{
        return "(Stack)"+super.description+"<-->";
    }
    
    func push(object: T) {
        self.addObject(object);
    }
    
    func pop() -> T? {
        // If head points to a non-nil node,
        // remove that node and return its
        // object
        if let n = tail {
            //Use inherited method to remove
            //node from the list
            self.removeNode(n)
            return n.object
        } else {
            return nil
        }
    }
}