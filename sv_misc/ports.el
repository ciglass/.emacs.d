(defun sv-port-toggle-helper ()
  "Toggle a System Verilog port on the current line between being an input and input."
  (save-excursion
    (let ((this-line (thing-at-point 'line t))
          (leading-text)
          (port-type)
          (new-port-type)
          (trailing-text))
      (let ((m (string-match "\\(.*\\)\\(input\\|output\\)\\(.*\\)" this-line)))
        (when m
          (setq leading-text (match-string 1 this-line)
                port-type (match-string 2 this-line)
                trailing-text (match-string 3 this-line))
          (cond
           ((string-equal port-type "output")
            (setq new-port-type "input"))
           ((string-equal port-type "input")
            (setq new-port-type "output")))
          (kill-whole-line)
          (insert (format "%s%s%s\n" leading-text new-port-type trailing-text)))))))

(defun sv-port-toggle-line ()
  "Toggle a System Verilog port on the current line between being an input and output."
  ;;
  (interactive)
  (sv-port-toggle-helper)
  ;; I find this convenient, but it may get slow for big files
  ;; This is to help get around the fact that output and input have a different number of characters
  (electric-verilog-tab))

(defun sv-port-toggle-region (begin end)
  "Toggle all the system verilog ports on the lines in the region between output and input.
If any part of a line is contained within the region, that line's port direction will be toggled.

Note: The behavior is inconsistent when the end of the region is the beginning of a line.
Sometimes the line is toggled, sometimes it isn't. It doesn't seem worth it to fix since the workaround is easy."
  (interactive "r")
  (save-excursion
    (goto-char begin)
    (while (<= (point) end)
      (sv-port-toggle-helper)
      (next-line)
      (beginning-of-line))
    ;; I find this convenient, but it may get slow for big files
    ;; This is to help get around the fact that output and input have a different number of characters
    (electric-verilog-tab)))
