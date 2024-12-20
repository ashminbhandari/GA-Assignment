(defun insert (item sorted)
  (cond
    ((null sorted) (list item)) ; if sorted is empty, which it will be at first, then return a list with just the item 
    ((>= item (car sorted)) (cons item sorted)) ; if item is greater than the first element of the sorted list then we have found the insertion spot, insert it 
    (t (cons (car sorted) (insert item (cdr sorted)))))) ; else recursively run insert again with the item and remaining portion of the sorted list (except 1st element)

(defun insertion-sort (unsorted)
  (let ((sorted '())) 
    (loop while unsorted ; while elements remain in the unsorted list 
          do (setf sorted (insert (pop unsorted) sorted))) ; pop the 1st element out from the unsorted list and insert it into the new sorted list 
    sorted))

(print(reverse(insertion-sort '(101 1 2 10 9 55 1 2 3 5 8 7 6 1999 11)))) ; needs to be reversed because of descending order


#|

a.	While insertion sort is in progress, we track 2 lists: the sorted items and the unsorted items. 
(Hint: what should these look like when the process starts and when the process ends? 
Can we use that information to decide termination?)

Answer - The sorted items list will be empty at first while unsorted items will contain the entire input list. Once the process ends, the opposite will be true.
Yes, we can use that information to decide termination. Function terminates once the unsorted list is empty.

|#

#|

b.	In each pass we start with two lists. At the end of the pass, we would have moved one more item from the sorted to the unsorted list. 
When is this process trivially accomplished? What will the recursive call look like?

Answer - This process will be trivially accomplished when the item from the unsorted list is greater than the first element of the sorted list. 
Moreover, it will also be trivially accomplished if we are processing our first ever element then it can directly be inserted into the sorted list.  

The exit condition of the recursive call will check if the above two trivial conditions are true. If not, insert will be called again recursively with the item to be inserted 
and the remaining portion of the sorted list (except 1st element).

For example,

item = 13 
sorted = 19 10 4

1. check if 13 >= 19 -> not true so,
2. recurse with insert (13 (10 4)) keeping the first element 19 aside for later concatenation 
3. check if 13 >= 19 -> true so insert here, the resulting list is (13 10 4) 
4. recursion from line 2 returns and is combined with 19 resulting in the list 19 13 10 4 

|#

#|

c.	Moving requires an operation that can insert an item into a sorted list. 
To make this actually mimic the array-based algorithm efficiently, we will maintain the sorted list in descending order. 
Again, to represent this insertion process, we need to track the items that have been examined, the item to be inserted, and the items yet to be examined. 
There are two ways in which the process can terminate – what are they?        

Answer - We can terminate once the unsorted list is now empty or the reverse of that (sorted is full). 
In the below implementation, items that have been examined were not tracked, instead they were simply popped off the unsorted list which is O(1) operation.
|#




