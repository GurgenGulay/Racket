;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |agirlikli graflar ve ucs|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; kimden kime ağırlık 
(define harita 
  (list (list 1 2 1) 
        (list 1 3 3) 
        (list 2 7 1) 
        (list 2 4 2) 
        (list 2 3 2) 
        (list 3 2 2) 
        (list 3 5 3)) 
  ) 
; bir düğümden gidilebilecek alternatiflerin listesi 
; düğüm numaraları ve ağırlıkları ile döndürür 
(define (alt alist dugum)(if(empty? alist) 
                            alist 
                            (if (= dugum (first (first alist))) 
                                (cons(rest (first alist)) (alt (rest alist)dugum)) 
                                (alt (rest alist)dugum) 
                            ) 
  )) 
  (alt harita 2)
; iki alternatiften ucuz olanını döndürür
(define (karsilastir alt1 alt2)(if (empty? alt2)
                                   alt1
                                   (if (>(first(rest alt1))(first(rest alt2)) )
                                       alt2
                                       alt1)
                                   ))

(karsilastir (list 3 1)(list 4 22))
; alternatiflerden minimumunu bulan fonksiyon
(define (min-alt alist)(if(empty? alist)
                          alist
                          (karsilastir (first alist)
                                       (min-alt (rest alist)))))
(min-alt (list (list 3 2)(list 4 2)(list 7 5)(list 9 11)(list 8 -1)))
(min-alt (alt harita 2))
(define (ucs alist baslangic bitis)
  (if (empty? alist) ; hala listede eleman varsa
      alist
      (cons baslangic
            (if (empty? (alt alist baslangic)) ;gidebileceğimiz düğüm varsa
                null
                (if ( = bitis (first (min-alt (alt alist baslangic))))
                    ; aradığımız düğümü bulduysak
               (list(first (min-alt (alt alist baslangic))))
            (ucs alist (first
                        (min-alt (alt alist baslangic)))bitis)))
            
                                       )
  ))
  
(ucs harita 1 5)
(define (astar alist baslangic bitis)null)

