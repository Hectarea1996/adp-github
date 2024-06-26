
(in-package #:adpgh)


(defun shortest-string (strings)
  "Return the shortest string from a list."
  (declare (type list strings))
  (loop for str in strings
	for shortest = str then (if (< (length str) (length shortest))
				    str
				    shortest)
	finally (return shortest)))

(defun convert-string-case (str)
  (case *print-case*
    (:upcase (string-upcase str))
    (:downcase (string-downcase str))
    (:capitalize (string-capitalize str))
    (t str)))

(defun custom-symbol-pprint-function (stream sym)
  "Return a custom pprint function to print symbols."
  (let* ((sym-package (symbol-package sym))
	 (nickname (and sym-package
			(shortest-string (package-nicknames sym-package))))
	 (print-package-mode (and sym-package
				  (not (equal sym-package (find-package "CL")))
				  (nth-value 1 (find-symbol (symbol-name sym) sym-package))))
	 (package-to-print (and print-package-mode
				(or nickname
				    (and (keywordp sym) "")
				    (package-name sym-package))))
	 (*print-escape* nil))
    (case print-package-mode
      (:external (format stream "~a:~a"
			 (convert-string-case package-to-print)
			 (convert-string-case (symbol-name sym))))
      (t (format stream "~a" (convert-string-case (symbol-name sym)))))))

(defun make-custom-pprint-dispatch ()
  (let ((custom-pprint-dispatch (copy-pprint-dispatch)))    
    (set-pprint-dispatch 'symbol #'custom-symbol-pprint-function 0 custom-pprint-dispatch)
    (values custom-pprint-dispatch)))


(defvar *adp-pprint-dispatch* (make-custom-pprint-dispatch))


(defun argument-symbol-pprint-function (stream sym)
  (when (keywordp sym)
    (princ ":" stream))
  (princ (convert-string-case (symbol-name sym)) stream))

(defun make-argument-pprint-dispatch ()
  (let ((argument-pprint-dispatch (copy-pprint-dispatch)))    
    (set-pprint-dispatch 'symbol #'argument-symbol-pprint-function 0 argument-pprint-dispatch)
    (values argument-pprint-dispatch)))

(defvar *argument-pprint-dispatch* (make-argument-pprint-dispatch))
