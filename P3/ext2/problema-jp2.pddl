(define (problem ext2)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 - habitacion
		r1 r2 r3 r4 r5 - reserva
	)
	(:init
		(= (capacidad h1) 3)
		(= (dia-libre h1) 1)
		(= (orientacion-habitacion h1) 4)

		(= (capacidad h2) 4)
		(= (dia-libre h2) 1)
		(= (orientacion-habitacion h2) 2)

		(= (capacidad h3) 4)
		(= (dia-libre h3) 1)
		(= (orientacion-habitacion h3) 2)

		(= (capacidad h4) 1)
		(= (dia-libre h4) 1)
		(= (orientacion-habitacion h4) 3)

		(= (capacidad h5) 2)
		(= (dia-libre h5) 1)
		(= (orientacion-habitacion h5) 2)

		(= (personas r1) 4)
		(= (dia-inicio r1) 3)
		(= (dia-final r1) 7)
		(= (orientacion-reserva r1) 3)

		(= (personas r2) 3)
		(= (dia-inicio r2) 24)
		(= (dia-final r2) 28)
		(= (orientacion-reserva r2) 1)

		(= (personas r3) 1)
		(= (dia-inicio r3) 23)
		(= (dia-final r3) 25)
		(= (orientacion-reserva r3) 4)

		(= (personas r4) 3)
		(= (dia-inicio r4) 28)
		(= (dia-final r4) 29)
		(= (orientacion-reserva r4) 3)

		(= (personas r5) 4)
		(= (dia-inicio r5) 3)
		(= (dia-final r5) 25)
		(= (orientacion-reserva r5) 4)

		(= (reservas-descartadas) 0)
		(= (reservas-orientacion-incorrecta) 0)
	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
	(:metric minimize (+ (* 10 (reservas-descartadas)) (reservas-orientacion-incorrecta)))
)
