;;User Info

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(setq user-full-name "Liu Yubao")
(setq user-mail-address "yubaoliu89@gmail.com")

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/packages/org-mode/lisp")
(add-to-list 'load-path "~/.emacs.d/packages/org-mode/contrib/lisp")

(require 'init-packages)
;(require 'init-evil)
(require 'init-ui)
(require 'init-default)
(require 'init-keybinding)
(require 'init-org)
(require 'init-academic)
(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))

(load-file custom-file)

