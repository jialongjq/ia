(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 - reserva
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

		(= (capacidad h6) 4)
		(= (dia-libre h6) 1)

		(= (capacidad h7) 3)
		(= (dia-libre h7) 1)

		(= (capacidad h8) 1)
		(= (dia-libre h8) 1)

		(= (capacidad h9) 2)
		(= (dia-libre h9) 1)

		(= (capacidad h10) 2)
		(= (dia-libre h10) 1)

		(= (personas r1) 3)
		(= (dia-inicio r1) 3)
		(= (dia-final r1) 7)

		(= (personas r2) 3)
		(= (dia-inicio r2) 20)
		(= (dia-final r2) 23)

		(= (personas r3) 1)
		(= (dia-inicio r3) 1)
		(= (dia-final r3) 26)

		(= (personas r4) 1)
		(= (dia-inicio r4) 17)
		(= (dia-final r4) 24)

		(= (personas r5) 3)
		(= (dia-inicio r5) 28)
		(= (dia-final r5) 29)

		(= (personas r6) 4)
		(= (dia-inicio r6) 21)
		(= (dia-final r6) 29)

		(= (personas r7) 2)
		(= (dia-inicio r7) 8)
		(= (dia-final r7) 29)

		(= (personas r8) 3)
		(= (dia-inicio r8) 13)
		(= (dia-final r8) 23)

		(= (personas r9) 4)
		(= (dia-inicio r9) 30)
		(= (dia-final r9) 30)

		(= (personas r10) 4)
		(= (dia-inicio r10) 14)
		(= (dia-final r10) 22)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
