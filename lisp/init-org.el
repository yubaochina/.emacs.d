;;org mode config
(with-eval-after-load 'org
  (setq org-agenda-files '("~/WorkingAndAgenda"))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (setq org-src-fontify-natively t);;highlight the grammer keyword
  (add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
  )

(require 'org-pomodoro)

(provide 'init-org)
