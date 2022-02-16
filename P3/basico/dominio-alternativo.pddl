(define (domain hotel)
    (:requirements :adl :typing :fluents)
    (:types
        habitacion reserva - object
    )
    (:predicates
        (servida ?reserva)
        (asignada ?reserva ?habitacion)
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
            (forall (?r - reserva)
                (imply (asignada ?r ?habitacion) (or (> (dia-inicio ?reserva) (dia-final ?r)) (< (dia-final ?reserva) (dia-inicio ?r))))
            )
        )
        :effect (and
            (asignada ?reserva ?habitacion)
            (servida ?reserva)
        )
    )
)
