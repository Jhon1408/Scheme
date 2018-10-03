;;-----------------------------------------;;
(require (lib "graphics.ss" "graphics"))
(open-graphics)
(define vec (make-vector 6))
(define puntos (make-vector 1))
(require (planet clements/rsound))
;;-----------------------------------------;;

;;-----------------------------------------;;
(define (colores x)
  (cond
    [(= x 0) "green"]
    [(= x 1) "blue"]
    [(= x 2) "red"]
    [(= x 3) "yellow"]
    [(= x 4) "purple"]
    [(= x 5) "magenta"]
    [(= x 6) "orange"]
    [(= x 7) "pink"]
    [(= x 8) "Lime"]
    [(= x 9) "ForestGreen"]
    [(= x 10) "Tomato"]
    [(= x 11) "gold"]
    [(= x 12) "Violet"]
   )
 )
;;-----------------------------------------;;
(define (music x)
  (if (= x 0)
      (play-sound "A.wav" 2)
      )
  (if (= x 1)
      (play-sound "A.wav" 2)
      )
  (if (= x 2)
      (play-sound "B.wav" 2)
      )
  ) 
;;-----------------------------------------;;
(define (getclickposn v)
  (mouse-click-posn (get-mouse-click v))
  )

 
(define (iniciar)
  (define ventana1 (open-viewport "Tubularix" 1024 720))
  ((draw-viewport ventana1) "black")
  (botones ventana1 1024 720 0)
  (jugar/salir ventana1 1024 720 (getclickposn ventana1) 0)
  )

(define (botones ventana x y cont)
  ((draw-rectangle ventana) (make-posn (- (/ x 2) 50) (- (/ y 2) 50)) 100 50 "white")
  ((draw-rectangle ventana) (make-posn (- (/ x 2) 50) (+ (/ y 2) 40)) 100 50 "white")
  ((draw-pixmap ventana) "tubularixlogo.png" (make-posn 212 50) "white")
  ((draw-pixmap ventana) "jugar.png" (make-posn (- (/ x 2) 49) (- (/ y 2) 49)))
  ((draw-pixmap ventana) "salir.png" (make-posn (- (/ x 2) 49) (+ (/ y 2) 41)))
  )

(define (jugar/salir ventana x y click cont)
  (if (<= cont 100)
      (if (and (and (>= (posn-x click) 462) (<= (posn-x click) 562)) (and (>= (posn-y click) 310) (<= (posn-y click) 360)))
          (begin
            (clear-viewport ventana)
            ((draw-viewport ventana) "black")
            (iniciar-tubularix ventana 0)
            )
          (if (and (and (>= (posn-x click) 462) (<= (posn-x click) 562)) (and (>= (posn-y click) 400) (<= (posn-y click) 450)))
              (begin
                (close-viewport ventana)
                )
              (jugar/salir ventana x y (getclickposn ventana) (+ 1 cont))
              )
          )
      (close-viewport ventana)
      )
  )



(define (iniciar-tubularix ventana cont)
  (music (random 2))
  ;cuadro de siguiente
  ((draw-rectangle ventana) (make-posn 900 30) 61 61 "white")
  ((draw-line ventana) (make-posn 930 30) (make-posn 930 90) "white")
  ((draw-line ventana) (make-posn 900 60) (make-posn 960 60) "white")
  ((draw-string ventana) (make-posn 900 28) "Siguiente:" "white")
  ((draw-string ventana) (make-posn 820 417) "Puntos: " "white")
  ((draw-string ventana) (make-posn 880 417) "0" "white")

  
  ;mini tubularix
  ((draw-rectangle ventana) (make-posn 820 420) 181 241 "white")
  
  ;lines
  (begin
    
    ;lines horizontales
    ((draw-line ventana) (make-posn 850 420) (make-posn 850 659) "white")
    ((draw-line ventana) (make-posn 880 420) (make-posn 880 659) "white")
    ((draw-line ventana) (make-posn 910 420) (make-posn 910 659) "white")
    ((draw-line ventana) (make-posn 940 420) (make-posn 940 659) "white")
    ((draw-line ventana) (make-posn 970 420) (make-posn 970 659) "white")

    ;lineas verticales
    ((draw-line ventana) (make-posn 820 450) (make-posn 999 450) "white")
    ((draw-line ventana) (make-posn 820 480) (make-posn 999 480) "white")
    ((draw-line ventana) (make-posn 820 510) (make-posn 999 510) "white")
    ((draw-line ventana) (make-posn 820 540) (make-posn 999 540) "white")
    ((draw-line ventana) (make-posn 820 570) (make-posn 999 570) "white")
    ((draw-line ventana) (make-posn 820 600) (make-posn 999 600) "white")
    ((draw-line ventana) (make-posn 820 630) (make-posn 999 630) "white")
    
    )

  
  ;poligono central                      1                 2                   3                     4                  5                   6
  ((draw-polygon ventana) (list (make-posn 80 130) (make-posn 100 100) (make-posn 130 100) (make-posn 150 130) (make-posn 130 160) (make-posn 100 160)) (make-posn 300 240) "white")

  ;poligono 0
  ((draw-polygon ventana) (list (make-posn 62.5 130) (make-posn 91 82.5) (make-posn 138.5 82.5) (make-posn 167.5 130) (make-posn 139 180) (make-posn 91 180)) (make-posn 300 240) "white")
  
  ;poligono 1
  ((draw-polygon ventana) (list (make-posn 45 130) (make-posn 82 65) (make-posn 147 65) (make-posn 185 130) (make-posn 147 200) (make-posn 82 200)) (make-posn 300 240) "white")
  
  ;poligono 2
   ((draw-polygon ventana) (list (make-posn 10 130) (make-posn 65 30) (make-posn 165 30) (make-posn 220 130) (make-posn 165 230) (make-posn 65 230)) (make-posn 300 240) "white")

  ;poligono 3
  ((draw-polygon ventana) (list (make-posn -40 130) (make-posn 45 -5) (make-posn 185 -5) (make-posn 270 130) (make-posn 185 270) (make-posn 45 270)) (make-posn 300 240) "white")
  
  ;poligono 4
  ((draw-polygon ventana) (list (make-posn -90 130) (make-posn 20 -55) (make-posn 210 -55) (make-posn 320 130) (make-posn 210 325) (make-posn 20 325)) (make-posn 300 240) "white")

  ;poligono 5
  ((draw-polygon ventana) (list (make-posn -140 130) (make-posn -5 -105) (make-posn 235 -105) (make-posn 370 130) (make-posn 235 380) (make-posn -5 380)) (make-posn 300 240) "white")
  
  ;poligono 6
  ((draw-polygon ventana) (list (make-posn -190 130) (make-posn -30 -155) (make-posn 260 -155) (make-posn 420 130) (make-posn 260 430) (make-posn -30 430)) (make-posn 300 240) "white")


  
  ;lines separadoras
  (sleep 0.2)
  ((draw-line ventana) (make-posn 380 370) (make-posn 110 370) "white")
  (sleep 0.2)
  ((draw-line ventana) (make-posn 400 340) (make-posn 270 85) "white")
  (sleep 0.2)
  ((draw-line ventana) (make-posn 430 340) (make-posn 560 85) "white")
  (sleep 0.2)
  ((draw-line ventana) (make-posn 450 370) (make-posn 720 370) "white")
  (sleep 0.2)
  ((draw-line ventana) (make-posn 430 400) (make-posn 560 670) "white")
  (sleep 0.2)
  ((draw-line ventana) (make-posn 400 400) (make-posn 270 670) "white")  

  (sleep 1)
  (start-game ventana 0 821 421 (colores (random 13)))
  
  )

(define (sacar-rojo ventana click)
  (rgb-red ((get-color-pixel ventana) click))
  )

(define (sacar-verde ventana click)
  (rgb-green ((get-color-pixel ventana) click))
  )

(define (sacar-azul ventana click)
  (rgb-blue ((get-color-pixel ventana) click))
  )
 
(define (detector ventana click)
  (if (and (= 0 (sacar-rojo ventana click)) (= 0 (sacar-verde ventana click)) (= 0 (sacar-azul ventana click)))
      #f
      #t 
      )
  ) 

(define (sacar-color ventana posn color)
  (if (and (= (sacar-rojo ventana color) (sacar-rojo ventana posn)) (= (sacar-verde ventana color) (sacar-verde ventana posn)) (= (sacar-azul ventana color) (sacar-azul ventana posn)))
      #t
      #f
      )
  )


  

(define (buscar-piezay ventana posx posy contx conty color)
  (if (<= conty 8)
      (if (<= contx 6)
          (if (and (detector ventana (make-posn posx posy)) (sacar-color ventana (make-posn posx posy) (make-posn 901 31)))                     
              posy
              (buscar-piezay ventana (+ posx 30) posy (+ 1 contx) conty (make-posn 901 31))
              )
          (buscar-piezay ventana (+ posx -180) (+ posy 30) 1 (+ 1 conty) (make-posn 901 31))
          )
      )
  )

(define (buscar-piezax ventana posx posy contx conty color)
  (if (<= conty 8)
      (if (<= contx 6)
          (if (and (detector ventana (make-posn posx posy)) (sacar-color ventana (make-posn posx posy) (make-posn 901 31)))                        
              posx
              (buscar-piezax ventana (+ posx 30) posy (+ 1 contx) conty (make-posn 901 31))
              )
          (buscar-piezax ventana (+ posx -180) (+ posy 30) 1 (+ 1 conty) (make-posn 901 31))
          )
      )
  )

 
                      

(define (esperar)
  (sleep 0.4)
  )

(define (bajar-piezas-uno ventana posx posy color contx)
          (if (detector ventana (make-posn posx posy))
              (if (not (detector ventana (make-posn posx (+ 30 posy))))
                  (begin                        
                    ((draw-solid-rectangle ventana) (make-posn posx posy) 29 29 "black")               
                    ((draw-solid-rectangle ventana) (make-posn posx (+ 30 posy)) 29 29 color)
                    )
                  (begin
                    (start-game ventana 0 821 421 (colores (random 13)))
                    )
                  )
              (bajar-piezas-uno ventana (+ posx 30) posy color (+ 1 contx))
              )
  ) 

(define (mover-derecha-uno ventana posx posy color contx)
  (if (<= contx 6)
          (if (detector ventana (make-posn posx posy))                                 
              (begin
                ((draw-solid-rectangle ventana) (make-posn posx posy) 29 29 "black")
                ((draw-solid-rectangle ventana) (make-posn (+ 30 posx) posy) 29 29 color)
                )
              (mover-derecha-uno ventana (+ posx 30) posy color (+ 1 contx))
              )
          )
  )

(define (mover-izquierda-uno ventana posx posy color contx)
  (if (<= contx 6)
          (if (detector ventana (make-posn posx posy))                                 
              (begin
                ((draw-solid-rectangle ventana) (make-posn posx posy) 29 29 "black")
                ((draw-solid-rectangle ventana) (make-posn (+ -30 posx) posy) 29 29 color)
                )
              (mover-derecha-uno ventana (+ posx 30) posy color (+ 1 contx))
              )
          )
  )



(define (bajar-piezas ventana posx posy color contx conty)
  (if (<= conty 8)
      (if (<= contx 6)
          (if (detector ventana (make-posn posx posy))
              (begin                   
                ((draw-solid-rectangle ventana) (make-posn posx posy) 29 29 "black")               
                ((draw-solid-rectangle ventana) (make-posn posx (+ 30 posy)) 29 29 color)
                (esperar)
                (bajar-piezas ventana (+ posx 30) posy color (+ 1 contx) conty)
                )
              (bajar-piezas ventana (+ posx 30) posy color (+ 1 contx) conty)
              )
          (bajar-piezas ventana (+ posx -180) (+ posy 30) color 1 (+ 1 conty))
          )
      (display "q pasa prro")
      )
  )
        




(define (esperar-movimiento key ventana posx posy color cont)
  (begin
    (if (symbol=? key 'right)
        (begin
          (mover-derecha-uno ventana posx posy color 0)
          (start-game ventana cont 821 421 color)
          )
        )
    (if (symbol=? key 'down)
        (begin
          (bajar-piezas-uno ventana posx posy color 0)
          (start-game ventana cont 821 421 color)
          )
        )
    (if (symbol=? key 'left)
        (mover-izquierda-uno ventana posx posy color 0)
        (start-game ventana cont 821 421 color)
        )
    )
  )

(define (linea-final ventana color)
  (if (and (= (vector-ref vec 0) 1) (= (vector-ref vec 1) 1) (= (vector-ref vec 2) 1) (= (vector-ref vec 3) 1) (= (vector-ref vec 4) 1) (= (vector-ref vec 5) 1))
      (begin
        ((draw-solid-rectangle ventana) (make-posn 821 631) 29 29 "black")
        (sleep 0.01)
        ((draw-solid-rectangle ventana) (make-posn 851 631) 29 29 "black")
        (sleep 0.01)
        ((draw-solid-rectangle ventana) (make-posn 881 631) 29 29 "black")
        (sleep 0.01)
        ((draw-solid-rectangle ventana) (make-posn 911 631) 29 29 "black")
        (sleep 0.01)
        ((draw-solid-rectangle ventana) (make-posn 941 631) 29 29 "black")
        (sleep 0.01)
        ((draw-solid-rectangle ventana) (make-posn 971 631) 29 29 "black")
        ((draw-string ventana) (make-posn 880 417) (number->string (vector-ref puntos 0)) "black")
        
        (vector-set! puntos 0 (+ 100 (vector-ref puntos 0)))
        
        ((draw-string ventana) (make-posn 880 417) (number->string (vector-ref puntos 0)) "white")
        (vector-set! vec 0 0)
        (vector-set! vec 1 0)
        (vector-set! vec 2 0)
        (vector-set! vec 3 0)
        (vector-set! vec 4 0)
        (vector-set! vec 5 0)
        
        )
      )
  )


(define (start-game ventana cont posx posy color)
  (linea-final ventana color)
      (begin
            ((draw-solid-rectangle ventana) (make-posn 901 31) 29 29 color)
        (if (= cont 0)
            (begin
              
              ((draw-solid-rectangle ventana) (make-posn 821 421) 29 29 color)
              (start-game ventana (+ cont 1) 821 421 color)             
              )
            )


        (if (detector ventana (make-posn 821 631))
            (if (= (vector-ref vec 0) 0)
                (begin
                  (vector-set! vec 0 1)
                  (start-game ventana 0 821 421 (colores (random 13)))
                  
                  )
                )
            )
        (if (detector ventana (make-posn 851 631))
            (if (= (vector-ref vec 1) 0)
                (begin
                  (vector-set! vec 1 1)
                  (start-game ventana 0 821 421 (colores (random 13)))
                  
                  )

                )
            )
        (if (detector ventana (make-posn 881 631))
            (if (= (vector-ref vec 2) 0)
                (begin
                  (vector-set! vec 2 1)
                  (start-game ventana 0 821 421 (colores (random 13)))
                  
                  )

                )
            )
        (if (detector ventana (make-posn 911 631))
            (if (= (vector-ref vec 3) 0)
                (begin
                  (vector-set! vec 3 1)
                  (start-game ventana 0 821 421 (colores (random 13)))
                  
                  )

                )
            )
        (if (detector ventana (make-posn 941 631))
            (if (= (vector-ref vec 4) 0)
                (begin
                  (vector-set! vec 4 1)
                  (start-game ventana 0 821 421 (colores (random 13)))
                  
                  )

                )
            )
        (if (detector ventana (make-posn 971 631))
            (if (= (vector-ref vec 5) 0)
                (begin
                  (vector-set! vec 5 1)
                  (start-game ventana 0 821 421 (colores (random 13)))
                  
                  )

                )
            )

        (if (detector ventana (make-posn 1001 421))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 421) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 421) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 451))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 451) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 451) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 481))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 481) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 481) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 511))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 511) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 511) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 541))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 541) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 541) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 571))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 571) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 571) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 601))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 601) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 601) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 1001 631))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 1001 631) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 821 631) 29 29 color)
                  )
            )




        
        (if (detector ventana (make-posn 791 421))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 421) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 421) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 451))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 451) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 451) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 481))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 481) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 481) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 511))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 511) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 511) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 541))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 541) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 541) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 571))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 571) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 571) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 601))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 601) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 601) 29 29 color)
                  )
            )

        (if (detector ventana (make-posn 791 631))
                (begin
                  ((draw-solid-rectangle ventana) (make-posn 791 631) 29 29 "black")
                  ((draw-solid-rectangle ventana) (make-posn 971 631) 29 29 color)
                  )
            )
          
        
        
        (esperar-movimiento (key-value (get-key-press ventana)) ventana (buscar-piezax ventana 821 421 1 1 color) (buscar-piezay ventana 821 421 1 1 color) color cont)
        
        
         
        
        (start-game ventana (+ 1 cont) 821 421 color)

        )
  )



(define (pieza1 vent posx posy posx2 posy2 color)
  ((draw-solid-rectangle vent) (make-posn posx posy) 29 29 (colores color))
  ((draw-solid-rectangle vent) (make-posn posx2 posy2) 29 29 (colores color))
)

(define (piezasola vent posx posy color)
  ((draw-solid-rectangle vent) (make-posn posx posy) 29 29 (colores color))
)


;901 31 29 29





(iniciar)