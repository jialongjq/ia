(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28 h29 h30 h31 h32 h33 h34 h35 h36 h37 h38 h39 h40 h41 h42 h43 h44 h45 h46 h47 h48 h49 h50 h51 h52 h53 h54 h55 h56 h57 h58 h59 h60 h61 h62 h63 h64 h65 h66 h67 h68 h69 h70 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50 r51 r52 r53 r54 r55 r56 r57 r58 r59 r60 r61 r62 r63 r64 r65 r66 r67 r68 r69 r70 - reserva
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

		(= (capacidad h51) 2)
		(= (dia-libre h51) 1)

		(= (capacidad h52) 3)
		(= (dia-libre h52) 1)

		(= (capacidad h53) 4)
		(= (dia-libre h53) 1)

		(= (capacidad h54) 1)
		(= (dia-libre h54) 1)

		(= (capacidad h55) 1)
		(= (dia-libre h55) 1)

		(= (capacidad h56) 2)
		(= (dia-libre h56) 1)

		(= (capacidad h57) 3)
		(= (dia-libre h57) 1)

		(= (capacidad h58) 3)
		(= (dia-libre h58) 1)

		(= (capacidad h59) 1)
		(= (dia-libre h59) 1)

		(= (capacidad h60) 2)
		(= (dia-libre h60) 1)

		(= (capacidad h61) 2)
		(= (dia-libre h61) 1)

		(= (capacidad h62) 2)
		(= (dia-libre h62) 1)

		(= (capacidad h63) 1)
		(= (dia-libre h63) 1)

		(= (capacidad h64) 4)
		(= (dia-libre h64) 1)

		(= (capacidad h65) 1)
		(= (dia-libre h65) 1)

		(= (capacidad h66) 2)
		(= (dia-libre h66) 1)

		(= (capacidad h67) 3)
		(= (dia-libre h67) 1)

		(= (capacidad h68) 2)
		(= (dia-libre h68) 1)

		(= (capacidad h69) 2)
		(= (dia-libre h69) 1)

		(= (capacidad h70) 2)
		(= (dia-libre h70) 1)

		(= (personas r1) 2)
		(= (dia-inicio r1) 16)
		(= (dia-final r1) 18)

		(= (personas r2) 3)
		(= (dia-inicio r2) 15)
		(= (dia-final r2) 27)

		(= (personas r3) 3)
		(= (dia-inicio r3) 15)
		(= (dia-final r3) 18)

		(= (personas r4) 1)
		(= (dia-inicio r4) 8)
		(= (dia-final r4) 20)

		(= (personas r5) 1)
		(= (dia-inicio r5) 9)
		(= (dia-final r5) 20)

		(= (personas r6) 3)
		(= (dia-inicio r6) 4)
		(= (dia-final r6) 17)

		(= (personas r7) 1)
		(= (dia-inicio r7) 20)
		(= (dia-final r7) 22)

		(= (personas r8) 4)
		(= (dia-inicio r8) 27)
		(= (dia-final r8) 27)

		(= (personas r9) 3)
		(= (dia-inicio r9) 23)
		(= (dia-final r9) 27)

		(= (personas r10) 4)
		(= (dia-inicio r10) 25)
		(= (dia-final r10) 29)

		(= (personas r11) 3)
		(= (dia-inicio r11) 11)
		(= (dia-final r11) 12)

		(= (personas r12) 2)
		(= (dia-inicio r12) 18)
		(= (dia-final r12) 27)

		(= (personas r13) 1)
		(= (dia-inicio r13) 3)
		(= (dia-final r13) 9)

		(= (personas r14) 2)
		(= (dia-inicio r14) 23)
		(= (dia-final r14) 24)

		(= (personas r15) 2)
		(= (dia-inicio r15) 21)
		(= (dia-final r15) 29)

		(= (personas r16) 1)
		(= (dia-inicio r16) 16)
		(= (dia-final r16) 29)

		(= (personas r17) 1)
		(= (dia-inicio r17) 30)
		(= (dia-final r17) 30)

		(= (personas r18) 2)
		(= (dia-inicio r18) 10)
		(= (dia-final r18) 21)

		(= (personas r19) 2)
		(= (dia-inicio r19) 28)
		(= (dia-final r19) 29)

		(= (personas r20) 4)
		(= (dia-inicio r20) 6)
		(= (dia-final r20) 27)

		(= (personas r21) 2)
		(= (dia-inicio r21) 28)
		(= (dia-final r21) 28)

		(= (personas r22) 2)
		(= (dia-inicio r22) 4)
		(= (dia-final r22) 26)

		(= (personas r23) 4)
		(= (dia-inicio r23) 17)
		(= (dia-final r23) 22)

		(= (personas r24) 4)
		(= (dia-inicio r24) 15)
		(= (dia-final r24) 28)

		(= (personas r25) 4)
		(= (dia-inicio r25) 3)
		(= (dia-final r25) 29)

		(= (personas r26) 3)
		(= (dia-inicio r26) 30)
		(= (dia-final r26) 30)

		(= (personas r27) 4)
		(= (dia-inicio r27) 19)
		(= (dia-final r27) 22)

		(= (personas r28) 1)
		(= (dia-inicio r28) 11)
		(= (dia-final r28) 16)

		(= (personas r29) 2)
		(= (dia-inicio r29) 24)
		(= (dia-final r29) 26)

		(= (personas r30) 2)
		(= (dia-inicio r30) 27)
		(= (dia-final r30) 27)

		(= (personas r31) 1)
		(= (dia-inicio r31) 6)
		(= (dia-final r31) 17)

		(= (personas r32) 2)
		(= (dia-inicio r32) 15)
		(= (dia-final r32) 23)

		(= (personas r33) 1)
		(= (dia-inicio r33) 21)
		(= (dia-final r33) 22)

		(= (personas r34) 1)
		(= (dia-inicio r34) 15)
		(= (dia-final r34) 19)

		(= (personas r35) 1)
		(= (dia-inicio r35) 5)
		(= (dia-final r35) 17)

		(= (personas r36) 4)
		(= (dia-inicio r36) 4)
		(= (dia-final r36) 29)

		(= (personas r37) 1)
		(= (dia-inicio r37) 26)
		(= (dia-final r37) 29)

		(= (personas r38) 2)
		(= (dia-inicio r38) 23)
		(= (dia-final r38) 27)

		(= (personas r39) 4)
		(= (dia-inicio r39) 29)
		(= (dia-final r39) 29)

		(= (personas r40) 3)
		(= (dia-inicio r40) 25)
		(= (dia-final r40) 26)

		(= (personas r41) 2)
		(= (dia-inicio r41) 26)
		(= (dia-final r41) 27)

		(= (personas r42) 3)
		(= (dia-inicio r42) 16)
		(= (dia-final r42) 25)

		(= (personas r43) 4)
		(= (dia-inicio r43) 9)
		(= (dia-final r43) 21)

		(= (personas r44) 1)
		(= (dia-inicio r44) 19)
		(= (dia-final r44) 21)

		(= (personas r45) 4)
		(= (dia-inicio r45) 5)
		(= (dia-final r45) 23)

		(= (personas r46) 3)
		(= (dia-inicio r46) 24)
		(= (dia-final r46) 26)

		(= (personas r47) 3)
		(= (dia-inicio r47) 11)
		(= (dia-final r47) 12)

		(= (personas r48) 2)
		(= (dia-inicio r48) 19)
		(= (dia-final r48) 19)

		(= (personas r49) 1)
		(= (dia-inicio r49) 28)
		(= (dia-final r49) 29)

		(= (personas r50) 3)
		(= (dia-inicio r50) 15)
		(= (dia-final r50) 18)

		(= (personas r51) 4)
		(= (dia-inicio r51) 24)
		(= (dia-final r51) 26)

		(= (personas r52) 1)
		(= (dia-inicio r52) 23)
		(= (dia-final r52) 24)

		(= (personas r53) 4)
		(= (dia-inicio r53) 1)
		(= (dia-final r53) 18)

		(= (personas r54) 2)
		(= (dia-inicio r54) 15)
		(= (dia-final r54) 16)

		(= (personas r55) 1)
		(= (dia-inicio r55) 3)
		(= (dia-final r55) 9)

		(= (personas r56) 4)
		(= (dia-inicio r56) 8)
		(= (dia-final r56) 11)

		(= (personas r57) 4)
		(= (dia-inicio r57) 5)
		(= (dia-final r57) 28)

		(= (personas r58) 4)
		(= (dia-inicio r58) 3)
		(= (dia-final r58) 24)

		(= (personas r59) 1)
		(= (dia-inicio r59) 4)
		(= (dia-final r59) 4)

		(= (personas r60) 4)
		(= (dia-inicio r60) 11)
		(= (dia-final r60) 19)

		(= (personas r61) 2)
		(= (dia-inicio r61) 11)
		(= (dia-final r61) 15)

		(= (personas r62) 3)
		(= (dia-inicio r62) 2)
		(= (dia-final r62) 4)

		(= (personas r63) 1)
		(= (dia-inicio r63) 6)
		(= (dia-final r63) 6)

		(= (personas r64) 3)
		(= (dia-inicio r64) 5)
		(= (dia-final r64) 6)

		(= (personas r65) 1)
		(= (dia-inicio r65) 6)
		(= (dia-final r65) 26)

		(= (personas r66) 1)
		(= (dia-inicio r66) 13)
		(= (dia-final r66) 15)

		(= (personas r67) 1)
		(= (dia-inicio r67) 28)
		(= (dia-final r67) 28)

		(= (personas r68) 1)
		(= (dia-inicio r68) 1)
		(= (dia-final r68) 23)

		(= (personas r69) 4)
		(= (dia-inicio r69) 30)
		(= (dia-final r69) 30)

		(= (personas r70) 4)
		(= (dia-inicio r70) 11)
		(= (dia-final r70) 24)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
