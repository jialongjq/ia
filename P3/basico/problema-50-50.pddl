(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28 h29 h30 h31 h32 h33 h34 h35 h36 h37 h38 h39 h40 h41 h42 h43 h44 h45 h46 h47 h48 h49 h50 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50 - reserva
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

		(= (capacidad h41) 2)
		(= (dia-libre h41) 1)

		(= (capacidad h42) 2)
		(= (dia-libre h42) 1)

		(= (capacidad h43) 2)
		(= (dia-libre h43) 1)

		(= (capacidad h44) 4)
		(= (dia-libre h44) 1)

		(= (capacidad h45) 1)
		(= (dia-libre h45) 1)

		(= (capacidad h46) 2)
		(= (dia-libre h46) 1)

		(= (capacidad h47) 3)
		(= (dia-libre h47) 1)

		(= (capacidad h48) 1)
		(= (dia-libre h48) 1)

		(= (capacidad h49) 4)
		(= (dia-libre h49) 1)

		(= (capacidad h50) 3)
		(= (dia-libre h50) 1)

		(= (personas r1) 4)
		(= (dia-inicio r1) 24)
		(= (dia-final r1) 28)

		(= (personas r2) 2)
		(= (dia-inicio r2) 21)
		(= (dia-final r2) 29)

		(= (personas r3) 1)
		(= (dia-inicio r3) 3)
		(= (dia-final r3) 26)

		(= (personas r4) 2)
		(= (dia-inicio r4) 2)
		(= (dia-final r4) 11)

		(= (personas r5) 1)
		(= (dia-inicio r5) 15)
		(= (dia-final r5) 27)

		(= (personas r6) 2)
		(= (dia-inicio r6) 6)
		(= (dia-final r6) 28)

		(= (personas r7) 1)
		(= (dia-inicio r7) 14)
		(= (dia-final r7) 15)

		(= (personas r8) 2)
		(= (dia-inicio r8) 16)
		(= (dia-final r8) 18)

		(= (personas r9) 3)
		(= (dia-inicio r9) 15)
		(= (dia-final r9) 27)

		(= (personas r10) 3)
		(= (dia-inicio r10) 15)
		(= (dia-final r10) 18)

		(= (personas r11) 1)
		(= (dia-inicio r11) 8)
		(= (dia-final r11) 20)

		(= (personas r12) 1)
		(= (dia-inicio r12) 9)
		(= (dia-final r12) 20)

		(= (personas r13) 3)
		(= (dia-inicio r13) 4)
		(= (dia-final r13) 17)

		(= (personas r14) 1)
		(= (dia-inicio r14) 20)
		(= (dia-final r14) 22)

		(= (personas r15) 4)
		(= (dia-inicio r15) 27)
		(= (dia-final r15) 27)

		(= (personas r16) 3)
		(= (dia-inicio r16) 23)
		(= (dia-final r16) 27)

		(= (personas r17) 4)
		(= (dia-inicio r17) 25)
		(= (dia-final r17) 29)

		(= (personas r18) 3)
		(= (dia-inicio r18) 11)
		(= (dia-final r18) 12)

		(= (personas r19) 2)
		(= (dia-inicio r19) 18)
		(= (dia-final r19) 27)

		(= (personas r20) 1)
		(= (dia-inicio r20) 3)
		(= (dia-final r20) 9)

		(= (personas r21) 2)
		(= (dia-inicio r21) 23)
		(= (dia-final r21) 24)

		(= (personas r22) 2)
		(= (dia-inicio r22) 21)
		(= (dia-final r22) 29)

		(= (personas r23) 1)
		(= (dia-inicio r23) 16)
		(= (dia-final r23) 29)

		(= (personas r24) 1)
		(= (dia-inicio r24) 30)
		(= (dia-final r24) 30)

		(= (personas r25) 2)
		(= (dia-inicio r25) 10)
		(= (dia-final r25) 21)

		(= (personas r26) 2)
		(= (dia-inicio r26) 28)
		(= (dia-final r26) 29)

		(= (personas r27) 4)
		(= (dia-inicio r27) 6)
		(= (dia-final r27) 27)

		(= (personas r28) 2)
		(= (dia-inicio r28) 28)
		(= (dia-final r28) 28)

		(= (personas r29) 2)
		(= (dia-inicio r29) 4)
		(= (dia-final r29) 26)

		(= (personas r30) 4)
		(= (dia-inicio r30) 17)
		(= (dia-final r30) 22)

		(= (personas r31) 4)
		(= (dia-inicio r31) 15)
		(= (dia-final r31) 28)

		(= (personas r32) 4)
		(= (dia-inicio r32) 3)
		(= (dia-final r32) 29)

		(= (personas r33) 3)
		(= (dia-inicio r33) 30)
		(= (dia-final r33) 30)

		(= (personas r34) 4)
		(= (dia-inicio r34) 19)
		(= (dia-final r34) 22)

		(= (personas r35) 1)
		(= (dia-inicio r35) 11)
		(= (dia-final r35) 16)

		(= (personas r36) 2)
		(= (dia-inicio r36) 24)
		(= (dia-final r36) 26)

		(= (personas r37) 2)
		(= (dia-inicio r37) 27)
		(= (dia-final r37) 27)

		(= (personas r38) 1)
		(= (dia-inicio r38) 6)
		(= (dia-final r38) 17)

		(= (personas r39) 2)
		(= (dia-inicio r39) 15)
		(= (dia-final r39) 23)

		(= (personas r40) 1)
		(= (dia-inicio r40) 21)
		(= (dia-final r40) 22)

		(= (personas r41) 1)
		(= (dia-inicio r41) 15)
		(= (dia-final r41) 19)

		(= (personas r42) 1)
		(= (dia-inicio r42) 5)
		(= (dia-final r42) 17)

		(= (personas r43) 4)
		(= (dia-inicio r43) 4)
		(= (dia-final r43) 29)

		(= (personas r44) 1)
		(= (dia-inicio r44) 26)
		(= (dia-final r44) 29)

		(= (personas r45) 2)
		(= (dia-inicio r45) 23)
		(= (dia-final r45) 27)

		(= (personas r46) 4)
		(= (dia-inicio r46) 29)
		(= (dia-final r46) 29)

		(= (personas r47) 3)
		(= (dia-inicio r47) 25)
		(= (dia-final r47) 26)

		(= (personas r48) 2)
		(= (dia-inicio r48) 26)
		(= (dia-final r48) 27)

		(= (personas r49) 3)
		(= (dia-inicio r49) 16)
		(= (dia-final r49) 25)

		(= (personas r50) 4)
		(= (dia-inicio r50) 9)
		(= (dia-final r50) 21)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
