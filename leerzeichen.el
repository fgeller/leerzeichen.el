(defgroup leerzeichen nil
  "Faces for highlighting whitespace characters."
  :group 'leerzeichen)

(defface leerzeichen '((t (:foreground "#585858")))
  "Face for `leerzeichen-mode'."
  :group 'leerzeichen)

(defvar leerzeichen-saved-buffer-display-table nil
  "Stored version of `buffer-display-table' before leerzeichen-mode was enabled.")

(defvar leerzeichen-line-feed-glyph (make-glyph-code ?$ 'leerzeichen))
(defvar leerzeichen-tab-glyph (make-glyph-code ?» 'leerzeichen))
(defvar leerzeichen-space-glyph (make-glyph-code ?· 'leerzeichen))

(defvar leerzeichen-display-table
  (let ((table (make-display-table)))
    (aset table ?\n `[,leerzeichen-line-feed-glyph ?\n])
    (aset table ?\t `[,leerzeichen-tab-glyph])
    (aset table ?\  `[,leerzeichen-space-glyph])
    table)
  "Display table to highlight whitespace characters.")

(define-minor-mode leerzeichen-mode
  "Minor mode to highlight whitespace characters by displaying them differently."
  nil "lz" nil
  (if leerzeichen-mode
      (leerzeichen-enable)
    (leerzeichen-disable)))

(defun leerzeichen-enable ()
  (when buffer-display-table
    (setq leerzeichen-saved-buffer-display-table buffer-display-table))
  (setq buffer-display-table leerzeichen-display-table))

(defun leerzeichen-disable ()
  (setq buffer-display-table leerzeichen-saved-buffer-display-table))
