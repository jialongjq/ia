(define (problem ext1)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 - habitacion
		r1 r2 r3 r4 r5 r6 r7 - reserva
	)
	(:init
		(= (capacidad h1) 4)
		(= (dia-libre h1) 1)

		(= (capacidad h2) 3)
		(= (dia-libre h2) 1)

		(= (capacidad h3) 2)
		(= (dia-libre h3) 1)

		(= (capacidad h4) 4)
		(= (dia-libre h4) 1)

		(= (capacidad h5) 2)
		(= (dia-libre h5) 1)

		(= (personas r1) 1)
		(= (dia-inicio r1) 26)
		(= (dia-final r1) 28)

		(= (personas r2) 3)
		(= (dia-inicio r2) 10)
		(= (dia-final r2) 11)

		(= (personas r3) 4)
		(= (dia-inicio r3) 8)
		(= (dia-final r3) 24)

		(= (personas r4) 1)
		(= (dia-inicio r4) 24)
		(= (dia-final r4) 28)

		(= (personas r5) 1)
		(= (dia-inicio r5) 7)
		(= (dia-final r5) 15)

		(= (personas r6) 4)
		(= (dia-inicio r6) 12)
		(= (dia-final r6) 20)

		(= (personas r7) 3)
		(= (dia-inicio r7) 10)
		(= (dia-final r7) 12)

		(= (reservas-descartadas) 0)
	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
	(:metric minimize (reservas-descartadas))
)
