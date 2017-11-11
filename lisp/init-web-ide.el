
;;configure for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
auto-mode-alist))

;(defun my-web-mode-indent-setup
;    (setq web-mode-markup-indent-offset 2)
 ; (setq web-mode-css-at-rules 2)
;    (setq web-mode-code-indent-offset 2))


(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(provide 'init-web-ide)
