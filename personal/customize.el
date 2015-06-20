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

;;; customize.el ends here
