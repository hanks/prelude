;;; package --- Summary:
;;; Commentary:
;;; customize for hanks

;;; Code:

;; no scroll bar
(set-scroll-bar-mode nil)

;; show line number
(require 'linum+)
(global-linum-mode t)

;; I prefer command key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; YASnippet
(require 'yasnippet-bundle)
(setq yas/root-directory "~/.emacs.d/personal/snippets")
(yas/load-directory yas/root-directory)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
               "~/.emacs.d/modules/ac-dict")
(ac-config-default)
(global-auto-complete-mode t)

;;; customize.el ends here
