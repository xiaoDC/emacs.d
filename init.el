;; -*- coding: utf-8 -*-
;;; init.el --- Emacs Initialization File
;;
;; Copyright (c) 2017

;; Author:
;; URL:
;; Version: 1.0.0
;;
;; These demons are not part of GNU Emacs.
;;
;;; License: MIT

;; 设置包管理器路径
(require 'package)
(setq package-archives '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
                         ("org-cn"   . "https://elpa.zilongshanren.com/org/")
                         ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/"))
      package-enable-at-startup nil)
;; 设置package-enable-at-startup的意义是防止重复加载包影响性能
;; 从这里抄来的:https://lambeta.com/2017/01/01/Emacs-configs-for-a-clojurian
(package-initialize)

;; 模块化配置,模块的配置文件在~/.emacs.d/lisp下
(setq user-emacs-directory "/Users/cris/git-repo/doom-emacs/")
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; 设定shell执行目录
(add-to-list 'exec-path "/usr/local/bin")

;; 安装use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; 这个eval-when-compile的意思是,把包编译成elc字节码，提高装载速度
(eval-when-compile
  (require 'use-package))

;; 设置gc阈值
(setq gc-cons-threshold most-positive-fixnum)
(defconst initial-gc-cons-threshold gc-cons-threshold
  "初始gc阈值")
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold initial-gc-cons-threshold)))

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; 显示行号
(global-linum-mode 1)
;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

(require 'init-evil)
