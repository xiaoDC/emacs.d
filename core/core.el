;;; core.el --- The heart of the beast
;;
;;; Naming conventions:
;;
;;   shadow-...     A public variable/constant or function
;;   shadow--...    An internal variable or function (non-interactive)
;;   shadow/...     An autoloaded function
;;   shadow:...     An ex command
;;   shadow|...     A hook
;;   shadow*...     An advising function
;;   ...!         Macro, shortcut alias or subst defun
;;   @...         Autoloaded interactive lambda macro for keybinds
;;
;;; Autoloaded functions are in {core,modules}/defuns/defuns-*.el

;; Premature optimization for faster startup
(setq-default gc-cons-threshold 339430400
              gc-cons-percentage 0.6)

;;
;; Global Constants
;;


(defconst shadow-version "0.0.1"
  "Current version of Shadow Emacs")

(defconst shadow-emacs-dir
  ;; (expand-file-name user-emacs-directory)
  "/Users/fri3nds/myself/emacs.d"
  "The path to this emacs.d directory")


(require 'core-ui)
(require 'core-evil)

(provide 'core)
