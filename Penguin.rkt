#lang racket

(require 2htdp/image)

; Define the parts of the penguin
(define head (circle 20 "solid" "black"))
(define beak (wedge 20 35 "solid" "orange"))
(define body (ellipse 60 100 "solid" "black"))
(define belly (ellipse 30 80 "solid" "grey"))
(define feet (rectangle 30 10 "solid" "orange"))
(define arm (ellipse 30 60 "solid" "black"))

; Rotate the arms 
(define left-arm (rotate 20 arm))
(define right-arm (rotate -20 arm))

; Combine the head and beak
(define head-beak (overlay/align "left" "middle" beak head))

; Combine the body and belly
(define body-belly (overlay/align "center" "middle" belly body))


; Adjust the offsets 
(define body-arms (overlay/offset left-arm (- 30) 0 
                  (overlay/offset right-arm 30 0 body-belly)))

; Combine the body-arms with feet
(define body-arms-feet (overlay/align "center" "bottom" feet body-arms))

; Position the parts to form the penguin silhouette
(define penguin (above head-beak body-arms-feet))
