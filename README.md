memoize
=======

Provides the define/memoize macro. It intercepts and caches the results of its function's calls.

[Memoization](https://en.wikipedia.org/wiki/Memoization)
> An optimization technique used primarily to speed up computer programs by storing the results of expensive function calls and returning the cached result when the same inputs occur again.

```racket
> (define (slow-fibonacci n)
    (if (< n 2)
        n
        (+ (slow-fibonacci (- n 1))
           (slow-fibonacci (- n 2)))))
> (time (slow-fibonacci 30))
cpu time: 83 real time: 83 gc time: 0
832040
> (define/memoize (fast-fibonacci n)
    (if (< n 2)
        n
        (+ (fast-fibonacci (- n 1))
           (fast-fibonacci (- n 2)))))
> (time (fast-fibonacci 30)) ; Each call to fast-fibonacci is cached.
cpu time: 0 real time: 1 gc time: 0
832040
```
