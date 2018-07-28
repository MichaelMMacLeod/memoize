#lang racket/base

(provide define/memoize)

(define-syntax define/memoize
  (syntax-rules ()
    [(define/memoize (name args ...) body ...)
     (define name
       (let* ([memory (make-hash)]
              [name (lambda (args ...)
                      (unless (hash-ref memory (list args ...) #f)
                        (hash-set! memory (list args ...) (begin body ...)))
                      (hash-ref memory (list args ...)))])
         name))]
    [(define/memoize (name args ... . rest) body ...)
     (define name
       (let* ([memory (make-hash)]
              [name (lambda (args ... rest)
                      (unless (hash-ref memory (args ... rest) #f)
                        (hash-set! memory (args ... rest) (begin body ...)))
                      (hash-ref memory (args ... rest)))])
         name))]))

(define/memoize (f a b c . xs)
  (sleep 1)
  (apply * (append (list a b c)
                   xs)))

(module+ test
  (require rackunit))

(module+ test
  ;; Tests to be run with raco test
  )

(module+ main
  ;; Main entry point, executed when run with the `racket` executable or DrRacket.
  )
