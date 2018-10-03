(define (gauss n)
  (write (/ (* n (+ n 1)) 2)) (newline)
  (define x (read))
  (if (equal? x 'exit)
      (exit)
      (if (< x 0)
          ((write "Numbers must be positives!") (newline) (in))
          (gauss x)
          )
      )
  )

(define (in)
  (define x (read))
  (if (>= x 0)
    (gauss x)
    ((write "Numbers must be positives!") (newline) (in))
    )
  )

(in)



