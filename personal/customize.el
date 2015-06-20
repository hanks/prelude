;;; package --- Summary:
;;; Commentary:
;;; customize for hanks

;;; Code:

;; no scroll bar
(set-scroll-bar-mode nil)

;; use nlinum
;; Preset width nlinum
(add-hook 'nlinum-mode-hook
          (lambda ()
            (setq nlinum--width
              (length (number-to-string
                       (count-lines (point-min) (point-max)))))))
(global-nlinum-mode t)

;;; customize.el ends here
