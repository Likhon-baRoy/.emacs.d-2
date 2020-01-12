;;; jump.el --- GNU Emacs configuration for tags. -*- lexical-binding: t; -*-

;; Copyright (C) 2019-2020 Serghei Iakovlev <egrep@protonmail.ch>

;; Author: Serghei Iakovlev <egrep@protonmail.ch>
;; URL: https://github.com/sergeyklay/.emacs.d
;;
;; This file is NOT part of GNU Emacs.
;;
;; License: GPLv3

;;; Commentary:

;; Tags realated features for GNU Emacs.

;;; Code:

(eval-when-compile
  (require 'etags))

(defconst global-executable-path (executable-find "global")
  "The global executable path on this system.")

;; A front-end for accessing the gtags-generated tags.
;; For more see URL `https://github.com/leoliu/ggtags'
(use-package ggtags
  :if global-executable-path
  :config
  (unbind-key "M-]" ggtags-mode-map)
  (unbind-key "M-o" ggtags-navigation-map)
  :bind (:map ggtags-mode-map
	 ("C-c g s" . 'ggtags-find-other-symbol)
	 ("C-c g h" . 'ggtags-view-tag-history)
	 ("C-c g r" . 'ggtags-find-reference)
	 ("C-c g f" . 'ggtags-find-file)
	 ("C-c g c" . 'ggtags-create-tags)
	 ("C-c g u" . 'ggtags-update-tags)
	 ("M-."     . 'ggtags-find-tag-dwim)
	 ("M-,"     . 'pop-tag-mark)
	 ("C-c <"   . 'ggtags-prev-mark)
	 ("C-c >"   . 'ggtags-next-mark)
	 :map ggtags-navigation-map
	 ("M-l"     . 'ggtags-navigation-visible-mode)))

;; Make Emacs reload the TAGS file automatically
(setq tags-revert-without-query 1)

;; t=case-insensitive, nil=case-sensitive
(setq tags-case-fold-search nil)

;; Never “Keep current list of tags tables also”
(setq tags-add-tables nil)

(provide 'jump)
;;; jump.el ends here
