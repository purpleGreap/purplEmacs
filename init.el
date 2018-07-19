;;--------------------
;;START
;;--------------------

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Start package.el with emacs
(require 'package)

;;  Enable package at startup
(setq package-enable-at-startup nil)

;; Add melp to the package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Makes sure all the packages are loaded
(package-initialize)

;; Install theme package
(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))

;; Install use-package to simplify code
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Use snippets from config.org
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;;--------------------
;;END
;;--------------------
