
;;;;Adding a package source, https://www.emacswiki.org/emacs/InstallingPackages
;(setq exec-path (append exec-path '("/usr/bin/latex")))

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives  '("melpa" . "https://melpa.org/packages/") t))
(require 'cl);common lisp lib
;;add whatever package you want here
(defvar yubao/packages '(
			 nodejs-repl;need install nodejs in the system
			 js2-mode
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
			 latex-math-preview
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
			 org-grep
			 org-mime
			 org-pdfview
			 org-preview-html
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


;;config the default behaviour
;disable tool-bar minor mode
(tool-bar-mode -1)
;disable scroll bar
(scroll-bar-mode -1)
(setq cursor-type 'bar)

;show line number
(global-linum-mode t)

;;add delete selection mode
(delete-selection-mode t)

;disable the start up help window
(setq inhibit-startup-message t)

;;full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;highlight the current line
(global-hl-line-mode t)

;disable auto backup file
(setq make-backup-files nil)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
;;uncomment this statement if u want to use shortcut key
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;load theme
(load-theme 'monokai t)

;;Latex Config
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(load "preview-latex.el" nil t t)

;;org mode config
(require 'org)
(setq org-src-fontify-natively t);;highlight the grammer keyword
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;;org agenda configure
(setq org-agenda-files '("~/.emacs.d/myagenda"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;; auto-complete
;Enable  auto-complete
(require 'auto-complete-config)
(ac-config-default)
(require 'auto-complete)
(global-auto-complete-mode t)

;;company mode
;(global-company-mode t)
;To use company-mode in all buffers, add the following line to your init file:
(add-hook 'after-init-hook 'global-company-mode)

;;start yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
(add-to-list 'achead:includedirectories "/usr/lib/gcc/x86_64-linux-gnu/6/include"))

;;now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; start flymake-google-init()
;; let's define a function for flymake initialization
;;cpplint is required
;;> sudo pip search cpplint
;;>sudo pip install cpplint
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;turn on semantic
(semantic-mode 1)
;;let's deinfe a function which adds semantics as a suggestion backend to auto complete and hook this funciton to c-mode-common-hook
(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-hook 'my:add-semantic-to-autocomplete)

;;turn on ede mode
(global-ede-mode 1)
;;you can use system-include-path for setting up the system header file locations, turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

;;start eide
;(eide-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode)))
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(nodejs-repl-command "nodejs")
 '(org-babel-load-languages
   (quote
    ((latex . t)
     (org . t)
     (makefile . t)
     (matlab . t)
     (python . t)
     (perl . t)
     (shell . t)
     (C . t)
     (java . t)
     (js . t)
     (awk . t)
     (emacs-lisp . t)
     (lisp . t))))
 '(preview-image-type (quote dvipng))
 '(window-numbering-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))

;;Define a function to open the init file
(defun myfun/open-my-emacs-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;(global-set-key (kbd "<f10>") 'myfun/open-my-emacs-init-file)

;;lisp config
(add-hook 'emacs-lisp-mode 'show-paren-mode)

;;config hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;;config for swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "C-h i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-h u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;conifgure samartparents mode
(require 'smartparens-config)
(smartparens-global-mode t)
;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode) ;only for elisp

;;configure for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
auto-mode-alist))



