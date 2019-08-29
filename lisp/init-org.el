;;https://orgmode.org/orgguide.pdf
;(require 'org)
(require 'ox-publish)
(require 'org-tempo)
(require 'xml-rpc)
(setq org-startup-with-inline-images t)
(auto-image-file-mode t)
(setq org-startup-indented t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (ruby . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (C . t)
   (latex . t)
   (java . t)
   (awk . t)
   (emacs-lisp . t)
   (js . t)
   (R . t)
   (sql . t)
   (org . t)
   (lisp . t)
   (matlab . t)
   (shell . t)
   (octave . t)
   ))

(setq org-confirm-babel-evaluate nil)
(set 'org-startup-with-inline-images t)

;; The following lines are always needed. Choose your own keys.
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)


(setq org-image-actual-width 320)

;;org-download--------------------------
(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(setq-default org-download-image-dir "~/Pictures/Emacs")


;;-------uimage---------------------------------
;https://github.com/lujun9972/uimage
;;use C-c C-c to refresh the images
(require 'uimage)
(uimage-mode t)

;;blog
(require 'org2blog)
(require 'org2blog-autoloads)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; fix "Error during request: 400"

(setq org2blog/wp-blog-alist
      `(("wordpress"
         :url "http://yubaoliu.wordpress.com/xmlrpc.php"
         :username "yubaoliu"
         :keep-new-lines t
         :confirm t
         :wp-code nil
         :tags-as-categories nil)
        ))


(require 'org2jekyll)

(custom-set-variables '(org2jekyll-blog-author "Yubao Liu")
                      '(org2jekyll-source-directory (expand-file-name "~/data/Project/yubaoliu.github.io"))
                      '(org2jekyll-jekyll-directory (expand-file-name "~/data/Project/yubaoliu.github.io"))
                      '(org2jekyll-jekyll-drafts-dir "_drafts/")
                      '(org2jekyll-jekyll-posts-dir "_posts/")
		      )

(setq org-publish-project-alist
                        `(("default"
						   :with-latex t
                           :base-directory "~/data/Project/yubaoliu.github.io/_drafts"
                           :base-extension "org"
                           :publishing-directory "~/data/Project/yubaoliu.github.io/_posts"
                           :publishing-function org-html-publish-to-html
                           :headline-levels 4
                           :section-numbers t
                           :with-toc t
                           :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
                           :html-preamble t
                           :recursive t
                           :make-index t
                           :html-extension "html"
                           :body-only t)
			              ("post"
                           :base-directory ,(org2jekyll-input-directory  org2jekyll-jekyll-drafts-dir)
                           :base-extension "org"
                           :publishing-directory ,(org2jekyll-output-directory org2jekyll-jekyll-posts-dir)
                           :publishing-function org-html-publish-to-html
                           :headline-levels 4
                           :section-numbers t
                           :with-toc t
                           :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
                           :html-preamble t
                           :recursive t
                           :make-index t
                           :html-extension "html"
                           :body-only t
						   :with-date t
						   :auto-preamble t
						   :auto-sitemap t
						   :sitemap-filename "sitemap.org"
						   :sitemap-title "sitemap"
						   :sitemap-sort-folders "last"
						   :with-title t)
                          ("images"
                           :base-directory ,(org2jekyll-input-directory "img")
                           :base-extension "jpg\\|gif\\|png"
                           :publishing-directory ,(org2jekyll-output-directory "img")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("js"
                           :base-directory ,(org2jekyll-input-directory "js")
                           :base-extension "js"
                           :publishing-directory ,(org2jekyll-output-directory "js")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("css"
                           :base-directory ,(org2jekyll-input-directory "css")
                           :base-extension "css\\|el"
                           :publishing-directory ,(org2jekyll-output-directory "css")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("web" :components ("post" "images" "js" "css"))
			  ))


(defun yubao/insert-jekyll-template()
 (interactive)
  (insert "#+STARTUP: showall indent
#+STARTUP: hidestar
#+OPTIONS: H:3 num:t tags:t toc:t timestamps:t
#+LAYOUT: post
#+CATEGORIES: blog
#+DATE: 2019-08-
#+TITLE:
#+DESCRIPTION:
#+TAGS:
#+OPTIONS: body-only:t"
))

(defun yubao/insert-publish-template()
 (interactive)
  (insert "#+EXPORT_FILE_NAME: 
#+TITLE: 
#+KEYWORDS: 
#+OPTIONS: body-only:t
#+subtitle: 
"))
			
(require 'org-page)
(setq op/repository-directory "/Users/yubaoliu/Projects/homepage")
(setq op/site-domain "https://github.com/yubaoliu/homepage")
 
(provide 'init-org)
