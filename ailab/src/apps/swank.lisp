;; swank.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (require 'asdf)
  (asdf:operate 'asdf:load-op 'swank-client)
; (ql:quickload :swank-client)

  (defun swank-client () 
    (defvar *myswank* (swank-client:slime-connect "127.0.0.1" 4005))
    (format *error-output* "type (hup) to quit~%")
    (format *error-output* "~a" ">< ")
    (finish-output *error-output*)
    (loop 
      (let ((line (read)))
        (cond 
          ( (not (equalp line "(hup)"))
            (unwind-protect (restart-case (progn
              (let ( (result (swank-client:slime-eval line *myswank*)) )
                (progn
                  (format *error-output* "~a~%>< " result)
                  (finish-output *error-output*)
                )
              )
            ))) ; protect
          ) ; "hup"
          (t 
            (progn
              (format *error-output* "~a~%" "exiting")
              (finish-output *error-output*)
              (SB-EXT:QUIT)
            ) ; progn
          ) ; t
        ) ; if
      ) ; let
    ) ; loop
  ) ; repl

  (defun main () 
    (swank-client)
  )

;; *EOF*
