
(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)

(setq auto-sace-default nil)

(setq ring-bell-function 'ignore)

(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(split-window-horizontally)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(blink-cursor-mode -1)

(global-set-key (kbd "M-a") nil)

(global-set-key (kbd "C-x o") nil)

(global-set-key (kbd "M-a") 'back-to-indentation)

(global-set-key (kbd "C-.") 'compile)

(global-set-key (kbd "C-,") 'recompile)

(global-set-key (kbd "C--") 'ansi-term)

(global-set-key (kbd "C-;") 'other-window)

(when window-system (global-prettify-symbols-mode t))

(electric-pair-mode t)

(show-paren-mode t)

(setq show-paren-delay nil)

(when window-system (global-hl-line-mode t))

(set-default-font "Space Mono 10" nil t)

(set-cursor-color "#ffffff")

(defvar my-term-shell "/bin/bash")

(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(use-package company :ensure t)

(add-hook 'c++-mode-hook 'company-mode-on)
(add-hook 'c-mode-hook 'company-mode-on)
(add-hook 'emacs-lisp-mode-hook 'company-mode-on)
(add-hook 'term-mode-hook 'company-mode-on)

(setq company-idle-delay 0)

(define-key company-active-map (kbd "M-n") nil)

(define-key company-active-map (kbd "M-p") nil)

(define-key company-active-map (kbd "C-n") #'company-select-next)

(define-key company-active-map (kbd "C-p") #'company-select-previous)

(use-package powerline :ensure t)

(powerline-default-theme)

(use-package elpy :ensure t)

(elpy-enable)

(setq python-shell-interpreter "python3")

(setq elpy-rpc-python-command "python3")

(use-package helm :ensure t)

(setq helm-split-window-in-side-p t)

(helm-autoresize-mode t)

(global-set-key (kbd "C-x b") 'helm-buffers-list)

(global-set-key (kbd "C-=") 'helm-bookmarks)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(global-set-key (kbd "C-s") 'helm-occur)

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(use-package xcscope :ensure t)

(define-key global-map [(ctrl f5)] 'cscope-find-this-symbol)

(define-key global-map [(ctrl f1)] 'cscope-display-buffer-toggle)

(define-key global-map [(ctrl f2)] 'cscope-display-buffer)

(use-package org :ensure t)

(setq org-src-window-setup 'current-window)

(use-package rainbow-mode :ensure t)

(add-hook 'css-mode-hook 'css-mode-on)
