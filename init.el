;;--------------------
;;START
;;--------------------

;; Start package.el with emacs
(require 'package)

;;  Enable package at startup
(setq package-enable-at-startup nil)

;; Add melp to the package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Makes sure all the packages are loaded
(package-initialize)

;; Install use-package to simplify code. 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Installs klere theme if not installed
(unless (package-installed-p 'klere-theme)
  (package-refresh-contents)
  (package-install 'klere-theme))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Use snippets from config.org
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;;--------------------
;;END
;;--------------------
