(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 - reserva
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

		(= (capacidad h11) 3)
		(= (dia-libre h11) 1)

		(= (capacidad h12) 4)
		(= (dia-libre h12) 1)

		(= (capacidad h13) 3)
		(= (dia-libre h13) 1)

		(= (capacidad h14) 4)
		(= (dia-libre h14) 1)

		(= (capacidad h15) 4)
		(= (dia-libre h15) 1)

		(= (capacidad h16) 3)
		(= (dia-libre h16) 1)

		(= (capacidad h17) 1)
		(= (dia-libre h17) 1)

		(= (capacidad h18) 3)
		(= (dia-libre h18) 1)

		(= (capacidad h19) 1)
		(= (dia-libre h19) 1)

		(= (capacidad h20) 1)
		(= (dia-libre h20) 1)

		(= (personas r1) 4)
		(= (dia-inicio r1) 12)
		(= (dia-final r1) 20)

		(= (personas r2) 3)
		(= (dia-inicio r2) 10)
		(= (dia-final r2) 12)

		(= (personas r3) 4)
		(= (dia-inicio r3) 3)
		(= (dia-final r3) 25)

		(= (personas r4) 3)
		(= (dia-inicio r4) 26)
		(= (dia-final r4) 27)

		(= (personas r5) 2)
		(= (dia-inicio r5) 13)
		(= (dia-final r5) 13)

		(= (personas r6) 1)
		(= (dia-inicio r6) 28)
		(= (dia-final r6) 29)

		(= (personas r7) 2)
		(= (dia-inicio r7) 2)
		(= (dia-final r7) 4)

		(= (personas r8) 4)
		(= (dia-inicio r8) 4)
		(= (dia-final r8) 7)

		(= (personas r9) 3)
		(= (dia-inicio r9) 15)
		(= (dia-final r9) 22)

		(= (personas r10) 3)
		(= (dia-inicio r10) 15)
		(= (dia-final r10) 20)

		(= (personas r11) 4)
		(= (dia-inicio r11) 24)
		(= (dia-final r11) 28)

		(= (personas r12) 2)
		(= (dia-inicio r12) 21)
		(= (dia-final r12) 29)

		(= (personas r13) 1)
		(= (dia-inicio r13) 3)
		(= (dia-final r13) 26)

		(= (personas r14) 2)
		(= (dia-inicio r14) 2)
		(= (dia-final r14) 11)

		(= (personas r15) 1)
		(= (dia-inicio r15) 15)
		(= (dia-final r15) 27)

		(= (personas r16) 2)
		(= (dia-inicio r16) 6)
		(= (dia-final r16) 28)

		(= (personas r17) 1)
		(= (dia-inicio r17) 14)
		(= (dia-final r17) 15)

		(= (personas r18) 2)
		(= (dia-inicio r18) 16)
		(= (dia-final r18) 18)

		(= (personas r19) 3)
		(= (dia-inicio r19) 15)
		(= (dia-final r19) 27)

		(= (personas r20) 3)
		(= (dia-inicio r20) 15)
		(= (dia-final r20) 18)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
