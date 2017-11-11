
(when (>= emacs-major-version 24)
                                        ;  (add-to-list 'package-archives  '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa-stable/")
               )
  )
(require 'cl);common lisp lib
;;add whatever package you want here
(defvar yubao/packages '(
                         cmake-font-lock
                         cmake-ide
                         cmake-mode
                         cmake-project
                         magit
                         sr-speedbar
                         ztree
                         zygospore
                         helm-gtags
                         helm
                         yasnippet
                         ws-butler
                         use-package
                         undo-tree
                         iedit
                         dtrt-indent
                         counsel-projectile
                         clean-aindent-mode
                         anzu
                         workgroups2
                         volatile-highlights
                         ggtags
                         evil
                         ac-js2
                         flycheck
                         helm-ag
                         iedit
                         expand-region
                         web-mode
                         reveal-in-osx-finder
                         nodejs-repl;need install nodejs in the system
                         js2-mode
                         js2-refactor
                         smartparens
                         counsel
                         swiper
                         hungry-delete
                         monokai-theme
                         solarized-theme
                         company
                         latex-pretty-symbols
                         latex-unicode-math-mode
                         latex-extra
                         auto-complete-exuberant-ctags
                         auto-org-md
                         common-lisp-snippets
                         company-auctex
                         company-bibtex
                         company-dict
                         company-edbi
                         company-go
                         company-php
                         company-shell
                         company-web
                         ctags-update
                         company-c-headers
                         ac-html-angular
                         cdlatex
                         company-math
                         org-mime
                         org-pdfview
                         latex-preview-pane
                         ob-translate
                         solarized-theme
                         auctex
                         auctex-latexmk
                         auto-auto-indent
                         markdown-mode
                         matlab-mode
                         org-ac
                         ob-http
                         ob-ipython
                         ob-php
                         xcode-mode
                         window-numbering
                         window-number
                         window-layout
                         web-mode
                         w3m python
                         iedit
                         google-translate
                         google-maps
                         google-c-style
                         flymake-shell
                         flymake-json
                         flymake-google-cpplint
                         flymake-cursor
                         eide
                         ecb
                         cedit
                         auto-yasnippet
                         auto-dictionary
                         auto-complete-pcmp
                         auto-complete-clang-async
                         auto-complete-clang
                         auto-complete-chunk
                         auto-complete-c-headers
                         auto-complete-auctex
                         ac-math
                         ac-ispell
                         ac-html
                         ac-helm
                         ac-etags
                         ac-clang
                         ac-c-headers
                         )
  "Default packages")
(setq package-selected-packages  yubao/packages) ;let package-autoremove know my customized packages, ohterwise package-autoremove will delete my customized packages

(defun yubao/packages-installed-p ()
  (loop for pkg in yubao/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (yubao/packages-installed-p)
  (message "%s" "Refreshing package database .... ")
  (package-refresh-contents)
  (dolist (pkg yubao/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;;conifgure samartparents mode
(smartparens-global-mode t)
;;Fix smart parents' bug=>(add-to-list '')
(with-eval-after-load 'smartparens
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
  )

;(defun disable-single-quote ()
;  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;  (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)p
;    )
;(add-hook 'emacs-lisp-mode #'disable-single-quote)

;;config for swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;(setq enable-recursive-minibuffers t)


;;company mode
;(global-company-mode t)
;To use company-mode in all buffers, add the following line to your init file:
(add-hook 'after-init-hook 'global-company-mode)


;;load theme
(load-theme 'monokai t)

(provide 'init-packages)



