;;; init.el --- Initialization file. -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Serghei Iakovlev

;; Author: Serghei Iakovlev (concat "sadhooklay" "@" "gmail" ".com")
;; URL: https://github.com/sergeyklay/.emacs.d
;;
;; This file is not part of GNU Emacs.
;;
;; License: GPLv3

;;; Commentary:

;; This file is used as a bootstrap for my Emacs.

;;; Code:

(require 'core (concat user-emacs-directory "features/core"))

(require 'core-pkg)     ; Packaging related features
(require 'appearance)   ; Appearance related settings
(require 'user)         ; Personalization

(setq custom-file (concat user-etc-dir "custom.el"))
(load custom-file t)

(require 'secure)       ; Security related features
(require 'windows)      ; Windows management features
(require 'modeline)     ; Modeline related configuration
(require 'projects)     ; Project navigation and management
(require 'comp-any)     ; Setting up company
(require 'comp-ivy)     ; Initialize ivy, counsel and swiper
(require 'jump)         ; Setting up tags and code navigation
(require 'vcs)          ; VCS related features
(require 'spell)        ; Spell configuration
(require 'shells)       ; Shells configuration
(require 'org-lang)     ; Org related configuration
(require 'cc-lang)      ; Support for the C-family of languages
(require 'php-lang)     ; PHP related configuration
(require 'hs-lang)      ; Haskell configuration
(require 'lisp-lang)    ; Configure the Lisp-family of languages
(require 'md-lang)      ; Add markdown support
(require 'ms-lang)      ; Add support for M$ scripts
(require 'editor)       ; Features related to the behavior of the editor
(require 'irc)          ; IRC tools
(require 'syntax-check) ; Syntax checkers

;; deprecated
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
	'((org-plus-contrib . "org"))))

;; deprecated
(org-babel-load-file
 (expand-file-name "settings.org" user-emacs-directory))

;;; init.el ends here
