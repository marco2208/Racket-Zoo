#lang racket
(require 2htdp/image)

(define (draw-snake n)
  ;; Define eye and eyes
  (define eye (overlay (circle 2 'solid 'black) (circle 8 'solid 'white)))
  (define eyes (beside eye eye))
  
  ;; Define tongue
 (define tongue (overlay (rotate -15 (line 15 1 'red))
                        (rotate 15 (line 15 1 'red))))

  ;; Define head with eyes, tongue, and green circle for body
  (define head (overlay/xy tongue 0 -20
               (overlay/xy eyes 1 0
                 (circle 20 'solid 'green))))
  
  ;; Define body segments as a list of green circles
  (define body-segments (make-list n (circle 10 'solid 'green)))
  
  ;; Define body which will align vertically with body segments
  (define body (apply beside/align "bottom" body-segments))
  
  ;; Overlay head on top of the aligned body
 (overlay/align 'left "bottom" head body))
