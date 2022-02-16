(define (domain hotel)
    (:requirements :adl :typing :fluents)
    (:types
        habitacion reserva - object
    )
    (:predicates
        (servida ?reserva - reserva)
        (utilizada ?habitacion - habitacion)
    )
    (:functions
        (capacidad ?habitacion - habitacion)
        (personas ?reserva - reserva)
        (dia-libre ?habitacion - habitacion)
        (dia-inicio ?reserva - reserva)
        (dia-final ?reserva -reserva)
        (reservas-descartadas)
        (plazas-desperdiciadas)
        (habitaciones-diferentes)
    )

    (:action asignar-reserva-habitacion-nueva
        :parameters (?reserva - reserva ?habitacion - habitacion)
        :precondition (and
            (not (utilizada ?habitacion))
            (not (servida ?reserva))
            (<= (personas ?reserva) (capacidad ?habitacion))
            (>= (dia-inicio ?reserva) (dia-libre ?habitacion))
        )
        :effect (and
            (assign (dia-libre ?habitacion) (+ (dia-final ?reserva) 1))
            (servida ?reserva)
            (increase (plazas-desperdiciadas) (- (capacidad ?habitacion) (personas ?reserva)))
            (utilizada ?habitacion)
            (increase (habitaciones-diferentes) 1)
        )
    )
    (:action asignar-reserva-habitacion-utilizada
        :parameters (?reserva - reserva ?habitacion - habitacion)
        :precondition (and
            (utilizada ?habitacion)
            (not (servida ?reserva))
            (<= (personas ?reserva) (capacidad ?habitacion))
            (>= (dia-inicio ?reserva) (dia-libre ?habitacion))
        )
        :effect (and
            (assign (dia-libre ?habitacion) (+ (dia-final ?reserva) 1))
            (servida ?reserva)
            (increase (plazas-desperdiciadas) (- (capacidad ?habitacion) (personas ?reserva)))
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
