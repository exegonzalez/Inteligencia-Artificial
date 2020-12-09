;; /r/dailyprogrammer #249 Intermediate
;; Evolutionary algorith to write "Hello, World!"
;; Jan 14. 2016
;; Exec command "clisp path/to/file.lisp population string"

(defparameter *target* (cadr *args*))
(defparameter *pop-size* (parse-integer (car *args*)))

;; (defparameter *chars* ".<>=+-`~#ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 '!?;:\/,")
(defparameter *chars* "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ")

(defvar population (append '() '())) ; init empty array

(defun random-string (length)
   (coerce (loop repeat length collect (aref *chars* (random (length *chars*)))) 'string)) ; magic from SO

;; initialize with x pop and calc fitness
(defun initialize ()
   (loop repeat *pop-size* do
      (let ((tmp-str (random-string (length *target*)))) ; generate random string
       (setf population (append population
         (list
           (list tmp-str
              (levenshtein-distance tmp-str *target*)))))))) ; calc fitness

;; get lowest value in pop
(defun get-lowest ()
   (reduce #'min (mapcar #'car (mapcar #'cdr population))))

;; get the values of the best fitted pops
(defun select-by-fitness (fitness)
   (remove nil (map 'list #'(lambda (x) (if (= fitness (car (cdr x))) (car x))) population)))

;; crossover function
(defun crossover (strings)
   (return-from crossover (list
      (concatenate 'string
         (subseq (car strings) 0 4)
         (subseq (cadr strings) 4))
      (concatenate 'string
         (subseq (cadr strings) 0 4)
         (subseq (car strings) 4)))))

;; mutate function
(defun mutate (str1)
   (let ((rs1 (make-random-state t))
      (new-string ""))
   (loop for i upto (1- (length str1)) do
      (if (= 0 (random (length *target*) rs1))
         (let ((random-char (random-string 1)))
            (setq new-string (concatenate 'string new-string random-char)))
            (setq new-string (concatenate 'string new-string (string (aref str1 i))))))
         (return-from mutate new-string)))

;; calculates fitness, lower is better
;; (defun hamming-distance (str1 str2)
;;    (if (eq (length str1) (length str2))
;;       (let ((errs 0))
;;       (loop for i upto (1- (length str1)) do ; beacuse of 0-based indexing

;;    (if (string= (subseq str1 i (+ i 1)) (subseq str2 i (+ i 1))) ; check if strings[i] are equal
;;       (continue) ; pass
;;       (setf errs (1+ errs)))) ; inc. errs
;;    (return-from hamming-distance errs)) ; return errs, aka n chars different
;;    (return-from hamming-distance nil))) ; if length is not the same

;; calculates fitness, lower is better
(defun levenshtein-distance (str1 str2)
  "Calculates the Levenshtein distance between str1 and str2, returns an editing distance (int)."
  (let ((n (length str1))
        (m (length str2)))
    ;; Check trivial cases
    (cond ((= 0 n) (return-from levenshtein-distance m))
          ((= 0 m) (return-from levenshtein-distance n)))
    (let ((col (make-array (1+ m) :element-type 'integer))
          (prev-col (make-array (1+ m) :element-type 'integer)))
      ;; We need to store only two columns---the current one that
      ;; is being built and the previous one
      (dotimes (i (1+ m))
        (setf (svref prev-col i) i))
      ;; Loop across all chars of each string
      (dotimes (i n)
        (setf (svref col 0) (1+ i))
        (dotimes (j m)
          (setf (svref col (1+ j))
                (min (1+ (svref col j))
                     (1+ (svref prev-col (1+ j)))
                     (+ (svref prev-col j)
                        (if (equal (schar str1 i) (schar str2 j)) 0 1)))))
        (rotatef col prev-col))
      (svref prev-col m))))

;; take n best from prev gen and remove from pop
(defun best-matches (n)
   (let* ((sorted-pop (stable-sort population #'< :key #'cadr))
      (result (subseq sorted-pop 0 n)))
   (return-from best-matches result)))

;; create a new population of n size
(defun gen-new-pop ()
   (let ((new-pop (append '() '())))
    (loop while (< (length new-pop) *pop-size*) do
      (setf new-pop (append new-pop (crossover (mapcar #'car (best-matches 2)))))) ; gen and crossover
    (setf new-pop (loop for item on new-pop collect (mutate (car item))))
    (setf population (mapcar #'list new-pop (loop for item on new-pop collect (levenshtein-distance *target* (car item)))))))

;; evolve!
(defun evolve (&optional (age 1))
   (let ((low (get-lowest)))
     (format t "Gen ~a. Fitness: ~a~%Best match: ~a.~%~%" age low (car (select-by-fitness low)))
     (if (= low 0)
        (format t "Done! Generation: ~a~%" age)
        (progn
           (gen-new-pop)
           (evolve (1+ age))))))

;; execute Main process
(initialize)
(evolve)
