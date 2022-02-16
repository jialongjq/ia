(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28 h29 h30 h31 h32 h33 h34 h35 h36 h37 h38 h39 h40 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 - reserva
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

		(= (capacidad h31) 2)
		(= (dia-libre h31) 1)

		(= (capacidad h32) 3)
		(= (dia-libre h32) 1)

		(= (capacidad h33) 3)
		(= (dia-libre h33) 1)

		(= (capacidad h34) 3)
		(= (dia-libre h34) 1)

		(= (capacidad h35) 2)
		(= (dia-libre h35) 1)

		(= (capacidad h36) 4)
		(= (dia-libre h36) 1)

		(= (capacidad h37) 2)
		(= (dia-libre h37) 1)

		(= (capacidad h38) 1)
		(= (dia-libre h38) 1)

		(= (capacidad h39) 4)
		(= (dia-libre h39) 1)

		(= (capacidad h40) 3)
		(= (dia-libre h40) 1)

		(= (personas r1) 2)
		(= (dia-inicio r1) 10)
		(= (dia-final r1) 23)

		(= (personas r2) 1)
		(= (dia-inicio r2) 30)
		(= (dia-final r2) 30)

		(= (personas r3) 1)
		(= (dia-inicio r3) 8)
		(= (dia-final r3) 12)

		(= (personas r4) 2)
		(= (dia-inicio r4) 6)
		(= (dia-final r4) 24)

		(= (personas r5) 1)
		(= (dia-inicio r5) 17)
		(= (dia-final r5) 17)

		(= (personas r6) 3)
		(= (dia-inicio r6) 27)
		(= (dia-final r6) 27)

		(= (personas r7) 2)
		(= (dia-inicio r7) 21)
		(= (dia-final r7) 25)

		(= (personas r8) 1)
		(= (dia-inicio r8) 16)
		(= (dia-final r8) 29)

		(= (personas r9) 2)
		(= (dia-inicio r9) 28)
		(= (dia-final r9) 28)

		(= (personas r10) 2)
		(= (dia-inicio r10) 17)
		(= (dia-final r10) 28)

		(= (personas r11) 4)
		(= (dia-inicio r11) 18)
		(= (dia-final r11) 18)

		(= (personas r12) 3)
		(= (dia-inicio r12) 13)
		(= (dia-final r12) 26)

		(= (personas r13) 1)
		(= (dia-inicio r13) 28)
		(= (dia-final r13) 28)

		(= (personas r14) 4)
		(= (dia-inicio r14) 4)
		(= (dia-final r14) 18)

		(= (personas r15) 3)
		(= (dia-inicio r15) 19)
		(= (dia-final r15) 23)

		(= (personas r16) 4)
		(= (dia-inicio r16) 9)
		(= (dia-final r16) 27)

		(= (personas r17) 4)
		(= (dia-inicio r17) 12)
		(= (dia-final r17) 20)

		(= (personas r18) 1)
		(= (dia-inicio r18) 13)
		(= (dia-final r18) 29)

		(= (personas r19) 1)
		(= (dia-inicio r19) 19)
		(= (dia-final r19) 28)

		(= (personas r20) 3)
		(= (dia-inicio r20) 17)
		(= (dia-final r20) 29)

		(= (personas r21) 4)
		(= (dia-inicio r21) 30)
		(= (dia-final r21) 30)

		(= (personas r22) 3)
		(= (dia-inicio r22) 11)
		(= (dia-final r22) 12)

		(= (personas r23) 2)
		(= (dia-inicio r23) 18)
		(= (dia-final r23) 27)

		(= (personas r24) 1)
		(= (dia-inicio r24) 3)
		(= (dia-final r24) 9)

		(= (personas r25) 2)
		(= (dia-inicio r25) 23)
		(= (dia-final r25) 24)

		(= (personas r26) 2)
		(= (dia-inicio r26) 21)
		(= (dia-final r26) 29)

		(= (personas r27) 1)
		(= (dia-inicio r27) 16)
		(= (dia-final r27) 29)

		(= (personas r28) 1)
		(= (dia-inicio r28) 30)
		(= (dia-final r28) 30)

		(= (personas r29) 2)
		(= (dia-inicio r29) 10)
		(= (dia-final r29) 21)

		(= (personas r30) 2)
		(= (dia-inicio r30) 28)
		(= (dia-final r30) 29)

		(= (personas r31) 4)
		(= (dia-inicio r31) 6)
		(= (dia-final r31) 27)

		(= (personas r32) 2)
		(= (dia-inicio r32) 28)
		(= (dia-final r32) 28)

		(= (personas r33) 2)
		(= (dia-inicio r33) 4)
		(= (dia-final r33) 26)

		(= (personas r34) 4)
		(= (dia-inicio r34) 17)
		(= (dia-final r34) 22)

		(= (personas r35) 4)
		(= (dia-inicio r35) 15)
		(= (dia-final r35) 28)

		(= (personas r36) 4)
		(= (dia-inicio r36) 3)
		(= (dia-final r36) 29)

		(= (personas r37) 3)
		(= (dia-inicio r37) 30)
		(= (dia-final r37) 30)

		(= (personas r38) 4)
		(= (dia-inicio r38) 19)
		(= (dia-final r38) 22)

		(= (personas r39) 1)
		(= (dia-inicio r39) 11)
		(= (dia-final r39) 16)

		(= (personas r40) 2)
		(= (dia-inicio r40) 24)
		(= (dia-final r40) 26)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
