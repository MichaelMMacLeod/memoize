#lang racket/base

(provide define/memoize)
  
(define-syntax-rule (define/memoize (name arg) body)
  (define name
    (let* ([memory (make-hash)]
           [name (lambda (arg)
                   (unless (hash-ref memory arg #f)
                     (hash-set! memory arg body))
                   (hash-ref memory arg))])
      name)))

(module+ test
  (require rackunit))

(module+ test
  ;; Tests to be run with raco test
  )

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  )
