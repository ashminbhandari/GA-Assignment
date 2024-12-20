(defun partition (numbers)
  (cond 
    ((null numbers) '())
    ((null (cdr numbers)) 
     (list (list (car numbers))))
    (t
     (cond
       ((< (car numbers) (cadr numbers))
        (cons (list (car numbers) (cadr numbers))
              (partition (cddr numbers))))
       (t
        (cons (list (cadr numbers) (car numbers))
              (partition (cddr numbers))))))))


(defun merge-adjacent (lls)
  (cond
    ((null lls) '())
    ((null (cdr lls)) lls)
    (t
     (merge-adjacent (cons (merge-two (car lls) (cadr lls))
           (merge-adjacent (cddr lls)))))))

(defun merge-two (l1 l2)
  (cond 
    ((null l1) l2)
    ((null l2) l1)
    ((> (car l1) (car l2))
     (cons (car l2) (merge-two l1 (cdr l2))))
    (t
     (cons (car l1) (merge-two (cdr l1) l2)))))
  

(print (car(merge-adjacent(partition '(99 1 101 8 3 9 1 8 99 101 77 6 4 99 8 1000 10101 1 0 3 2 3 479 43 44)))))

