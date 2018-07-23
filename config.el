
(defalias 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)

(setq auto-sace-default nil)

(setq ring-bell-function 'ignore)

(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))

(setq inhibit-startup-message t)

;(split-window-horizontally)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(blink-cursor-mode -1)

(global-set-key (kbd "C-x o") nil)

(global-set-key (kbd "M-d") nil)
(global-set-key (kbd "C-<backspace>") nil)

(global-set-key (kbd "C-0") nil)

(global-set-key (kbd "C--") 'ansi-term)

;; (global-set-key (kbd "C-;") 'other-window)

(global-set-key (kbd "M-d") 'kill-whole-word)

(global-set-key (kbd "C-0") 'switch-to-next-buffer)
(global-set-key (kbd "C-M-0") 'switch-to-prev-buffer)

(add-hook 'c-mode-hook 'subword-mode)
(add-hook 'c++-mode-hook 'subword-mode)

(electric-pair-mode t)

(show-paren-mode t)

(setq show-paren-delay nil)

(add-hook 'c-mode-hook 'hl-line-mode)

(set-frame-font "Space Mono 10" nil t)

(global-set-key (kbd "M-a") nil)

(global-set-key (kbd "M-a") 'back-to-indentation)

(global-set-key (kbd "C-.") 'compile)

(global-set-key (kbd "C-,") 'recompile)

(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(defun programming-kbd-config ()
(global-set-key (kbd "RET") 'newline-and-indent))

(add-hook 'c-mode-hook 'programming-kbd-config)

(use-package avy
  :defer t
  :bind
  ("M-s" . avy-goto-char))

(use-package company
  :defer t
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

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "ようこそ!")
  (setq dashboard-startup-banner "/home/greap/.emacs.d/dashboard.png")
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5))))

;(use-package elpy
;  :defer t
;  :config
;  (enable-elpy)
;  (setq elpy-rpc-python-command "python3")
;  (setq python-shell-interpreter "python3")

(use-package evil
  :defer t 
  :init
  (evil-mode 1)
  :config
  (setq evil-default-cursor (quote (t "#4a5af6"))
        evil-visual-state-cursor '("#ff2e33" box)
        evil-normal-state-cursor '("#4a5af6" box)
        evil-insert-state-cursor '("#e2e222" box)))

(use-package flycheck
  :defer t
  :init
  (add-hook 'c-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  :config
  (setq flycheck-display-errors-delay 0))

(use-package helm
  :defer t
  :config
  (setq helm-split-window-inside-p t)
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
  :defer t
  )

;; (use-package mark-multiple
;;   :defer t
;;   :bind
;;   ("C-'" . 'mark-next-like-this))

(use-package org
  :defer t
  :init 
  (setq org-src-window-setup 'current-window)
  (add-hook 'org-mode-hook 'org-indent-mode))

(use-package org-bullets
  :defer t
  :config
  (add-hook 'org-mode-hook '(lambda () (org-bullets-mode))))

(use-package projectile
  :defer t
  )

(use-package rainbow-mode
  :defer t
  :config
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode))

(use-package doom-modeline
      :defer t
      :hook (after-init . doom-modeline-init))

(use-package vi-tilde-fringe
  :ensure t
  :config
   (global-vi-tilde-fringe-mode 1))

(use-package xcscope
  :defer t
  :bind
  ("C-<f5>" . cscope-find-this-symbol)
  ("C-<f1>" . cscope-display-buffer-toggle)
  ("C-<f2>" . cscope-display-buffer))
