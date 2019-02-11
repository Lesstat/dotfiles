;; fb-base16-nord-theme.el -- A base16 colorscheme

;;; Commentary:
;; Base16: (https://github.com/chriskempson/base16)

;;; Authors:
;; Scheme: arcticicestudio
;; Template: Kaleb Elwert <belak@coded.io>

;;; Code:

(require 'base16-theme)

(defvar fb-base16-nord-colors
  '(:base00 "#2e3440"
    :base01 "#3b4252"
    :base02 "#434c5e"
    :base03 "#6d7a96"
    :base04 "#d8dee9"
    :base05 "#e5e9f0"
    :base06 "#eceff4"
    :base07 "#8fbcbb"
    :base08 "#88c0d0"
    :base09 "#81a1c1"
    :base0A "#5e81ac"
    :base0B "#bf616a"
    :base0C "#d08770"
    :base0D "#ebcb8b"
    :base0E "#a3be8c"
    :base0F "#b48ead")
  "All colors for Base16 Nord are defined here.")

;; Define the theme
(deftheme fb-base16-nord)

;; Add all the faces to the theme
(base16-theme-define 'fb-base16-nord fb-base16-nord-colors)

(defun fb/get-color (key)
  "Shorthand to extract color with key KEY from fb-base16-nord-colors."
  (base16-transform-color-key key fb-base16-nord-colors))

 ;; (fb/get-color 'base03)
 ;; (fb/get-color 'base07)
 ;; (fb/get-color 'base09)
(custom-theme-set-faces
   'fb-base16-nord
   '(org-level-1 ((t (:weight bold :height 1.0 :foreground "#6d7a96"))))
   '(org-level-2 ((t (:weight semi-bold        :foreground "#8fbcbb":inherit org-level-1))))
   '(org-level-3 ((t (:weight medium           :foreground "#81a1c1" :inherit org-level-2))))
   '(org-level-4 ((t (:inherit org-level-3))))
   '(org-level-5 ((t (:inherit org-level-4))))
   '(org-level-6 ((t (:inherit org-level-5))))
   '(org-level-7 ((t (:inherit org-level-6))))
   '(org-level-8 ((t (:inherit org-level-7))))
   )



;; Mark the theme as provided
(provide-theme 'fb-base16-nord)

(provide 'fb-base16-nord-colors-theme)

;;; fb-base16-nord-theme.el ends here
