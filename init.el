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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (klere)))
 '(custom-safe-themes
   (quote
    ("f41ecd2c34a9347aeec0a187a87f9668fa8efb843b2606b6d5d92a653abe2439" "476bac2b4e56253a30d5b20559f94c047ea7548363b7607b3e456b26685dc34c" default)))
 '(package-selected-packages
   (quote
    (xcscope helm company rainbow xscope use-package rainbow-mode powerline org klere-theme helm-cscope elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Use snippets from config.org
(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))
