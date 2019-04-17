(module sxml-modifications
  (modify modify! delete delete-undeep rename
   insert-into insert-preceding insert-following)

(import (chicken base) scheme)

(import xpath-parser sxpath-lolevel context-sxpath-lolevel ddo-sxpath-lolevel)

(import (only srfi-1 filter))

(define nl (string #\newline))
(define (cerr . args)
  (for-each (lambda (x)
              (if (procedure? x) (x (current-error-port)) (display x (current-error-port))))
            args))

(include "modif.scm")

;; Change this to raise an error
(set! sxml:modification-error
      (lambda text
        (apply error "Modification error: " text)))

(define modify sxml:modify)
(define modify! sxml:modify!)
(define insert-following modif:insert-following)
(define insert-preceding modif:insert-preceding)
(define insert-into modif:insert-into)
(define delete modif:delete)
(define delete-undeep modif:delete-undeep)
(define rename modif:rename))