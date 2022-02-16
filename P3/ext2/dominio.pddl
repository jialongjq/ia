(define (domain hotel)
    (:requirements :adl :typing :fluents)
    (:types
        habitacion reserva - object
    )
    (:predicates
        (servida ?reserva - reserva)
    )
    (:functions
        (capacidad ?habitacion - habitacion)
        (dia-libre ?habitacion - habitacion)
        (orientacion-habitacion ?habitacion - habitacion)
        (personas ?reserva - reserva)
        (dia-inicio ?reserva - reserva)
        (dia-final ?reserva -reserva)
        (orientacion-reserva ?reserva - reserva)
        (reservas-descartadas)
        (reservas-orientacion-incorrecta)
    )

    (:action asignar-reserva
        :parameters (?reserva - reserva ?habitacion - habitacion)
        :precondition (and
            (not (servida ?reserva))
            (<= (personas ?reserva) (capacidad ?habitacion))
            (>= (dia-inicio ?reserva) (dia-libre ?habitacion))
        )
        :effect (and
            (assign (dia-libre ?habitacion) (+ (dia-final ?reserva) 1))
            (servida ?reserva)
            (increase (reservas-orientacion-incorrecta) 1)
        )
    )

    (:action asignar-reserva-orientacion-correcta
        :parameters (?reserva - reserva ?habitacion - habitacion)
        :precondition (and
            (not (servida ?reserva))
            (= (orientacion-reserva ?reserva) (orientacion-habitacion ?habitacion))
            (<= (personas ?reserva) (capacidad ?habitacion))
            (>= (dia-inicio ?reserva) (dia-libre ?habitacion))
        )
        :effect (and
            (assign (dia-libre ?habitacion) (+ (dia-final ?reserva) 1))
            (servida ?reserva)
        )
    )

    (:action descartar-reserva
        :parameters (?reserva - reserva)
        :precondition (and
            (not (servida ?reserva))
            (forall (?habitacion - habitacion)
                (or (> (personas ?reserva) (capacidad ?habitacion)) (< (dia-inicio ?reserva) (dia-libre ?habitacion)))
            )
        )
        :effect (and
            (servida ?reserva)
            (increase (reservas-descartadas) 1)
        )
    )
)
