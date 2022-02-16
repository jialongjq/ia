(define (problem ext2)
    (:domain hotel)
    (:objects
        h1 - habitacion
        r1 r2 r3 r4 - reserva
    )
    (:init
        ; ORIENTACION: N=1, S=2, E=3, O=4
        (= (capacidad h1) 1)
        (= (dia-libre h1) 1)
        (= (orientacion-habitacion h1) 1)

        (= (personas r1) 1)
        (= (dia-inicio r1) 1)
        (= (dia-final r1) 1)
        (= (orientacion-reserva r1) 2)

        (= (personas r2) 1)
        (= (dia-inicio r2) 1)
        (= (dia-final r2) 1)
        (= (orientacion-reserva r2) 1)

        (= (personas r3) 1)
        (= (dia-inicio r3) 1)
        (= (dia-final r3) 1)
        (= (orientacion-reserva r3) 3)

        (= (personas r4) 1)
        (= (dia-inicio r4) 1)
        (= (dia-final r4) 1)
        (= (orientacion-reserva r4) 4)

        (= (reservas-descartadas) 0)
        (= (reservas-orientacion-incorrecta) 0)
    )
    (:goal
        (forall (?reserva - reserva)
            (servida ?reserva)
        )
    )
    (:metric minimize (+ (* 10 (reservas-descartadas)) (reservas-orientacion-incorrecta)))
)
