(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-auto-revert-mode t)
(global-display-fill-column-indicator-mode)
(global-display-line-numbers-mode)

(delete-selection-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(show-paren-mode 1)


(setq scroll-step 1)
(setq scroll-margin 1)

(setq-default frame-title-format '("%b"))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default truncate-lines t)

(setq tab-bar-close-button-show nil)
(setq tab-bar-add-button-show nil)
(setq tab-bar-tab-hints nil)

(fset 'yes-or-no-p 'y-or-n-p)
(setq indent-line-function 'insert-tab)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(setq linum-format "%4d ")
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq scroll-margin 16)
(setq visible-bell nil)

(setq create-lockfiles nil)

(defun config-reload ()
  (interactive)
  (load-file (expand-file-name "init.el" user-emacs-directory)))

(defconst emacs-tmp-dir (expand-file-name (format "emacs%d" (user-uid)) temporary-file-directory))
(setq
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   auto-save-list-file-prefix emacs-tmp-dir
   auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
   backup-directory-alist `((".*" . ,emacs-tmp-dir)))

(add-hook 'before-save-hook
	  'delete-trailing-whitespace)

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq package-list '(evil
                     evil-leader))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq use-package-always-ensure t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
    '("0c860c4fe9df8cff6484c54d2ae263f19d935e4ff57019999edbda9c7eda50b8" default))
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
    '(fzf flycheck helm-projectile web-mode neotree git-gutter evil-collection protobuf-mode typescript-mode which-key projectile helm-make magit company go-imports lsp-mode atom-one-dark-theme git-lens go-mode helm evil-leader evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'atom-one-dark t)

(use-package undo-tree
  :init (global-undo-tree-mode)
  :config (setq-default undo-tree-auto-save-history nil))

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

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(require 'evil)

(evil-mode t)

(require 'evil-leader)

(global-evil-leader-mode)

(evil-leader/set-leader ",")

(evil-set-initial-state 'package-menu-mode 'motion)
(define-key evil-normal-state-map (kbd ",wv") 'evil-window-vsplit)
(define-key evil-normal-state-map (kbd ",ws") 'evil-window-split)
(define-key evil-normal-state-map (kbd ",ff") 'fzf)
(define-key evil-normal-state-map (kbd ",h") 'evil-window-left)
(define-key evil-normal-state-map (kbd ",j") 'evil-window-bottom)
(define-key evil-normal-state-map (kbd ",k") 'evil-window-top)
(define-key evil-normal-state-map (kbd ",l") 'evil-window-right)
(define-key evil-normal-state-map (kbd ",t") 'neotree-toggle)
(define-key evil-normal-state-map (kbd ",rn") 'lsp-rename)
(define-key evil-normal-state-map (kbd ",gr") 'lsp-find-references)
(define-key evil-normal-state-map (kbd ",ps") 'projectile-switch-project)

(require 'protobuf-mode)
(require 'typescript-mode)
(require 'lsp-mode)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :commands (lsp lsp-deferred)
  :config (lsp-enable-which-key-integration t))

(add-to-list 'exec-path "~/go/bin")
(setq lsp-headerline-breadcrumb-enable nil)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind
  (:map company-active-map
    ("<cr>" . company-complete-selection))
  (:map lsp-mode-map
    ("<cr>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(add-hook 'go-mode-hook #'lsp-deferred)

(use-package which-key
    :config
    (which-key-mode))

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-switch-project-action #'projectile-dired)
  (add-hook 'projectile-after-switch-project-hook #'neotree-projectile-action))

(defun neotree-projectile-action ()
  "Open NeoTree using projectile root."
  (interactive)
  (let ((project-root (projectile-project-root)))
    (if project-root
        (progn
          (neotree-dir project-root)
          (message "NeoTree opened for project: %s" project-root))
      (message "Failed to determine the project root."))))


(require 'hide-mode-line)

(add-hook 'dired-sidebar-mode-hook
          (lambda ()
            (setq-local ls-lisp-dirs-first t)))

(use-package neotree
  :config
    (setq neo-theme 'arrows))

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.css$" . html-mode))

(use-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode))

(use-package fzf
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        fzf/grep-command "rg --no-heading -nH"
        fzf/position-bottom t
        fzf/window-height 15))

(hide-mode-line-mode +1)
