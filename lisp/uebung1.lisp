;;;;Lisp Übung 1 Josip Grabant
;;;1a
;; rotate
(defun rotiere (los)
    (append (rest los)(list(first los))))
			  
;;; 1b
;; inserts a item next to last 
(defun neue-vorletzte (x los)
    (setq sol (reverse los))
    (reverse(append(list (first sol) x)(rest sol))))
				   
;;(defun my-length '(one two three four)) --> 4
;; 1c
;; returns the length of a list
(defun my-length (los)
    (if los
        (+ 1 (my-length(rest los)))
     0))
				
(defun my-length (los)
	(cond
		((null los) 0)
		(T (+ 1 (my-length(rest los))))))

;;; 1d nested list
;; inputs a list with nested lists and returns the total amount of atoms
(defun my-lengthR (los)
    (if (null los)
    0
    (if (listp (first los))
        (+ (my-lengthR(first los))(my-lengthR(rest los)))
        (+ 1 (my-lengthR (rest los))))))

;;; 1e 
;; returns the reversed list
(defun my-reverse (los)
    (if (null los)
    '()
    (append (my-reverse(rest los))(list(first los)))))

;;; 1f
;; returns a reversed nested list
(defun my-reverseR (los)
    (if (null los)
    '()
        (if (listp (first los))
            (append (my-reverseR(rest los))(list (my-reverseR (first los))))
            (append (my-reverseR(rest los))(list (first los))))))

;; binary tree

#|(list (root (leftChild(leftLeftChild) (leftRightChild))(rightChild(rightLeftChild)(rightRightChild))))
       root
    /       \
   LC        RC
  /  \       / \
 LLC  LRC  RLC  RLC
 |#


;; preorder
(defun preorder(los) (print (first los))
  (if (second los)(preorder (second los)))
  (if (third los)(preorder (third los))))



;, inorder
(defun inorder(los)
  (if (second los)(inorder (second los)))
  (print (first los))
  (if (third los)(inorder (third los))))



;, postorder
(defun postorder(los)
  (if (second los)(postorder (second los)))
  (if (third los)(postorder (third los)))
  (print (first los)))

;;the end
	