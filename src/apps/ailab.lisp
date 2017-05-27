;; ailab.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (asdf:load-system :swank-client)
  (asdf:oos 'asdf:load-op 'unix-options)
  (use-package 'unix-options)
  (use-package :sb-thread)

  (load-shared-object "libgfortran.so.3.0.0")
  (load-shared-object "libfftw.so.2.0.7")
 ;(load-shared-object "librad.so")
  (load-shared-object (concatenate 'string (sb-posix:getcwd) "/submodules/librad/.libs/librad.so"))
  (sb-alien:define-alien-routine ("test" test) void)

  (setf swank::*swank-debug-p* nil)
; (setf swank::*load-verbose* nil)
; (setf swank::*compile-verbose* nil)                                                                                                     a
  (defun cd (path) (sb-posix:chdir path))
  (defun pwd () (sb-posix:getcwd))
  (defun exec (cmd args) (sb-ext:run-program cmd args :output t))

  (defun swank-server (port) 
    (swank-loader:init)
    (swank:create-server :port port :dont-close t)
  )

  (defun repl () 
    (format t "~a" ">< ")
    (finish-output *standard-output*)
    (loop (let ( (result (eval (read))) ) 
      (format t "~a~%>< " result)
      (finish-output *standard-output*)
    ))
  )

  (defun main ()
   ;(let ((*debugger-hook* #'debug-fn))
   ;  (with-cli-options ((uiop:raw-command-line-arguments))
   ;    (x &parameters a &free other)
   ;    (cond 
   ;      ((eq a "abc") (format t "[X A]: ~a~% " (list x a)))
   ;      (            (format t "[X A]: ~a~% " "nothing"))
   ;    )
        (make-thread 'swank-server :arguments '4005)
        (repl)
   ;  ); with-cli-options
   ;) ; let
  ); defun

;; *EOF*
