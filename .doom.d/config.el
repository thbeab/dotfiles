;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Thomas Beaugendre"
      user-mail-address "thomas.beaugendre974@gmail.com")

(setq doom-theme 'doom-gruvbox)


(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq vhdl-basic-offset 4
        vhdl-standard '(08 nil))

(setq flycheck-ghdl-language-standard "08"
      flycheck-ghdl-workdir "./work")

;; org mode tweakings
(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  (require 'find-lisp)
  (setq org-directory "~/org/"
        org-agenda-files (find-lisp-find-files "~/org/agenda/" "\.org")
        org-archive-location "~/org/datetree.org::datetree/* Finished Tasks")

  (defun thomas/org-archive-done-tasks ()
    "Archive all done tasks."
    (interactive)
    (org-map-entries 'org-archive-subtree "/DONE" 'file))

  (setq org-log-done 'time
      org-log-into-drawer t
      org-log-state-notes-insert-after-drawers nil)

  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/org/agenda/inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %a")))

  (setq org-overriding-columns-format "%TODO %EFFORT %1PRIORITY %100ITEM %TAGS")

  (setq org-refile-allow-creating-parent-nodes 'confirm))

(after! org-roam
  (map! :leader
        :prefix "n"
        :desc "org-roam" "l" #'org-roam
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-switch-to-buffer" "b" #'org-roam-switch-to-buffer
        :desc "org-roam-find-file" "f" #'org-roam-find-file
        :desc "org-roam-graph-sho" "g" #'org-roam-show-graph
        :desc "org-roam-insert" "i" #'org-roam-insert
        :desc "org-roam-capture" "c" #'org-roam-capture)
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "websites/${slug}"
           :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
           :unnarrowed t))))
(after! deft
  (setq deft-directory "~/org/roam"))
