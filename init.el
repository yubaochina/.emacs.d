;;;;Adding a package source, https://www.emacswiki.org/emacs/InstallingPackages
(setq inhibit-startup-message t)
;(setq exec-path (append exec-path '("/usr/bin/latex")))

;;;initialize package
(require 'package)
(setq package-archives '(
;			 ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;(add-to-list 'load-path "~/.emacs.d/org-mode/lisp")
;(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)

;;Latex Config
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(load "preview-latex.el" nil t t)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;;; auto-complete
;Enable  auto-complete
(require 'auto-complete-config)
(ac-config-default)
(require 'auto-complete)
(global-auto-complete-mode t)

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
     (emacs-lisp . t))))
 '(package-selected-packages
   (quote
    (latex-pretty-symbols latex-unicode-math-mode latex-extra latex-math-preview auto-complete-exuberant-ctags auto-org-md common-lisp-snippets company-auctex company-bibtex company-dict company-edbi company-go company-php company-shell company-web ctags-update company-c-headers ac-html-angular cdlatex company-math org-grep org-mime org-pdfview org-preview-html latex-preview-pane ob-translate solarized-theme auctex auctex-latexmk auto-auto-indent markdown-mode matlab-mode org-ac ob-http ob-ipython ob-php xcode-mode window-numbering window-number window-layout web-mode w3m python iedit google-translate google-maps google-c-style flymake-shell flymake-json flymake-google-cpplint flymake-cursor eide ecb cedit auto-yasnippet auto-dictionary auto-complete-pcmp auto-complete-clang-async auto-complete-clang auto-complete-chunk auto-complete-c-headers auto-complete-auctex ac-math ac-ispell ac-html ac-helm ac-etags ac-clang ac-c-headers)))
 '(preview-image-type (quote dvipng))
 '(window-numbering-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
