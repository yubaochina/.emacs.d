;; Download evil from:  https://github.com/emacs-evil/evil
(add-to-list 'load-path "~/.emacs.d/packages/evil")
(require 'evil)
(evil-mode 1)

;(evil-set-initial-state 'dired-mode 'emacs)
(define-key evil-emacs-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map [escape] 'evil-normal-state)


(set 'evil-disable-insert-state-bindings t)
;; remove all keybindings from insert-state keymap
;(setcdr evil-insert-state-map nil)


(define-key evil-insert-state-map "\C-a" 'move-beginning-of-line)
(define-key evil-normal-state-map "\C-a" 'move-beginning-of-line)
(define-key evil-visual-state-map "\C-a" 'move-beginning-of-line)

(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-normal-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'end-of-line)

(define-key evil-normal-state-map "\C-r" 'search-backward)
(define-key evil-insert-state-map "\C-r" 'search-backward)
(define-key evil-visual-state-map "\C-r" 'search-backward)

(define-key evil-normal-state-map "\C-n" 'next-line)
(define-key evil-insert-state-map "\C-n" 'next-line)
(define-key evil-visual-state-map "\C-n" 'next-line)


(define-key evil-normal-state-map "\C-p" 'previous-line)
(define-key evil-insert-state-map "\C-p" 'previous-line)
(define-key evil-visual-state-map "\C-p" 'previous-line)

(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)

(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)

(define-key evil-normal-state-map "\C-f" 'forward-char)
(define-key evil-insert-state-map "\C-f" 'forward-char)
(define-key evil-visual-state-map "\C-f" 'forward-char)


(define-key evil-normal-state-map "\M-f" 'forward-word)
(define-key evil-insert-state-map "\M-f" 'forward-word)
(define-key evil-visual-state-map "\M-f" 'forward-word)


(define-key evil-normal-state-map "\C-v" 'scroll-up-command)
(define-key evil-insert-state-map "\C-v" 'scroll-up-command)
(define-key evil-visual-state-map "\C-v" 'scroll-up-command)


(define-key evil-normal-state-map "\M-v" 'scroll-up-command)
(define-key evil-insert-state-map "\M-v" 'scroll-down-command)
(define-key evil-visual-state-map "\M-v" 'scroll-down-command)


(global-evil-tabs-mode t)

(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist t)


(provide 'init-evil)
