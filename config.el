
(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)

(setq auto-sace-default nil)

(setq ring-bell-function 'ignore)

(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))

(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(split-window-horizontally)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(blink-cursor-mode -1)

(global-set-key (kbd "C-x o") nil)

(global-set-key (kbd "M-d") nil)
(global-set-key (kbd "C-<backspace>") nil)

(global-set-key (kbd "C--") 'ansi-term)

(global-set-key (kbd "C-;") 'other-window)

(global-set-key (kbd "M-d") 'kill-whole-word)

(add-hook 'c-mode-hook 'subword-mode)
(add-hook 'c++-mode-hook 'subword-mode)

(electric-pair-mode t)

(show-paren-mode t)

(setq show-paren-delay nil)

(when window-system (global-hl-line-mode t))

(set-default-font "Space Mono 10" nil t)

(global-set-key (kbd "M-a") nil)

(global-set-key (kbd "M-a") 'back-to-indentation)

(global-set-key (kbd "C-.") 'compile)

(global-set-key (kbd "C-,") 'recompile)

(defun programming-kbd-config ()
(global-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode-hook 'programming-kbd-config)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(use-package company
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)
  (add-hook 'c++-mode-hook 'company-mode)

  :config
  (setq company-idle-delay 0)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;(use-package elpy
;  :ensure t
;  :config
;  (enable-elpy)
;  (setq elpy-rpc-python-command "python3")
;  (setq python-shell-interpreter "python3")

(use-package flycheck
  :ensure t
  :init
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  :config
  (setq flycheck-display-errors-delay 0))

(use-package helm
  :ensure t
  :config
  (setq helm-split-window-in-side-p t)
  (helm-autoresize-mode t)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "M-<backspace>") 'helm-find-files-up-one-level)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-=") 'helm-bookmarks)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-s") 'helm-occur)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

(use-package helm-cscope
  :ensure t
  )

(use-package mark-multiple
  :ensure t
  :bind
  ("C-'" . 'mark-next-like-this))

(use-package org
  :ensure t
  :init 
  (setq org-src-window-setup 'current-window)
  (add-hook 'org-mode-hook 'org-indent-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook '(lambda () (org-bullets-mode))))

(use-package rainbow-mode
  :ensure t
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (setq powerline-default-separator 'wave)
  (spaceline-compile))

(use-package xcscope
  :ensure t
  :bind
  ("C-<f5>" . cscope-find-this-symbol)
  ("C-<f1>" . cscope-display-buffer-toggle)
  ("C-<f2>" . cscope-display-buffer))
