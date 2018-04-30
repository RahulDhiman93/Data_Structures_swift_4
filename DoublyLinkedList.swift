
// Basic NOde
class LLNode<T> {
    var key: T?
    var next: LLNode?
    var previous: LLNode?
}

// By using optionals

func printAllKeys() {
    var current: LLNode! = head;
    //assign the next instance
    while (current != nil) {
        println("link item is: \(current.key)")
        current = current.next
    }
}

// Adding Links

public class LinkedList<T: Equatable> {
    
    //create a new LLNode instance
    private var head: LLNode<T> = LLNode<T>()
    
    //append a new item to a linked list
    func addLink(key: T) {
        //establish the head node
        if (head.key == nil) {
            head.key = key;
            return;
        }
        //establish the iteration variables
        var current: LLNode? = head
        while (current != nil) {
            if (current?.next == nil) {
                var childToUse: LLNode = LLNode<T>()
                childToUse.key = key;
                childToUse.previous = current
                current!.next = childToUse;
                break;
            }
            current = current?.next
        } //end while
} ///end function

// Removing Links

    func removeLinkAtIndex(index: Int) {
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        //determine if the removal is at the head
        if (index == 0) {
            current = current?.next
            head = current!
            return
        }
        
        //iterate through the remaining items
        while (current != nil) {
            if (listIndex == index) {
                //redirect the trailer and next pointers
                trailer!.next = current?.next
                current = nil
                break;
            }
            
            //update the assignments
            trailer = current
            current = current?.next
            listIndex++
        } //end while
} //end function

// Counting Links

    var count: Int {
        if (head.key == nil) {
            return 0
        }
        else {
            var current: LLNode = head
            var x: Int = 1
            
            //cycle through the list of items
            while ((current.next) != nil) {
                current = current.next!;
                x++
            }
            return x
        }
} //end property


// 

