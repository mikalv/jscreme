(assert #t)
(assert (not #f))
(assert (not (not #t)))

(assert (eq? '() '()))
(assert (eq? 1 1))
(assert (eq? 'x 'x))
(assert (not (eq? 0 1)))
(assert (not (eq? 'x 'y)))
(assert (not (eq? '() '(x))))

(assert (= 1 1))
(assert (not (= 1 2)))

(assert (number? 0))
(assert (number? 1))
(assert (not (number? '())))
(assert (not (number? #f)))

;(assert (equal? '() '()))
;(assert (equal? 1 1))
;(assert (equal? 'x 'x))
;(assert (not (equal? 0 1)))
;(assert (not (equal? 'x 'y)))
;(assert (not (equal? '() '(x))))
;(assert (equal? '(1 2 3) '(1 2 3)))
;(assert (not (equal? '(1 2 3) '(1 2 4))))
;(assert (not (equal? '(1 2 3) '(1 2 3 4))))
;(assert (equal? "abc" "abc"))
;(assert (equal? (vector 1 2 3) (vector 1 2 3)))

(assert (null? '()))
(assert (not (null? 0)))
(assert (not (null? "")))
(assert (not (null? '(x))))

(assert (< 0 1))
(assert (< -1 1))
(assert (not (< 1 1)))
(assert (not (< 1 0)))

(assert (eq? (car '(1 . 2)) 1))
(assert (eq? (cdr '(1 . 2)) 2))
(assert (eq? (car (cons 1 2)) 1))
(assert (eq? (cdr (cons 1 2)) 2))
(assert (eq? (cdr '(0)) '()))

(assert (eq? (+) 0))
(assert (eq? (+ 1) 1))
(assert (eq? (+ 1 2) 3))
(assert (eq? (+ 1 2 3) 6))

(assert (eq? (- 1) -1))
(assert (eq? (- 3 1) 2))
(assert (eq? (- 3 1 2) 0))

