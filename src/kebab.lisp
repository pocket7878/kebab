(in-package :cl-user)
(defpackage kebab
  (:use :cl
        :alexandria)
  (:import-from :split-sequence
                :split-sequence)
  (:export :to-camel-case
           :to-snake-case
           :to-pascal-case
           :to-kebab-case
           :to-lisp-case))

(in-package :kebab)

(defvar *separators*
  `(#\Space #\Newline #\_ #\-))

(defun classify-char (char)
  (cond
    ((member char *separators*)
     :separator)
    ((both-case-p char)
     (if (upper-case-p char)
         :upper
         :lower))
    (t
     :noncase)))

(defun classify-string (string)
  (loop
     for c across string
     collect (cons c (classify-char c))))

(defun split-on-separator (classified-string)
  (remove-if #'null
             (split-sequence :separator classified-string
                             :key #'cdr)))

(defun split-on-case (classified-string)
  (labels ((split-on-separator% (tmp acc prev str)
             (cond
               ((null str)
                (nreverse (cons (nreverse tmp) acc)))
               ((and (eql :lower (cdr prev))
                     (eql :upper (cdr (car str))))
                (split-on-separator%
                 `(,(car str))
                 (cons (nreverse tmp) acc)
                 (car str)
                 (cdr str)))
               (t
                (split-on-separator%
                 (cons (car str) tmp)
                 acc
                 (car str)
                 (cdr str))))))
    (split-on-separator%
     `(,(car classified-string))
     '()
     (car classified-string)
     (cdr classified-string))))

(defun split-classified-string (classified-string)
  (mapcan (lambda (cs)
            (split-on-case cs))
          (split-on-separator classified-string)))

(defun unclassify-string (classified-string)
  (if (not (null classified-string))
      (coerce (mapcar #'car classified-string) 'string)
      ""))

(defun split (string)
  (mapcar #'unclassify-string
          (split-classified-string (classify-string string))))

(defun join (sep str-list)
 (format nil (concatenate 'string "~{~A~^" sep "~}") str-list))

(defun convert-case (string head-fn rest-fn separator)
  (let ((splited-string (split string)))
    (if (> (length splited-string) 1)
        (join separator
              (cons
               (funcall head-fn (car splited-string))
               (mapcar rest-fn (cdr splited-string))))
        (funcall head-fn (car splited-string)))))

(defun save-type-convert-case (val head-fn rest-fn separator)
  (etypecase val
    (string (convert-case val head-fn rest-fn separator))
    (keyword
     (let ((name (symbol-name val)))
       (make-keyword (convert-case name head-fn rest-fn separator))))
    (symbol
     (let ((name (symbol-name val)))
       (symbolicate (convert-case name head-fn rest-fn separator))))))

(defmacro define-converter (case-name head-fn rest-fn sep)
  (let ((str-gen (gensym)))
    `(defun ,(symbolicate (string-upcase
                           (format nil "to-~A" case-name))) (,str-gen)
       (save-type-convert-case ,str-gen ,head-fn ,rest-fn ,sep))))

(define-converter pascal-case #'string-capitalize #'string-capitalize "")
(define-converter camel-case  #'string-downcase #'string-capitalize "")
(define-converter snake-case #'string-downcase #'string-downcase "_")
(define-converter kebab-case #'string-downcase #'string-downcase "-")
(define-converter lisp-case #'string-downcase #'string-downcase "-")

