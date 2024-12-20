;;; implementation details 
;;; given a list such as (9 100 1 2 7 5 6 101 2 4 5 21 111 1 0 1)
;;; we first convert to a list of lists ((9) (100) (1) (2) ...) 
;;; then for each pair from the list of lists we begin merging 
;;; for example, after first pass result is ((9 100) (1 2) (5 7) (6 101) ...)
;;; again take two pairs from the list of lists and merge them making the result ((1 2 9 100) (5 7 6 101) ...)
;;; eventually we will end up with 1 single list 


(defun merge-lists (lls)
  (loop for (l1 l2) on lls by #'cddr ; take a pair from the list of lists (lls) and merge using the merge-two function
    collect (merge-two l1 l2)) ; collect the merged pairs into a new list
)
        

(defun merge-two (l1 l2)
  (loop until (or (null l1) (null l2)) ; loop until 1 of the lists to be merged is not empty
        if (<= (car l1) (car l2)) 
          collect (pop l1) into merged ; pop the smaller element and collect into the new merged list
        else
          collect (pop l2) into merged
        finally (return (append merged l1 l2))) 
)

(defun run(l)
    (let ((lls (mapcar (lambda (x) (list x)) l))) ; convert list of numbers into list of lists 1 2 3 will become (1) (2) (3)
    (loop while (cdr lls) ; loop will keep running until a single list remains 
          do (setf lls (merge-lists lls)))
    (car lls))
) 

(print (run '(9 100 1 2 7 5 6 101 2 4 5 21 111 1 0 1 9)))
