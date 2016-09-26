//
//  Array.swift
//  prog4.1
//
//  Created by George Bonnici-Carter on 8/3/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

/**
 Extending the node class to provide it with a method
 for swapping objects between nodes
 */

import Foundation
/**
 An array of objects
 */
class Array<T>: SortableList<T>{
    
    // STORED PROPERTIES
    private var _count: Int;    // Stored property that counts elements in the array
    
    // COMPUTED PROPERTIES
    /**
     Computed property that returns the number of elements in the array - overrides
     LinkedList property to return stored _count property rather than traversing
     the list and coutning the elements.
     - returns: Int Number of items in the array
     */
    override var count: Int {
        return self._count;
    }
    
    // INITIALISERS
    /**
     Designated initialiser for Array - overrides LinkedList initialiser
     in order to initialise the _count stored property
     - parameter list: LinkedList to initialise array with (nil by default)
     */
    override init(list: LinkedList<T>? = nil) {
        self._count = 0;
        super.init(list: list);
    }
    
    override var description: String{
        return "(Array)"+"0->"+super.description+"<-\(self.count-1)";
    }
    
    /**
     Method for indexed square bracket notation that
     wraps the getObject and setObject methods
     - parameter index: Index of the item in the array
     */
    subscript(index: Int) -> T {
        get {
            return self.getObject(index)
        }
        set(newObject) {
            self.setObject(newObject, at: index)
        }
    }
    
    // METHODS
    
    /**
     Adds an object to the array - overrrides LinkedList method
     in order to increment the _count variable when new object
     is added.
     - parameter object: Object to add to the list
     */
    override func addObject(object: T) {
        super.addObject(object);
        self._count += 1
    }
    
    /**
     Removes a node from the array - overrideds LinkedList method
     in order to decrement the _count variable when an node (and object)
     is removed form the list
     - parameter node: Node to remove from the list
     - returns: Bool True if node found in the list and removed,
     false otherwise.
     */
    override func removeNode(node: Node<T>) -> Bool {
        let nodeRemoved: Bool = super.removeNode(node);
        if nodeRemoved {
            self._count -= 1
        }
        return nodeRemoved
    }
    
    /**
     The getObject(index: Int) -> Any method should return
     object at specified index.
     Array can be extended only by using the inherited
     addObject(object: Any) method.
     */
    func getObject(index: Int) -> T{
        assert(index < self.count, "Out of bounds");
        return self.getNodeAtIndex(index)!.object;
    }
    /*
     The setObject(object: Any, at: Int)
     method should place the new object at given index.
     Array can be extended only by using the inherited
     addObject(object: Any) method.
     */
    func setObject(object: T, at: Int){
        assert(at < self.count, "Out of bounds");
        if let node = self.getNodeAtIndex(at){
            self.addObject(object);
            node.swapObjectsWith(self.getNodeAtIndex(self.count-1)!);
            self.removeNode(getNodeAtIndex(self.count-1)!);
        } //else node is nil which should be handled elsewhere?
        
    }
    
}