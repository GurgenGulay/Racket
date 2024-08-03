;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |kosul tatmin problemleri|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define kenarlar(list (list 1 3)
                      (list 1 2)
                      (list 2 4)
                      (list 3 2)
                      (list 3 4)
                      ))
                   
  (define dugumler (list 1 2 3 4))
  (define renkler (list 1 2 3))
    ; 1 mavi / 2 kırmızı / 3 yeşil 
; aşağıdaki kod o koşulları sağlayıp sağlamadığımızı kontrol eden yapı
    (define cozum (list (list 1 1)
                       (list 2 2)
                       (list 3 3)
                       (list 4 1)
                      )
      )
      
    (define (birinci k) (first (first k)))
    (define (ikinci k)(first (rest (first k))))
    ; komşuları yazan fonksiyon(komşuların listesini dondüren fonksiyon (komsular dugum kenarlar_listesi))
    (define (komsular d k )(if (empty? k)null
                               ;listede hala eleman varsa ilk sıradaki duğum arana dugume eşit mi
                               (if (= (birinci k) d)
                                   (cons (ikinci k) (komsular d (rest k))) ;second(ikinci)
                               (if (= (ikinci k)d)
                                   (cons (birinci k) (komsular d (rest k)))
                                   (komsular d (rest k))
                                   ))))
    (komsular 2 kenarlar)
; verilen çözüm içerisindeki aranan düğümün rengini döndüren fonksiyon
    (define (renk d c)(if (empty? c)null
                          (if (= (birinci c) d)(ikinci c)
                              (renk d (rest c)))))
    (renk 4 cozum)
; verilen kenarlar listesi ve çözüm için verilen düğümün komşuları ile uyumuna bak
(define (kontrol-yardim d kl c)(if (empty? kl)#true
                                   (if (= (renk d c) (renk (first kl) c))
                                                           #false
                                                           (and #true (kontrol-yardim d (rest kl)c)))))
(define (kontrol d k c)(kontrol-yardim d (komsular d k) c))
(kontrol 2 kenarlar cozum)
(define (csp dler klar c)(if (empty? dler) #true
                             (and (kontrol (first dler) klar c)
                                  (csp (rest dler) klar c))))
(csp dugumler kenarlar cozum)
                                   