(setq gc-cons-threshold (* 50 1000 1000)) ;; 50MB during startup
(add-hook 'emacs-startup-hook (lambda () (setq gc-cons-threshold (* 2 1000 1000)))) ;; Reset after startup

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; (set-face-attribute 'default nil
;;                     :family "JetBrainsMonoNL Nerd Font Mono" ;; Or "Monaco" or "SF Mono"
;;                     :height 120
;;                     :weight 'normal)

(global-auto-revert-mode t)
(global-display-line-numbers-mode)
(global-display-fill-column-indicator-mode 80)
(setq display-line-numbers-type 'relative)

(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)

(setq inhibit-startup-screen t)
(setq create-lockfiles nil)

(setq linum-format "%4d")
(setq ring-bell-function 'ignore)
(setq visible-bell nil)

(setq make-backup-files nil)
(setq scroll-step 1)
(setq scroll-margin 1)
(setq-default tab-width 4)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(setq-default header-line-format nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-list '(atom-one-dark-theme
                     doom-themes
                     evil
                     evil-collection
                     hide-mode-line
                     undo-fu
                     projectile
                     helm
                     helm-projectile
                     company
                     yasnippet
                     lsp-mode
                     go-mode
                     protobuf-mode
                     rust-mode
                     typescript-mode
                     web-mode
                     ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" default))
 '(package-selected-packages
   '(yasnippet typescript-mode javascript-mode hide-mode-line helm-rg helm-projectile helm company persp-mode web-mode projectile lsp-mode go-mode evil atom-one-dark-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; (require 'hide-mode-line)
; (setq-default mode-line-format nil)

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode 1))

(use-package undo-fu
  :after evil
  :config
  (evil-set-undo-system 'undo-fu))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init 'dired))

(evil-set-initial-state 'package-menu-mode 'motion)
(define-key evil-normal-state-map (kbd "<SPC>wv") 'evil-window-vsplit)
(define-key evil-normal-state-map (kbd "<SPC>ws") 'evil-window-split)
(define-key evil-normal-state-map (kbd "<SPC><SPC>") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "<SPC>rg") 'helm-projectile-rg)
(define-key evil-normal-state-map (kbd "<SPC>h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "<SPC>j") 'evil-window-bottom)
(define-key evil-normal-state-map (kbd "<SPC>k") 'evil-window-top)
(define-key evil-normal-state-map (kbd "<SPC>l") 'evil-window-right)
(define-key evil-normal-state-map (kbd "<SPC>t") 'neotree-toggle)
(define-key evil-normal-state-map (kbd "<SPC>rn") 'lsp-rename)
(define-key evil-normal-state-map (kbd "<SPC>gr") 'lsp-find-references)
(define-key evil-normal-state-map (kbd "<SPC>gd") 'lsp-goto-definition)
(define-key evil-normal-state-map (kbd "<SPC>ps") 'projectile-switch-project)
(define-key evil-normal-state-map (kbd "<SPC>pa") 'projectile-add-known-project)

(setq projectile-enable-caching nil)

(setq projectile-ignored-projects '("~/"))

(use-package projectile
  :config
  (projectile-mode t))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; (add-hook 'go-mode-hook #'lsp-deferred)

(add-to-list 'exec-path "~/go/bin")

;; (use-package lsp-mode
;;   :init ;(setq lsp-keymap-prefix "<SPC>l")
;;   :commands (lsp lsp-deferred)
;;   ;:config (lsp-enable-which-key-integration t)
;;   :config
;;     (setq lsp-headerline-breadcrumb-enable nil)
;;   )

(use-package lsp-mode
  :hook ((go-mode . lsp-deferred)
         (go-mode . lsp-go-install-save-hooks))
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
              ("<tab>" . my/company-yasnippet-or-completion)
              ("TAB" . my/company-yasnippet-or-completion))
              ("<cr>" . company-complete-selection)
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

;; (use-package company
;;   :after lsp-mode
;;   :hook (lsp-mode . company-mode)
;;   :bind
;;   (:map company-active-map
;;     ("<cr>" . company-complete-selection))
;;   (:map lsp-mode-map
;;     ("<cr>" . company-indent-or-complete-common))
;;   :custom
;;   (company-minimum-prefix-length 1)
;;   (company-idle-delay 0.0))

(use-package yasnippet
  :hook (prog-mode . company-mode)
  :config
  (yas-global-mode 1))

(defun my/company-yasnippet-or-completion ()
  "Complete using yasnippet or company completion."
  (interactive)
  (let ((yas-fallback-behavior nil))
    (unless (yas-expand)
      (call-interactively #'company-complete-common))))

;; (use-package company
;;   :hook (prog-mode . company-mode)
;;   :bind (:map company-active-map
;;               ("<tab>" . my/company-yasnippet-or-completion)
;;               ("TAB" . my/company-yasnippet-or-completion))
;;   :config
;;   ;; Add yasnippet to the list of backends for company-mode
;;   (add-to-list 'company-backends 'company-yasnippet))

;; Ensure `company-backends` doesn’t clobber `yasnippet`
(setq company-backends '((company-capf company-yasnippet company-files)))

(use-package helm
  :ensure t)

(use-package projectile
  :demand t
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'helm)
  (setq projectile-ignored-projects '("~/"))
  (setq projectile-enable-caching nil) 
  (projectile-mode +1))

(use-package helm-projectile
  :after projectile
  :config
  (helm-projectile-on))

(use-package web-mode
  :mode "\\.html?\\'")

(use-package rust-mode
  :mode "\\.rs\\'")

(use-package protobuf-mode
  :mode "\\.proto\\'")

(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))
