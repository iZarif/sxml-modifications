(import test)

(define-syntax xtest-assert
  (syntax-rules ()
    ((_ ?expected ?selector ?param ...)
     (test ?expected (?selector ?param ...)))))

(define cout void)                      ; Screw this
(define nl #f)

(import (rename (prefix sxml-modifications sxmlm:)
             (sxmlm:delete modif:delete)
             (sxmlm:delete-undeep modif:delete-undeep)
             (sxmlm:insert-preceding modif:insert-preceding)
             (sxmlm:insert-following modif:insert-following)
             (sxmlm:insert-into modif:insert-into)
             (sxmlm:rename modif:rename)
             (sxmlm:modify sxml:modify)
             (sxmlm:modify! sxml:modify!)))

(test-group "sxml-modifications"
  (include "vmodif.scm"))
(test-exit)