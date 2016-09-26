//
//  SortableList.swift
//  prog4.1
//
//  Created by George Bonnici-Carter on 8/3/16.
//  Copyright © 2016 George Bonnici-Carter. All rights reserved.
//

/**
 Extending the node class to provide it with a method
 for swapping objects between nodes
 */
extension Node {
    
    /**
     Swaps objects between self and another node nodes - useful for
     sorting - instead of swapping and relinking the nodes, it's easier
     to leave the nodes where they are, and just swap their
     objects
     
     - parameter n Node to swap objects with
     */
    func swapObjectsWith(n: Node<T>) {
        let temp: T = self.object
        self.object = n.object
        n.object = temp
    }
}


class SortableList<T> : LinkedList<T> {
    
    override init(list: LinkedList<T>? = nil) {
        super.init(list: list)
    }
    
    /**
     Get the Nth node from the LinkedList
     
     - parameter index: Index of the node to Get
     - returns: Node? The node at the specified index, or nil
     if index exceeds list count
     */
    func getNodeAtIndex(index: Int) -> Node<T>? {
        var node: Node<T>? = head;
        // Walk through the list until the
        // specified index
        if index > 0 {
            for _ in 1...index {
                if let n = node {
                    node = n.next;
                } else {
                    // Exit early if index
                    // exceeds number of
                    // items on the list
                    return nil;
                }
            }
        }
        return node;
    }
    
    /**
     Sort the list using the provided compare function
     
     - parameter isObject: A function that compares two objects and
     returns true if the first one is smaller than the second one
     
     */
    func sort(isObject: (T, smallerThan: T) -> Bool) {
        
        while true {
            var swap: Bool = false;
            
            var nodeLeft: Node<T>? = head
            
            // Walk through the nodes in the list
            while let nLeft = nodeLeft  {
                // Get the next node in the list
                if let nRight = nLeft.next {
                    // Invoked the function that got passed
                    // in as a parameter to check if the
                    // object that follows the current one
                    // on the list is smaller - if yes,
                    // then swap the object of the two nodes
                    if(isObject(nRight.object, smallerThan: nLeft.object)) {
                        nLeft.swapObjectsWith(nRight)
                        swap = true
                    }
                }
                nodeLeft = nLeft.next
            }
            
            // Check if anything got swapped in this
            // pass through the entire list - if not,
            // then the entire list has been completely
            // sorted
            if !swap {
                break;
            }
        }
    }
    
}
