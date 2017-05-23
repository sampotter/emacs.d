;;; Commentary:

;;; Code:

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun followed-by (cases)
  (cond ((null cases) nil)
        ((assq (car cases) 
               (cdr (memq c-syntactic-element c-syntactic-context))) t)
        (t (followed-by (cdr cases)))))

(setq load-path
      (append (list "~/Build/cc-mode-cc-mode")
              load-path))

(c-add-style
 "sfp"
 '((c-offsets-alist
	(innamespace . (lambda (x)
					 (if (followed-by '(innamespace namespace-close))
						 0
					   '+))))))

(setq c-default-style "sfp")

(provide 'sfp-cc-mode)
;;; sfp-cc-mode.el ends here
