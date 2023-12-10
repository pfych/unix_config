(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; Set up MELPA packages
(require 'package)
(add-to-list 'package-archives '("Melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Confirm all required packages are installed
(setq package-list '(catppuccin-theme))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Setup theme
(load-theme 'catppuccin :no-confirm)
(setq catppucin-flavor 'mocha)
(catppuccin-set-color 'base "#1c1c1c") ;; TODO: Could this be a loop?
(catppuccin-set-color 'mantle "#1c1c1c")
(catppuccin-set-color 'crust "#1c1c1c")
(catppuccin-reload)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(slime)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
