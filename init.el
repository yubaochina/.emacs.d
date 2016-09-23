;;;;Adding a package source, https://www.emacswiki.org/emacs/InstallingPackages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;;;;installing packages
;;;Type M-x list-packages to open the package list. Press ¡®i¡¯ to mark for installation, ¡®u¡¯ to unmark, and ¡®x¡¯ to perform the installation. 
;;;Press ¡®RET¡¯ to read more about installing and using each package.

(use-package markdown-mode
	     :ensure t)
(use-package auto-complete
	     :ensure t)
(use-package yasnippet
	     :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
