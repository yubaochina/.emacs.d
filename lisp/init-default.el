(cd "~/data/Project/blog")

(ido-mode)

(require 'fcitx)
(setq fcitx-use-dbus t)

(setq-default auto-save-timeout 15) ; 15秒无动作,自动保存
(setq-default auto-save-interval 100) ; 100个字符间隔, 自动保存

(fset 'yes-or-no-p'y-or-n-p)

(setq tab-width 4)


(setq
 auto-save-file-name-transorms '("." . "/tmp/emacs_autosave" ) ;#.. files
    backup-by-copying t ; 自动备份
    backup-directory-alist
    '(("." . "/tmp/emacs_backup")) ; 自动备份在目录"~/.em_backup"下
   delete-old-versions t ; 自动删除旧的备份文件
   kept-new-versions 3 ; 保留最近的3个备份文件
   kept-old-versions 1 ; 保留最早的1个备份文件
   version-control t) ; 多次备份

;;abbrev mode
(abbrev-mode t)


;;add delete selection mode
(delete-selection-mode t)


(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; only workinf for gui mode
(setq x-select-enable-clipboard t)

(require 'dired-x)
(setq dired-dwim-target t)


(provide 'init-default)
