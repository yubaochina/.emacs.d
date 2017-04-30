;;;;Adding a package source, https://www.emacswiki.org/emacs/InstallingPackages
(setq inhibit-startup-message t)

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
