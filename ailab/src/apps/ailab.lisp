;; ailab.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (asdf:load-system :swank-client)
  (asdf:oos 'asdf:load-op 'unix-options)
  (use-package 'unix-options)
  (use-package :sb-thread)

  (load-shared-object "libgfortran.so.3.0.0")
  (load-shared-object "libfftw3.so")
  (load-shared-object "libanl.so")
  (load-shared-object "libblas.so")
  (load-shared-object "/opt/local/lib/librad.so")
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
    (format *error-output* "~a" ">< ")
    (finish-output *error-output*)
    (loop (let ( (result (eval (read))) ) 
      (format *error-output* "~a~%>< " result)
      (finish-output *error-output*)
    ))
  )

  (defun main ()
   ;(let ((*debugger-hook* #'debug-fn))
   ;  (with-cli-options ((uiop:raw-command-line-arguments))
   ;    (x &parameters a &free other)
   ;    (cond 
   ;      ((eq a "abc") (format *error-output* "[X A]: ~a~% " (list x a)))
   ;      (            (format *error-output* "[X A]: ~a~% " "nothing"))
   ;    )
        (make-thread 'swank-server :arguments '4005)
        (repl)
   ;  ); with-cli-options
   ;) ; let
  ); defun

;; *EOF*
