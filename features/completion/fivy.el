;;; fivy.el --- Initialize ivy. -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Serghei Iakovlev

;; Author: Serghei Iakovlev (concat "sadhooklay" "@" "gmail" ".com")
;; URL: https://github.com/sergeyklay/.emacs.d
;;
;; This file is not part of GNU Emacs.
;;
;; License: GPLv3

;;; Commentary:

;; This frature adds Ivy, a completion backend for GNU Emacs.

;;; Code:

;;; Ivy

(use-package ivy
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  (setq
   ;; Show candidate index and total count
   ivy-count-format "(%d/%d) "
   ;; Number of lines for the minibuffer window
   ivy-height 12
   ;; do not set `completion-in-region-function'
   ivy-do-completion-in-region nil
   ;; Wrap around after the first and the last candidate
   ivy-wrap t
   ;; Fix the height of the minibuffer during ivy completion
   ivy-fixed-height-minibuffer t
   ;; Add recent files and bookmarks to `ivy-switch-buffer'
   ivy-use-virtual-buffers t
   ;; Don't use ^ as initial input
   ivy-initial-inputs-alist nil
   ;; Highlight til EOL
   ivy-format-function #'ivy-format-function-line
   ;; Allow minibuffer commands while in the minibuffer
   enable-recursive-minibuffers t
   ;; Disable magic slash on non-match
   ivy-magic-slash-non-match-action nil))

(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; Counsel
(use-package counsel
  :requires ivy
  :config
  (setq counsel-find-file-ignore-regexp
        "\\(?:^[#.]\\)\\|\\(?:[#~]$\\)\\|\\(?:^Icon?\\)"))

;; Replace standard keybindings
(global-set-key (kbd "C-x C-f") #'counsel-find-file)
(global-set-key (kbd "C-x r")   #'counsel-recentf)
(global-set-key (kbd "M-x")     #'counsel-M-x)
(global-set-key (kbd "C-c k")   #'counsel-ag)
(global-set-key (kbd "C-h a")   #'counsel-apropos)
(global-set-key (kbd "C-h v")   #'counsel-describe-variable)
(global-set-key (kbd "C-h f")   #'counsel-describe-function)
(global-set-key (kbd "C-h b")   #'counsel-descbinds)

(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(provide 'fivy)
;;; fivy.el ends here
