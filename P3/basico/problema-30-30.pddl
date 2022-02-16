(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28 h29 h30 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 - reserva
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

		(= (capacidad h21) 4)
		(= (dia-libre h21) 1)

		(= (capacidad h22) 1)
		(= (dia-libre h22) 1)

		(= (capacidad h23) 4)
		(= (dia-libre h23) 1)

		(= (capacidad h24) 2)
		(= (dia-libre h24) 1)

		(= (capacidad h25) 3)
		(= (dia-libre h25) 1)

		(= (capacidad h26) 3)
		(= (dia-libre h26) 1)

		(= (capacidad h27) 3)
		(= (dia-libre h27) 1)

		(= (capacidad h28) 4)
		(= (dia-libre h28) 1)

		(= (capacidad h29) 4)
		(= (dia-libre h29) 1)

		(= (capacidad h30) 4)
		(= (dia-libre h30) 1)

		(= (personas r1) 3)
		(= (dia-inicio r1) 30)
		(= (dia-final r1) 30)

		(= (personas r2) 2)
		(= (dia-inicio r2) 13)
		(= (dia-final r2) 13)

		(= (personas r3) 1)
		(= (dia-inicio r3) 28)
		(= (dia-final r3) 29)

		(= (personas r4) 2)
		(= (dia-inicio r4) 2)
		(= (dia-final r4) 4)

		(= (personas r5) 4)
		(= (dia-inicio r5) 4)
		(= (dia-final r5) 7)

		(= (personas r6) 3)
		(= (dia-inicio r6) 15)
		(= (dia-final r6) 22)

		(= (personas r7) 3)
		(= (dia-inicio r7) 15)
		(= (dia-final r7) 20)

		(= (personas r8) 4)
		(= (dia-inicio r8) 24)
		(= (dia-final r8) 28)

		(= (personas r9) 2)
		(= (dia-inicio r9) 21)
		(= (dia-final r9) 29)

		(= (personas r10) 1)
		(= (dia-inicio r10) 3)
		(= (dia-final r10) 26)

		(= (personas r11) 2)
		(= (dia-inicio r11) 2)
		(= (dia-final r11) 11)

		(= (personas r12) 1)
		(= (dia-inicio r12) 15)
		(= (dia-final r12) 27)

		(= (personas r13) 2)
		(= (dia-inicio r13) 6)
		(= (dia-final r13) 28)

		(= (personas r14) 1)
		(= (dia-inicio r14) 14)
		(= (dia-final r14) 15)

		(= (personas r15) 2)
		(= (dia-inicio r15) 16)
		(= (dia-final r15) 18)

		(= (personas r16) 3)
		(= (dia-inicio r16) 15)
		(= (dia-final r16) 27)

		(= (personas r17) 3)
		(= (dia-inicio r17) 15)
		(= (dia-final r17) 18)

		(= (personas r18) 1)
		(= (dia-inicio r18) 8)
		(= (dia-final r18) 20)

		(= (personas r19) 1)
		(= (dia-inicio r19) 9)
		(= (dia-final r19) 20)

		(= (personas r20) 3)
		(= (dia-inicio r20) 4)
		(= (dia-final r20) 17)

		(= (personas r21) 1)
		(= (dia-inicio r21) 20)
		(= (dia-final r21) 22)

		(= (personas r22) 4)
		(= (dia-inicio r22) 27)
		(= (dia-final r22) 27)

		(= (personas r23) 3)
		(= (dia-inicio r23) 23)
		(= (dia-final r23) 27)

		(= (personas r24) 4)
		(= (dia-inicio r24) 25)
		(= (dia-final r24) 29)

		(= (personas r25) 3)
		(= (dia-inicio r25) 11)
		(= (dia-final r25) 12)

		(= (personas r26) 2)
		(= (dia-inicio r26) 18)
		(= (dia-final r26) 27)

		(= (personas r27) 1)
		(= (dia-inicio r27) 3)
		(= (dia-final r27) 9)

		(= (personas r28) 2)
		(= (dia-inicio r28) 23)
		(= (dia-final r28) 24)

		(= (personas r29) 2)
		(= (dia-inicio r29) 21)
		(= (dia-final r29) 29)

		(= (personas r30) 1)
		(= (dia-inicio r30) 16)
		(= (dia-final r30) 29)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
