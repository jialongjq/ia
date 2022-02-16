(define (problem ext3)
    (:domain hotel)
    (:objects
        h1 - habitacion
        r1 r2 r3 r4 - reserva
    )
    (:init
        (= (capacidad h1) 4)
        (= (dia-libre h1) 1)

        (= (personas r1) 2)
        (= (dia-inicio r1) 1)
        (= (dia-final r1) 1)

        (= (personas r2) 4)
        (= (dia-inicio r2) 1)
        (= (dia-final r2) 1)

        (= (personas r3) 3)
        (= (dia-inicio r3) 1)
        (= (dia-final r3) 1)
        
        (= (personas r4) 1)
        (= (dia-inicio r4) 1)
        (= (dia-final r4) 1)

        (= (reservas-descartadas) 0)
        (= (plazas-desperdiciadas) 0)
    )
    (:goal
        (forall (?reserva - reserva)
            (servida ?reserva)
        )
    )
    (:metric minimize (+ (* 10 (reservas-descartadas)) (plazas-desperdiciadas)))
)
