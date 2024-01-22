;; Set this value for startup times idk?
(setq gc-cons-threshold 100000000)

;; Set up MELPA packages
(require 'package)
(add-to-list 'package-archives '("Melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Confirm all required packages are installed
(setq package-list '(catppuccin-theme evil))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Setup theme
(load-theme 'catppuccin :no-confirm)
(setq catppucin-flavor 'mocha)

;; set theme-option to each of the options. List has '() to avoid evaluating inner.
(setq theme-options '(base mantle crust))
(dolist (option theme-options)
  (catppuccin-set-color option "#1c1c1c"))

(catppuccin-reload)

;; Setup slime helper for lisp
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")


;; Setup Evil Mode (vim shortcuts)
(require 'evil)
(evil-mode 1)

;; Make :q and :wq close buffer/window instead of killing emacs
(defun save-and-kill ()
  (interactive)
  (save-buffer)
  (kill-buffer-and-window))

(evil-ex-define-cmd "wq" 'save-and-kill)
(evil-ex-define-cmd "q" 'kill-buffer-and-window)

;; Setup org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Configure org mode headers
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(slime)))
