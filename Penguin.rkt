#lang racket

(require 2htdp/image)

(define n 70)

;All body parts and shading 
(define head (circle (* 2 n) "solid" "black"))
(define beak (triangle/sss 80 100 140 "solid" "orange"))
(define body (ellipse (* 6 n) (* 10 n) "solid" "black"))
(define belly (ellipse (* 3 n) (* 8 n) "solid" "grey"))
(define tone (ellipse (* 1.9 n) (* 1.6 n) "solid" "yellow"))
(define pupils (circle (* 0.25 n) "solid" "black"))
(define eyes (circle (* 0.5 n) "solid" "white")) 
(define feet (rectangle (* 3 n) n "solid" "orange"))
(define arm (ellipse (* 3 n) (* 6 n) "solid" "black"))

; Rotate the arms
(define left-arm (rotate 20 arm))
(define right-arm (rotate -20 arm))

;Googly eyes
(define googly-eye (overlay/offset pupils (* 0.2 n) 0 eyes)) 
(define eyes-with-pupils (beside googly-eye googly-eye))
(define head-with-eyes (overlay/align "center" "top" eyes-with-pupils head))

; Combine the head and beak
(define head-beak (overlay/offset beak (- (* 0.2 n)) (- (* 0.6 n)) head-with-eyes))

; Combine the belly and tone
(define belly-tone (overlay/align "center" "top" tone belly))

; Combine the body and belly-tone
(define body-belly (overlay/align "center" "middle" belly-tone body))

;Arms to body
(define body-arms (overlay/offset left-arm (- (* 3 n)) 0 
                  (overlay/offset right-arm (* 3 n) 0 body-belly)))

; Combine the body-arms with feet
(define body-arms-feet (overlay/align "center" "bottom" feet body-arms))

;Call for penguin
(define penguin (above head-beak body-arms-feet))
