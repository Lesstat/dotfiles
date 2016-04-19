(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (misterioso)))
 '(global-highlight-parentheses-mode t)
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(org-agenda-custom-commands
   (quote
    (("y" "My Files"
      ((agenda "" nil)
       (todo "REFILE" nil)
       (todo "IN-PROGRESS"
	     ((org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled))))))
       (todo "TODO"
	     ((org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled))))))
       (todo "WAITING"
	     ((org-agenda-skip-function
	       (quote
		(org-agenda-skip-entry-if
		 (quote scheduled)))))))
      nil nil)
     ("n" "Agenda and all TODO's"
      ((agenda "" nil)
       (alltodo "" nil))
      nil))))
 '(org-agenda-files
   (quote
    ("~/ownCloud/Flo/Uni Stuttgart/Internetrecht/internetrecht.org" "~/ownCloud/Flo/Uni Stuttgart/Guided Research/guided_resarch.org" "~/ownCloud/Flo/Uni Stuttgart/High Performance Computing/hpc.org" "~/ownCloud/Flo/Uni Stuttgart/Qualitätsicherung & Wartung/QSW.org" "~/ownCloud/Flo/Uni Stuttgart/Hauptseminar 1/HS.org" "~/ownCloud/Flo/Uni Stuttgart/Wissenschaftliches Rechnen/WR.org" "~/ownCloud/Flo/Uni Stuttgart/Machine Learning/ML.org" "~/workspaces/config/notmuch_config/notmuch.org" "~/ownCloud/Flo/Documents/Selbstorganisation/Tagfast/tagfast.org" "~/ownCloud/Flo/Documents/Selbstorganisation/Emacs/emacs.org" "~/ownCloud/Flo/Documents/Selbstorganisation/Studium/studium.org" "~/ownCloud/Ilona/Consilium et Factum/Technik/Einrichtung VPS.org" "~/ownCloud/Flo/Documents/Selbstorganisation/references.org" "~/ownCloud/Flo/Documents/Selbstorganisation/notes.org" "~/ownCloud/Flo/Documents/Selbstorganisation/gtd.org")))
 '(org-capture-templates
   (quote
    (("t" "TODO" entry
      (file "~/ownCloud/Flo/Documents/Selbstorganisation/notes.org")
      "** REFILE  %?  %t %a  ")
     ("r" "Reference" entry
      (file "~/ownCloud/Flo/Documents/Selbstorganisation/refernces.org")
      "** %? %T %a %x"))))
 '(org-enforce-todo-dependencies t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(safe-local-variable-values
   (quote
    ((org-html-table-row-tags "<tr class='fragment'>" . "</tr>")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2d3743" :foreground "#e1e1e0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "unknown" :family "Source Code Pro")))))
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
;;(global-linum-mode 1)
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
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
    (use-package evil-surround
      :ensure t
      :config
      (global-evil-surround-mode 1)
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
(use-package ox-ioslide
  :ensure t
  )
(use-package ox-reveal
  :ensure t
  )
(setq org-refile-targets
      (quote( (org-agenda-files . (:maxlevel . 10))))
      )
(setq org-defhault-notes-file "~/ownCloud/Flo/Documents/Selbstorganisation/notes.org")
(use-package org-bullets
   :ensure t
   :init (add-hook 'org-mode-hook 'org-bullets-mode))
(use-package ob-ipython
  :ensure t
  )
;(use-package org-beautify-theme
; :ensure t )
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cb" 'org-iswitchb)
(dolist (hook '(org-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1)))
  (add-hook hook (lambda () (auto-fill-mode 1)))
  (add-hook hook (lambda () (org-indent-mode 1))))
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (sh . t)
   (python . t)
   (R . t)
   ))
(global-hl-line-mode 1)
(set-face-background 'hl-line "purple")
(use-package ess
  :ensure t)
(setq org-reveal-root "/home/flo/workspaces/js/reveal.js")
(add-hook 'before-save-hook 'gofmt-before-save)
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "IN-PROGRESS(p)" "|" "DONE(d)")
              (sequence "WAITING(w)" "REFILE(r)" "|" "CANCELLED(c)"))))
(use-package flycheck
  :ensure t
  :config ) 
(use-package elpy
  :ensure t
  :init (elpy-enable)
  :config
  (elpy-use-ipython)
	  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
	  (add-hook 'elpy-mode-hook 'flycheck-mode)
  (use-package ein
    :ensure t)
  (use-package py-autopep8
    :ensure t
    :config
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)))
(global-highlight-parentheses-mode) 
