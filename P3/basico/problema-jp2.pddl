(define (problem basico)
    (:domain hotel)
    (:objects
        h1 h2 h3 - habitacion
        r1 r2 r3 r4 - reserva
    )
    (:init
        (= (capacidad h1) 1)
        (= (dia-libre h1) 1)

        (= (capacidad h2) 2)
        (= (dia-libre h2) 1)

        (= (capacidad h3) 3)
        (= (dia-libre h3) 1)

        (= (personas r1) 4)
        (= (dia-inicio r1) 1)
        (= (dia-final r1) 1)

        (= (personas r2) 3)
        (= (dia-inicio r2) 1)
        (= (dia-final r2) 1)

        (= (personas r3) 1)
        (= (dia-inicio r3) 1)
        (= (dia-final r3) 1)

        (= (personas r4) 2)
        (= (dia-inicio r4) 1)
        (= (dia-final r4) 1)
    )
    (:goal (forall (?reserva - reserva) (servida ?reserva)))
)
