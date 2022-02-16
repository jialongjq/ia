(define (domain hotel)
    (:requirements :adl :typing :fluents)
    (:types
        habitacion reserva - object
    )
    (:predicates
        (servida ?reserva)
    )
    (:functions
        (capacidad ?habitacion - habitacion)
        (personas ?reserva - reserva)
        (dia-libre ?habitacion - habitacion)
        (dia-inicio ?reserva - reserva)
        (dia-final ?reserva -reserva)
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
        )
    )
)
