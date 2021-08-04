;;; anaphora-anywhere --- Anaphora, not just for macros anymore.
;;; Copyright (C) 2021 John Maraist
;;;
;;; Author/maintainer: John Maraist <elisper _ john at maraist dot org>
;;; Homepage: https://github.com/jphmrst/anaphora-anywhere
;;;
;;; Anaphora-anywhere is free software: you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version.
;;;
;;; Anaphora-anywhere is distributed in the hope that it will be
;;; useful, but WITHOUT ANY WARRANTY; without even the implied
;;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;;; See the GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Anaphora-anywhere.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;;
;;; Anaphoric macros bind a special variable (such as IT) to the last
;;; noted calculation.  The word "anaphoric" refers to the linguistic
;;; rule that a pronoun like "it" refers to the most recent object
;;; mentioned in a text.  This library provides anaphoric reference in
;;; arbitrary contexts, not just certain macro calls, at the cost of
;;; making the binding reference explicit.

;;; Code:

(defconst +anaphora-anywhere/store+ (make-hash-table :test 'eql)
  "Storage for most recent referents.")

(defun its (value &optional which)
  "Note VALUE for subsequent anaphoric reference.
If WHICH is provided, used to index among multiple tracked recent values."
  (unless which (setf which 0))
  (puthash which value +anaphora-anywhere/store+)
  value)

(defun it (&optional which)
  "Return the most recent value tagged via ITS.
If WHICH is provided, used to index among multiple tracked recent values."
  (unless which (setf which 0))
  (gethash which +anaphora-anywhere/store+))

(provide 'anaphora-anywhere)
;;; anaphora-anywhere ends here
