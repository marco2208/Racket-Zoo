#lang slideshow

(require 2htdp/image)

(require "panda.rkt")
(require "Rhino.rkt")
(require "Snake.rkt")
(require "Penguin.rkt")


(define (scene n)
  (let ((spacer (rectangle (/ n 10) 10 "solid" "transparent"))
        (txt (text "Zoo" (/ n 2) "olive")))

    (above txt (beside/align "bottom" penguin spacer (panda_scene n) spacer (rhino n) (draw-snake n)))
  ))

(scene 100)


(save-image (scene 100) "scene.png")
