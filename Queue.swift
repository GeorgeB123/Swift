//
//  Queue.swift
//  prog4.1
//
//  Created by George Bonnici-Carter on 8/3/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//



import Foundation
/**
 A queue of objects
 
 */
class Queue<T> : LinkedList<T> {
    
    /**
     Queue desription - adds a string indicating the
     container is a queue before invoking super's description
     
     - returns: String String representation of the queue
     */
    override var description: String {
        return "(Queue)<--"+super.description+"<--"
    }
    
    override init(list: LinkedList<T>? = nil) {
        super.init(list: list)
    }
    
    /**
     Puts an an object at the end of the queue
     
     - parameter object: Object to put in the queue.
     */
    func put(object: T) {
        // Use inherited method to add object
        // to the list
        self.addObject(object);
    }
    
    /**
     Gets an an object from the start of the queue
     
     - returns: T? Object removed from the start of the queue,
     nil if queue is empy.
     */
    func get() -> T? {
        // If head points to a non-nil node,
        // remove that node and return its
        // object
        if let n = head {
            //Use inherited method to remove
            //node from the list
            self.removeNode(n)
            return n.object
        } else {
            return nil
        }
    }
}