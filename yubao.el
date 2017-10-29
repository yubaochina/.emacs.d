;;Define a function to open the init file
(defun myfun/open-my-emacs-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")) 

;;load path
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-web-ide)
;;(require 'init-cppIde)

;;;equas to
;;(load "init-packages")
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "init-org")

;;;equas to
;;(load-file "~/.emacs.d/lisp/init-packages.elc")
;;(load-file "~/.emacs.d/lisp/init-ui.elc")
;;(load-file "~/.emacs.d/lisp/init-keybindings.elc")
;;(load-file "~/.emacs.d/lisp/init-better-defaults.elc")
;;(load-file "~/.emacs.d/lisp/init-org.elc")

(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))

(load-file custom-file)


(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
;; If you want to use ggtags, comment this line 
;;  (require 'setup-helm)
 (require 'setup-helm-gtags))
(require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

(global-linum-mode t)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: ztree  ;;
;;                 ;;
;; GROUP: No group ;;
;;;;;;;;;;;;;;;;;;;;;
;; since ztree works with files and directories, let's consider it in
;; group Files
(require 'ztree-diff)
(require 'ztree-dir)

(setq speedbar-show-unknown-files t)

;(require 'sr-speedbar)
  (setq sr-speedbar-right-side nil)

(setq sr-speedbar-default-width 25)

(add-hook 'speedbar-mode-hook (lambda () (linum-mode -1)))

(add-hook 'csharp-mode-hook 'omnisharp-mode)
