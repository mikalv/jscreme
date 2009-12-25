(define (display-to-string x)
  (call-with-output-string (lambda (port) (display x port))))

(load "compiler.scm")

(define (read-file name)
  (call-with-input-file name
    (lambda (port)
      (letrec ((recur (lambda ()
			(let ((expr (read port)))
			  (if (eof-object? expr)
			      '()
			      (cons expr (recur)))))))
	(recur)))))

(load "toplevel.scm")
(load "toplevel-compile.scm")

(define (compile-toplevels exprs)
  (fold-left string-append "" (map (lambda (x) (toplevel-compile x read-file)) exprs)))

(let ((toplevels '((load "primitives.scm")
		   (load "compiler.scm")
		   (load "reader.scm")
		   (load "toplevel.scm")
		   (load "eval.scm")
		   (load "toplevel-compile.scm")
		   (load "repl.scm")
		   (load "tests.scm"))))
  (call-with-output-file "jscreme.js"
    (lambda (port)
      (display (compile-toplevels toplevels)
	       port)
      (for-each (lambda (expr)
		  (display (toplevel-process expr read-file
					     (lambda (name value-expr)
					       (string-append (compile `(add-toplevel-macro ',name ,value-expr)
								       *toplevel-bindings*)
							      ";\n"))
					     (lambda (name value-expr)
					       (let* ((add-expr `(add-toplevel-binding ',name ,(jsify-symbol name))))
						 (string-append (compile add-expr *toplevel-bindings*) ";\n")))
					     (lambda (expr)
					       "")
					     (lambda (results)
					       (fold-left string-append "" results)))
			   port))
		toplevels))))
