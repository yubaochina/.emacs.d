;;Define a function to open the init file
(defun myfun/open-my-emacs-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;load path
(add-to-list 'load-path "~/.emacs.d/lisp")
;;(require 'init-packages)
;;(require 'init-ui)
;;(require 'init-better-defaults)
;;(require 'init-keybindings)
;;(require 'init-org)

;;;equas to
;;(load "init-packages")
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "init-org")

;;;equas to
(load-file "~/.emacs.d/lisp/init-packages.elc")
(load-file "~/.emacs.d/lisp/init-ui.elc")
(load-file "~/.emacs.d/lisp/init-keybindings.elc")
(load-file "~/.emacs.d/lisp/init-better-defaults.elc")
(load-file "~/.emacs.d/lisp/init-org.elc")

(setq custom-file (expand-file-name "lisp/init-custom.el" user-emacs-directory))

(load-file custom-file)
