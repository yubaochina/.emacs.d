
(global-set-key (kbd "C-e") 'move-end-of-line)

;(global-set-key (kbd "C-c C-,") 'org-insert-structure-template)

;;http://zhangley.com/article/emacs-ret/, donot band C-m to set-mark-command, because C-m is linked with <RET> key
;(global-set-key (kbd "C-M-@") 'set-mark-command)

;(global-set-key (kbd "C-n") 'next-line)
;(global-set-key (kbd "C-p") 'previous-line)

;;uncomment this statement if u want to use shortcut key
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;;resize window
;(global-set-key (kbd "C-c-<up>") 'shrink-window)
;(global-set-key (kbd "C-c-down") 'enlarge-window)
;(global-set-key (kbd "Cleft") 'shrink-window-horizontally)
;(global-set-key (kbd "C-c-right>") 'enlarge-window-horizontally)

(provide 'init-keybinding)

