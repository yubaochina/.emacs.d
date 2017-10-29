
;;start yasnippet
(require 'yasnippet)
(yas-global-mode 1)


;;let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:includedirectories "/usr/lib/gcc/x86_64-linux-gnu/6/include")
(add-to-list 'achead:includedirectories "/usr/include/boost")
  )
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

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(provide 'init-cppIde)


