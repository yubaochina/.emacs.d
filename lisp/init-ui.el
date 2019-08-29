;;load theme
(load-theme 'monokai t)

;;solarized
;(add-to-list 'custom-theme-load-path "~/.emacs.d/packages/solarized")
(add-to-list 'load-path "~/.emacs.d/packages/solarized")
;(require 'color-theme-solarized)
;(load-theme 'solarized t)

(global-visual-line-mode 1)
(setq word-wrap t)

(global-hl-line-mode)
(global-linum-mode t)

(require 'window-number)
(window-number-mode)
(window-number-meta-mode)

(provide 'init-ui)
