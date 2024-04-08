#lang slideshow

(require 2htdp/image)

(require "panda.rkt")
(require "Rhino.rkt")


(define (scene n)
  (let ((spacer (rectangle (/ n 10) 10 "solid" "transparent"))
        (txt (text "Zoo" (/ n 2) "olive")))

    (above txt (beside/align "bottom" (panda_scene n) spacer (rhino n)))
  ))

(scene 100)