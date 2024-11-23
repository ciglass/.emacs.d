;; Simple wrapper around call-process indended to be called from an AUTOINSERTLISP. Inspired by:
;; https://stackoverflow.com/questions/23299314/finding-the-exit-code-of-a-shell-command-in-elisp
;; See py_insert_test.v for an example

(defun insert-from-shell (PROGRAM &rest ARGS)
  "Run PROGRAM with ARGS and return the exit code and output in a list."
  (apply 'call-process PROGRAM nil (current-buffer) nil ARGS))

;; This was an attempt to capture the exit code and flag to the user, but it wasn't working properly
;; (defun insert-from-shell (program &rest args)
;;   "Run PROGRAM with ARGS and return the exit code and output in a list."
;;   (let* ((process-outs (list (apply 'call-process program nil (current-buffer) nil args)
;;                              (buffer-string)))
;;          (exit-code (nth 0 process-outs))
;;          (outputs (nth 1 process-outs)))
;;     (if (= exit-code 0)
;;         (progn
;;           (message "In the exit-code 0 body")
;;           (concat outputs))
;;       (concat "ERROR:\n" outputs))))
  
