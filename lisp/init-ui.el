;;config the default behaviour
;disable tool-bar minor mode
(tool-bar-mode -1)
;disable scroll bar
(scroll-bar-mode -1)
(setq cursor-type 'bar)


;disable the start up help window
(setq inhibit-startup-message t)

;;full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(setq-default cursor-type 'bar)


;;highlight the current line
;(global-hl-line-mode t)


(provide 'init-ui)
