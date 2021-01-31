;https://github.com/benkolera/nix/blob/master/home-manager/dotfiles/emacs.d/init.el

(setq
 inhibit-startup-message t inhibit-startup-echo-area-message (user-login-name)
 initial-major-mode 'fundamental-mode initial-scratch-message nil
 ;fill-column 120
 locale-coding-system 'utf-8
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load-file custom-file)

(require 'package)
(setq package-archives nil)
(package-initialize)
(require 'use-package)

(global-hl-line-mode t)

(use-package all-the-icons)

(use-package doom-themes
  :after all-the-icons
  :config
  (setq
   doom-themes-enable-bold t
   doom-themes-enable-italic t)
  (load-theme 'doom-vibrant t)
  (doom-themes-visual-bell-config)

  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode 1))

(use-package evil
  :init ;; tweak evil's configuration before loading it
  (setq
   evil-search-module 'evil-search
   evil-vsplit-window-right t
   evil-split-window-below t
   evil-want-integration t
   evil-want-keybinding nil)
  :config ;; tweak evil after loading it
  (evil-mode))

(use-package dashboard
  :init
  (setq
   initial-buffer-choice (lambda () (get-buffer "*dashboard*"))
   dashboard-center-content t
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-items '((recents  . 10) (projects . 10))
   dashboard-startup-banner 'logo)

  :config
  (dashboard-setup-startup-hook)
  (defun dashboard-goto-recent-files ()
    "Go to recent files."
    (interactive)
    (funcall (local-key-binding "r")))

  (defun dashboard-goto-projects ()
    "Go to projects."
    (interactive)
    (funcall (local-key-binding "p")))

  (evil-define-key 'normal dashboard-mode-map
    "g" 'dashboard-refresh-buffer
    "}" 'dashboard-next-section
    "{" 'dashboard-previous-section
    "p" 'dashboard-goto-projects
    "r" 'dashboard-goto-recent-files))

(use-package which-key
  :defer 0.1
  :init
  ;; Silence warning (:defer causes byte compile warnings)
  (declare-function which-key-prefix-then-key-order "which-key")
  (declare-function which-key-mode "which-key")

  (setq
   which-key-sort-order #'which-key-prefix-then-key-order
   which-key-sort-uppercase-first nil
   which-key-add-column-padding 1
   which-key-max-display-columns nil
   which-key-min-display-lines 6
   which-key-side-window-slot -10)
  :config
  (which-key-mode +1))


(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode)
  (evil-leader/set-key
    "<SPC>" 'counsel-M-x
    "bd" 'kill-buffer
    "br" 'revert-buffer
    "qq" 'kill-buffers-kill-terminal
    "qs" 'save-buffers-kill-emacs
    "sa" 'counsel-ag
    "w" evil-window-map))

(use-package evil-collection
  :after evil
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

(use-package company
  :bind
  (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.1)
  (global-company-mode t))

(use-package helm
  :config
  (helm-mode 1)
  (require 'helm-config)
  (evil-leader/set-key
    "<SPC>" 'helm-M-x
    "ff" 'helm-find-files
    "fr" 'helm-recentf
    "bb" 'helm-buffers-list
    "qq" 'kill-emacs))

(use-package helm-projectile
  :after (helm projectile)
  :config
  (evil-leader/set-key
    "pp" 'helm-projectile-switch-project
    "pr" 'helm-projectile-recentf
    "pd" 'helm-projectile-find-dir
    "pf" 'helm-projectile-find-file
    "po" 'helm-projectile-find-file-other
    "pb" 'helm-projectile-switch-to-buffer
    "pg" 'helm-projectile-rg
    "pq" 'projectile-kill-buffers))

(use-package treemacs
  :defer 0.1
  :config
  (defun treemacs-ignore-flymake (file _)
    (string-match-p (regexp-quote "_flymake\..+") file))
  (push #'treemacs-ignore-flymake treemacs-ignored-file-predicates)
  (treemacs-follow-mode))

(use-package treemacs-evil
  :after (treemacs evil))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :config
  (evil-leader/set-key
    "pt" 'treemacs-add-and-display-current-project))
