;;;; uebung 2 
;;; insert tree val
;; value is added to the tree

(defun insert (tree val)
    (cond ((null tree) (list val nil nil))
          ((eql val (first tree))  tree)
          ((< val (first tree)) (list (first tree) (insert (second tree) val) (third tree)))
          (t (list (first tree) (second tree) (insert (third tree) val)))
    )
)

;; insert from file
;; value is added from file into tree
(defun read-file (filename)
    (with-open-file(stream filename) ...)) ;; TBD

;; contains tree val
;; checks if value exists in tree
(defun contains (tree val)
  (if (endp tree) nil
  (or (equal val (first tree))
  (or (contains (second tree) val) (contains (third tree) val))))
)

;;size tree
;; returnes the size of the three
(defun size (tree)
  (cond ((null tree) 0)
        ((listp (first tree)) (+ (size (first tree)) (size (rest tree))))
        (T (+ 1 (size (rest tree))))
  )
)

;;height tree
;; returns the height of a tree
(defun height (tree)
  (if (endp tree)
    0
    (+ 1 (max (height (second tree)) (height (third tree))))
  )
)

;;getMax tree
;; returns the hightest value from the tree
(defun getMax (tree)
  (cond 
	((equal nil (third tree)) tree)
	(T (getMax (third tree)))
	)
)

;;getMin tree
;; returns the min value from the tree

(defun getMin (tree)
    (cond
      ((equal nil (second tree)) tree)
      (T (getMin (second tree)))
    )
)

;; isEmpty tree
;; returns true if the tree is empty

(defun isEmpty (tree)
  (if (null tree) T NIL)
)

;; addAll
;; adds a tree into another tree
(defun addAll (tree otherTree)
    (cond
      ((null otherTree) tree)
      ((null tree) otherTree)
      (t
        (setq tree (insert tree (first otherTree)))
        (setq tree (addAll tree (second  otherTree)))
        (setq tree (addAll tree (third otherTree)))
      )
    )
)

;; print levelorder
;; prints the levelorder fom the tree
(defun currentLevel (tree level)
    (if (endp tree)
    0
    (cond ((= 1 level)  (list (first tree)))
        ((append (currentLevel (second tree) (1- level))
        (currentLevel (third tree) (1- level))))
    )
    )
)
    
(defun printLevelorder (tree)
    (setq h (height tree))
    (setq i 1)
    (setq r (list (first tree)))
    (loop
    (setq i  (+ i 1))
    (setq r (append r (currentLevel tree i)))
    (when (= i h) (return r))
    )
)

;; remove 
;; removes a node from the tree


;; tree for test purposes '(1 (2 (3 4))(5(6)))

(setq tree '(5(3 (1) (4))(8 (7) (9))))

(insert tree 9)
