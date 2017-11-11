(setq ring-bell-function 'ignore)
;;show line number
;;(global-linum-mode t)

(global-auto-revert-mode t)

;;abbrev mode
(abbrev-mode t)
;;press "space" or "RET" to autocomplete
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("yubao" "YubaoLiu")
					    ("8ms" "Microsoft")
					    ("jimi" "** 意味：")
					    ("jrei" "** 例：")
					    ))
;;add delete selection mode
(delete-selection-mode t)

;;disable auto save
(setq auto-save-default nil)
					;disable auto backup file
(setq make-backup-files nil)


(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;;show ()

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parents."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)



;;; auto-complete
					;Enable  auto-complete
;(require 'auto-complete-config)
;(ac-config-default)
;(require 'auto-complete)
;(global-auto-complete-mode t)

;;start eide
					;(eide-start)

(defun indent-buffer ()
  "Indent the currently visitied buffer."
  (interactive)
  (indent-region (point-min) (point-max))
  )

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if(region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region.")
	  )
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-functions-list '(
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)
(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)


(defun hiden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))


(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

(provide 'init-better-defaults)



