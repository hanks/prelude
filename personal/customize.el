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

;; set no backup files
(setq make-backup-files nil)

;; time in status bar
(display-time)

;; set title
(setq frame-title-format
      '("Hanks Is Geek!@%S" (buffer-file-name "%f"
                   (dired-directory dired-directory "%b"))))

;; no alert sound
(setq visible-bell t)

;; desktop save session
(desktop-save-mode 1)

;; set tabbar
(require 'tabbar)
(tabbar-mode t)
(global-set-key (kbd "M--") 'tabbar-backward-group)
(global-set-key (kbd "M-=") 'tabbar-forward-group)
(global-set-key (kbd "M-1") 'tabbar-backward)
(global-set-key (kbd "M-2") 'tabbar-forward)

;; use tabbar
(setq tabbar-buffer-groups-function
          (lambda ()
            (list "All"))) ;; code by Peter Barabas

;; set smart cursor
(require 'cursor-change)
(cursor-change-mode)

;; Directly new line and indent
(defun direct-new-line-and-indent nil
    "Directly make a new line and indent from any place"
    (interactive)
    (end-of-line)
    (newline-and-indent))
(global-set-key "\C-j" 'direct-new-line-and-indent)
(global-set-key (kbd "C-c j") 'newline-and-indent)

;; copy line no matters where cursor is
(defun copy-line (&optional arg)
"Save current line into Kill-Ring without mark the line"
(interactive "P")
(let ((beg (line-beginning-position))
    (end (line-end-position arg)))
(copy-region-as-kill beg end))
)
(define-key global-map (kbd "C-c l") 'copy-line)

;; set window size
(setq default-frame-alist
'((height . 40) (width . 180)))

;; scroll screen without cursor moved
(global-set-key [(meta n)] 'window-move-up)
(global-set-key [(meta p)] 'window-move-down)
(defun window-move-up (&optional arg)
"Current window move-up 2 lines."
(interactive "P")
(if arg
(scroll-up arg)
(scroll-up 2)))

(defun window-move-down (&optional arg)
"Current window move-down 3 lines."
(interactive "P")
(if arg
(scroll-down arg)
(scroll-down 3)))

;; set scroll to be smoothly
(setq scroll-margin 3 scroll-conservatively 10000)

;;; customize.el ends here
