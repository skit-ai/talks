(defpackage #:clos-talk
  (:use #:cl))

(in-package #:clos-talk)

(defclass animal ()
  ((name)
   (legs)))

(defclass dog (animal)
  ())

(setf an (make-instance 'animal))
(setf dg (make-instance 'dog))

(unintern 'speak)
(defgeneric speak (a b))

(defmethod speak ((an animal) (what string))
  (print "i am an animal")
  (print what)
  (call-next-method))

(defmethod speak ((an animal) (what (eql 12)))
  (print "twelve"))

(speak an 12)

(defmethod speak (a b)
  (print "fallback"))

(defmethod speak :before (a b)
  (print "before speaking"))

(defmethod speak :after (a b)
  (print "after speaking"))

(speak an "erer")
(speak an 1)
(speak dg "sdsd")
