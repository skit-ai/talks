#lang racket/base
(require racket)

;; CALL/CC

;; Short demo on continuations and call/cc

;; continuations
;; stuff left to compute. run-time concept.

;; CPS js example

(+ 1 (* 2 3))

;; 2 * 3 = r
;; r + 1

(let ((cont #f))
  (call/cc (lambda (k) (set! cont k)))
  cont)

(display "abhinav tushar is sleepy")

(display
 (call/cc (lambda (cc)
            (display "I got here.\n")
            (cc "This string was passed to the continuation.\n")
            (display "But not here.\n"))))

(+ 1 (call/cc (lambda (k) k 1)))

;;; JUMPS
;; 0 -> 9

while True:
   if n == 1:
      print(done)
      break
   else:
      print("hello")
contine

(let ((cont #f))
  (call/cc (lambda (k) (set! cont k)))

  (if (= (random 10) 1)
      (begin
        (display "done")
        (set! cont void))
      (display "hello\n"))

  (cont "manchanda"))

;;; RETURN

(define (find-multiple factor)
  (call/cc (lambda (return)
             (for ([num (shuffle (range 200))])
               (when (zero? (modulo num factor))
                 (return num))))))

(find-multiple 43)

;;; EXCEPTIONS

; current-continuation : -> continuation
(define (current-continuation)
  (call-with-current-continuation
   (lambda (cc)
     (cc cc))))

; exception-stack : list[continuation]
(define exception-stack '())

; (try exp ... catch catch-procedure) runs
; exp ..., and invokes catch-procedure with
; the value passed to throw.
(define-syntax try
  (syntax-rules (catch)
    ((_ exp ... catch proc)
     ; =>
     (let ((cc (current-continuation)))
       (cond
         ((procedure? cc)
          (dynamic-wind
           (lambda ()
             (set! exception-stack (cons cc exception-stack)))
           (lambda ()
             exp ...)
           (lambda ()
             (set! exception-stack (cdr exception-stack)))))

         ((pair? cc)
          (proc (cadr cc))))))))

(define (throw exception-value)
  (let ((handler (car exception-stack)))
    (handler (list 'exception exception-value))))

; Example:
(try (begin
       (display "stuff")
       (throw 'foo))
     catch
     (lambda (exn)
       (display "got inner exception: ")
       (display exn)
       (newline)))
