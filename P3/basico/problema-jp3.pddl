(define (problem basico)
    (:domain hotel)
    (:objects
        h1 - habitacion
        r1 r2 r3 r4 - reserva
    )
    (:init
        (= (capacidad h1) 1)
        (= (dia-libre h1) 1)

        (= (personas r1) 1)
        (= (dia-inicio r1) 1)
        (= (dia-final r1) 8)

        (= (personas r2) 1)
        (= (dia-inicio r2) 9)
        (= (dia-final r2) 15)

        (= (personas r3) 1)
        (= (dia-inicio r3) 16)
        (= (dia-final r3) 30)

        (= (personas r4) 1)
        (= (dia-inicio r4) 4)
        (= (dia-final r4) 4)
    )
    (:goal (forall (?reserva - reserva) (servida ?reserva)))
)
