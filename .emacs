(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t)
 '(line-number-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;(global-linum-mode 1)
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'use-package)
(use-package evil
  :ensure t
  :config 
  (evil-mode 1)
  (use-package evil-anzu
    :ensure t
    )
  (use-package evil-annoying-arrows
    :ensure t
    :config
    (global-evil-annoying-arrows-mode t)
    (setq evil-annoying-arrows-super-annoying-mode t)
    )
  )
(use-package powerline
  :ensure t
  :config
  (powerline-evil-center-color-theme)
  )
(use-package linum-relative
  :ensure t
  :config
  (linum-relative-global-mode)
  )
(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x")                          'undefined)
  (global-set-key (kbd "M-x")                          'helm-M-x)
  (global-set-key (kbd "M-y")                          'helm-show-kill-ring)
  (global-set-key (kbd "C-x C-f")                      'helm-find-files) 
  )
 
(use-package magit
  :ensure t )
;;;;(setq org-refile-targets (quote (
		;;		 ("~/ownCloud/Flo/Documents/Selbstorganisation/notes.org"
				;;  "~/ownCloud/Flo/Documents/Selbstorganisation/gtd.org"
				  ;;'. :maxlevel
	;;			  '. 10))))
(setq org-default-notes-file "~/ownCloud/Flo/Documents/Selbstorganisation/notes.org")
(define-key global-map "\C-cc" 'org-capture)
(dolist (hook '(org-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))
