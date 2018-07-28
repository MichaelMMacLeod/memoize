#lang racket/base

(provide define/memoize)

(define-syntax-rule (define/memoize (name arg ...) body ...)
  (define name
    (let* ([memory (make-hash)]
           [name (lambda (arg ...)
                   (unless (hash-ref memory (list arg ...) #f)
                     (hash-set! memory (list arg ...) (begin body ...)))
                   (hash-ref memory (list arg ...)))])
      name)))

(module+ test
  (require rackunit))

(module+ test
  ;; Tests to be run with raco test
  )

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  )
