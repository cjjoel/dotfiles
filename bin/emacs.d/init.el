;https://github.com/benkolera/nix/blob/master/home-manager/dotfiles/emacs.d/init.el
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq
 inhibit-startup-message t inhibit-startup-echo-area-message (user-login-name)
 initial-major-mode 'fundamental-mode initial-scratch-message nil
 ;fill-column 120
 locale-coding-system 'utf-8
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil
 visible-bell t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-hl-line-mode t)

(add-to-list 'default-frame-alist '(font . "Source Code Pro-14"))


(setq custom-file "~/.emacs.d/custom.el")
(unless (file-exists-p custom-file)
  (write-region "" nil custom-file))
(load-file custom-file)

;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(require 'color-theme)
;;(require 'color-theme-solarized)
;;(color-theme-initialize)
;;(color-theme-solarized-light)
;;(load-theme 'color-theme-solarized-light t)
;; set dark theme
;;(color-theme-solarized-dark)
;; set light theme

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-light-medium t))

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package evil
  :init
  (setq
   evil-search-module 'evil-search
   evil-vsplit-window-right t
   evil-split-window-below t
   evil-want-integration t
   evil-want-keybinding nil)
  :config 
  (evil-mode))

