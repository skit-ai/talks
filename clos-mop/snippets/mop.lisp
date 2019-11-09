(ql:quickload :closer-mop)

(defpackage #:clos-talk
  (:use #:cl))

(in-package #:clos-talk)

;;; Logging while class creation

(defclass logged-class (standard-class)
  ()
  (:documentation "A metaclass which logs creation of classes"))

(defmethod closer-mop:validate-superclass ((class logged-class) (superclass standard-class))
  t)

(setf count-ere 0)
(defmethod initialize-instance :after ((cls logged-class) &key &allow-other-keys)
  (print "created class")
  (print count-ere)
  (incf count-ere))

;; TODO: Do a :before :after, increment count slot in logged-class

(unintern 'new-class)

(defclass new-class ()
  ((a :initarg :a))
  (:metaclass logged-class))

(defmethod closer-mop:compute-class-precedence-list ((class logged-class))
  (let ((output (call-next-method)))
    (print output)
    output))

;;; ---------

;; Reversed CPL

(defclass rcpl-class (standard-class)
  ()
  (:documentation "Meta for class with reversed cpl."))

(defmethod closer-mop:validate-superclass ((class rcpl-class) (superclass standard-class))
  t)

(defmethod closer-mop:compute-class-precedence-list ((class rcpl-class))
  (reverse (call-next-method)))

(defclass class-a () ((value :initform "a")))
(defclass class-b () ((value :initform "b")))

(unintern 'class-child)

(defclass class-child (class-a class-b)
  ()
  (:metaclass rcpl-class))

(let ((x (make-instance 'class-child)))
  (slot-value x 'value))

;;; ---------

(defclass that-generic-function (standard-generic-function)
  ())

(unintern 'that-generic-function)

(defmethod sb-pcl:compute-applicable-methods :before ((fn that-generic-function) arguments)
  (print "rere"))

(defmethod sb-pcl:compute-applicable-methods ((fn that-generic-function) arguments)
  (print "hello")
  (let ((output (call-next-method)))
    (print output)
    output))

(defgeneric something (obj)
  (:generic-function-class that-generic-function)
  (:method-class standard-method))
