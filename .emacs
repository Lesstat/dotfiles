(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Fix against MIME vulnerability
  (eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))
;;; Fix end

;;; Set up package
(require 'package)

(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
       ("melpa" . "https://melpa.org/packages/")
       ("org"   . "http://orgmode.org/elpa/"))
      )

;; Always check tls 
;; Code and idea borrowed from https://glyph.twistedmatrix.com/2015/11/editor-malware.html
(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string "python -m certifi")))))
  (setq tls-checktrust t)
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)

(setq vc-follow-symlinks t) ;; so emacs doesn't ask how to open config.org after every change
(org-babel-load-file (concat user-emacs-directory "config.org"))
(put 'narrow-to-region 'disabled nil)
