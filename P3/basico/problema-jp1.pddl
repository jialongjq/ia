(define (problem basico)
    (:domain hotel)
    (:objects
        h1 h2 h3 h4 - habitacion
        r1 r2 r3 r4 r5 r6 r7 r8 - reserva
    )
    (:init
        (= (capacidad h1) 1)
        (= (dia-libre h1) 1)

        (= (capacidad h2) 2)
        (= (dia-libre h2) 1)

        (= (capacidad h3) 3)
        (= (dia-libre h3) 1)

        (= (capacidad h4) 4)
        (= (dia-libre h4) 1)

        (= (personas r1) 4)
        (= (dia-inicio r1) 1)
        (= (dia-final r1) 7)

        (= (personas r2) 3)
        (= (dia-inicio r2) 1)
        (= (dia-final r2) 15)

        (= (personas r3) 1)
        (= (dia-inicio r3) 6)
        (= (dia-final r3) 10)

        (= (personas r4) 2)
        (= (dia-inicio r4) 23)
        (= (dia-final r4) 29)
        
        (= (personas r5) 4)
        (= (dia-inicio r5) 15)
        (= (dia-final r5) 20)

        (= (personas r6) 1)
        (= (dia-inicio r6) 8)
        (= (dia-final r6) 14)

        (= (personas r7) 3)
        (= (dia-inicio r7) 28)
        (= (dia-final r7) 30)

        (= (personas r8) 2)
        (= (dia-inicio r8) 14)
        (= (dia-final r8) 16)
    )
    (:goal (forall (?reserva - reserva) (servida ?reserva)))
)
