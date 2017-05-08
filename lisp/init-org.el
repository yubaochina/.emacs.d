;;org mode config
(require 'org)
(setq org-src-fontify-natively t);;highlight the grammer keyword
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;;org agenda configure
(setq org-agenda-files '("~/.emacs.d/myagenda"))


(provide 'init-org)
