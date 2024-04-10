; Marco Erazo

#lang slideshow
(provide panda_scene)

(require 2htdp/image)


(define (panda_head n)
  (let ((face (overlay/offset (nose n) 0 (/ n -20)
                  (overlay/offset (mouth n) 0 (/ n -6)
                  (overlay/offset (righteye n) (/ n 5) (/ n 15)
                  (overlay/offset (lefteye n) (/ n -5) (/ n 15) 
                  (head n)))))))
    (underlay/offset (ear n) (/ n -3) (/ n 4) 
     (underlay/offset (ear n) (/ n 3) (/ n 4)   
      (overlay face (head_outline n))))))


(define (head n)
  (ellipse n (- n (/ n 5)) "solid" "white")
  )

(define (head_outline n)
  (ellipse n (- n (/ n 5)) "outline" "black")
  )

(define (righteye n)
  (let ((black_part (rotate 50 (ellipse (/ n 3) (/ n 4) "solid" "black")))
        (white_part (circle (/ n 25) "solid" "white")))
  (overlay white_part black_part)))

(define (lefteye n)
  (let ((black_part (rotate -50 (ellipse (/ n 3) (/ n 4) "solid" "black")))
        (white_part (circle (/ n 25) "solid" "white")))
  (overlay white_part black_part)))

(define (nose n)
  (rotate 180  (triangle (/ n 10) "solid" "black"))
  )

(define (ear n)
  (circle (/ n 5) "solid" "black"))

(define (mouth n)
  (overlay/offset (ellipse (/ n 6) (/ n 10) "solid" "light red") 0 -5
  (rectangle (/ n 6) (/ n 20) "solid" "light red"))
  ) 

;-------------------------------------------------------------------------

(define (panda_body n)
  (underlay/offset (legs n) (/ n -2) (/ n -2.5)
  (underlay/offset (legs n) (/ n 4) (/ n -2)
  (underlay/offset (right_arm n) (/ n -2) (/ n 4)
  (underlay/offset (left_arm n) (/ n 2) (/ n 4)
                   (overlay (body n) (body_outline n))))))
  )

(define (body n)
  (ellipse n (+ n 20) "solid" "white")
  )

(define (body_outline n)
  (ellipse n (+ n 20) "outline" "black")
  )

(define (left_arm n)
(rotate -120 (ellipse (/ n 3) (- n 20) "solid" "black"))
  )

(define (right_arm n)
(rotate 60 (ellipse (/ n 3) (- n 20) "solid" "black"))
  )

(define (legs n)
(ellipse (/ n 3) (/ n 2) "solid" "black")
  )

;-------------------------------------------------------------------------

(define (bamboo n)
  (above (pieces n)
         (pieces n)
         (pieces n)
         (pieces n))
  )

(define (pieces n)
  (let ((solid-piece (rectangle (/ n 5) (/ n 2) "solid" "yellow green"))
        (outline-piece (rectangle (/ n 5) (/ n 2) "outline" "black")))
    (overlay solid-piece outline-piece)))


;-------------------------------------------------------------------------

(define (panda_scene n)
  (let ((panda (overlay/xy (panda_head n) (/ n -3)  (/ n 1.25) (panda_body n)))
        (left_bamboo (bamboo n))
        (right_bamboo (bamboo n))
        (spacer (rectangle (/ n 10) 10 "solid" "transparent")))
    (beside/align "bottom" left_bamboo spacer panda spacer right_bamboo)))









