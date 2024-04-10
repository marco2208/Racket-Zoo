;Eric Nunez Rodriguez
#lang slideshow
(require 2htdp/image)
(provide rhino)

(define (head-frame n)
  (above/align "left"
               (horns n)
               (rectangle (+ n 20) n "solid" "dark gray")))

(define (head-eye n)
          (overlay/align/offset
           "middle" "middle"
           (eye n)
           5  5
           (head-frame n)))

(define (horns n)
  (beside/align "bottom"
                (isosceles-triangle (/ n 2) 35 "outline" "black")
                (isosceles-triangle (/ n 3) 25 "outline" "black")))

(define (eye n)
  (place-image
   (circle (/ n 20) "solid" "white")
   7 5
   (circle (/ n 10) "solid" "black")))

(define (nose n)
  (ellipse (/ n 6) (/ n 14) "solid" "black"))

(define (ear n)
  (rhombus (/ n 6) (/ n 3) "solid" "dark gray"))

(define (head n)
  (rotate 30
          (overlay/align/offset
           "left" "middle"
           (nose n)
            0  5
           (head-eye n))))

(define (move n)
  (above/align "right"
   (rectangle 35 35 "solid" "transparent")
   (head n)))

(define (full-head n)
  (overlay/align/offset
           "middle" "top"
           (ear n)
            -33  -4
           (move n)))

(define (body n)
  (above
   (rectangle 35 35 "solid" "transparent")
   (beside/align "bottom"
                (above
                 (rectangle (+ n 20) (+ n 20) "solid" "dark gray")
                 (beside/align "bottom"
                  (nail n)
                  (rectangle (/ n 4) (/ n 1.6) "solid" "dark gray")))
                (above
                 (rectangle (+ n 10) (+ n 10) "solid" "dark gray")
                 (beside/align "bottom"
                  (nail n)
                  (rectangle (/ n 4) (/ n 1.6) "solid" "dark gray"))))))

(define (nail n)
  (rotate 90 (right-triangle (/ n 5) (/ n 6) "solid" "black")))


(define (tail n)
  (beside/align "bottom"
                (add-curve (rectangle (/ n 2) (/ n 2) "solid" "transparent")
                           0 (/ n 5) 0 0.7
                           (/ n 2) (/ n 2.2) 0 0.7
                           "black")
                (rotate -5 (ellipse (/ n 5) (/ n 10) "solid" "black"))))

(define (full-body n)
  (beside (body n) (tail n)))

(define (rock1 n)
  (overlay/offset
             (overlay/offset (circle (/ n 5) "solid" "gray")
                  10 -30
                  (circle (/ n 1.9) "solid" "gray"))
                  40 -10
             (overlay/offset (circle (/ n 5) "solid" "gray")
                  50 25
                  (circle (/ n 1.9) "solid" "gray"))))

(define (rock2 n)
  (overlay/offset
             (overlay/offset (circle (/ n 5) "solid" "gray")
                  30 0
                  (circle (/ n 2.5) "solid" "gray"))
                  35 -20
             (overlay/offset (circle (/ n 5) "solid" "gray")
                  60 15
                  (circle (/ n 2.5) "solid" "gray"))))


(define (animal n)
   (beside (full-head n) (full-body n)))

(define (rhino n)
  (beside/align "bottom" (rock1 n) (animal n) (rock2 n)))
