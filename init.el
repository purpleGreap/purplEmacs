;;--------------------
;;START
;;--------------------

;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
(lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

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
