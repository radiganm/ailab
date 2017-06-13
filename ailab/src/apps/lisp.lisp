;; lisp.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (asdf:load-system :swank-client)
  (asdf:oos 'asdf:load-op 'unix-options)
  (use-package 'unix-options)
  (use-package :sb-thread)

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
    (make-thread 'swank-server :arguments '4005)
    (repl)
  )
  
;; *EOF*
