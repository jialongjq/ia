(define (problem basico)
	(:domain hotel)
	(:objects
		h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 h17 h18 h19 h20 h21 h22 h23 h24 h25 h26 h27 h28 h29 h30 h31 h32 h33 h34 h35 h36 h37 h38 h39 h40 h41 h42 h43 h44 h45 h46 h47 h48 h49 h50 h51 h52 h53 h54 h55 h56 h57 h58 h59 h60 h61 h62 h63 h64 h65 h66 h67 h68 h69 h70 h71 h72 h73 h74 h75 h76 h77 h78 h79 h80 - habitacion
		r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 r11 r12 r13 r14 r15 r16 r17 r18 r19 r20 r21 r22 r23 r24 r25 r26 r27 r28 r29 r30 r31 r32 r33 r34 r35 r36 r37 r38 r39 r40 r41 r42 r43 r44 r45 r46 r47 r48 r49 r50 r51 r52 r53 r54 r55 r56 r57 r58 r59 r60 r61 r62 r63 r64 r65 r66 r67 r68 r69 r70 r71 r72 r73 r74 r75 r76 r77 r78 r79 r80 - reserva
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

		(= (capacidad h71) 1)
		(= (dia-libre h71) 1)

		(= (capacidad h72) 4)
		(= (dia-libre h72) 1)

		(= (capacidad h73) 3)
		(= (dia-libre h73) 1)

		(= (capacidad h74) 2)
		(= (dia-libre h74) 1)

		(= (capacidad h75) 3)
		(= (dia-libre h75) 1)

		(= (capacidad h76) 4)
		(= (dia-libre h76) 1)

		(= (capacidad h77) 3)
		(= (dia-libre h77) 1)

		(= (capacidad h78) 1)
		(= (dia-libre h78) 1)

		(= (capacidad h79) 4)
		(= (dia-libre h79) 1)

		(= (capacidad h80) 3)
		(= (dia-libre h80) 1)

		(= (personas r1) 1)
		(= (dia-inicio r1) 8)
		(= (dia-final r1) 20)

		(= (personas r2) 1)
		(= (dia-inicio r2) 9)
		(= (dia-final r2) 20)

		(= (personas r3) 3)
		(= (dia-inicio r3) 4)
		(= (dia-final r3) 17)

		(= (personas r4) 1)
		(= (dia-inicio r4) 20)
		(= (dia-final r4) 22)

		(= (personas r5) 4)
		(= (dia-inicio r5) 27)
		(= (dia-final r5) 27)

		(= (personas r6) 3)
		(= (dia-inicio r6) 23)
		(= (dia-final r6) 27)

		(= (personas r7) 4)
		(= (dia-inicio r7) 25)
		(= (dia-final r7) 29)

		(= (personas r8) 3)
		(= (dia-inicio r8) 11)
		(= (dia-final r8) 12)

		(= (personas r9) 2)
		(= (dia-inicio r9) 18)
		(= (dia-final r9) 27)

		(= (personas r10) 1)
		(= (dia-inicio r10) 3)
		(= (dia-final r10) 9)

		(= (personas r11) 2)
		(= (dia-inicio r11) 23)
		(= (dia-final r11) 24)

		(= (personas r12) 2)
		(= (dia-inicio r12) 21)
		(= (dia-final r12) 29)

		(= (personas r13) 1)
		(= (dia-inicio r13) 16)
		(= (dia-final r13) 29)

		(= (personas r14) 1)
		(= (dia-inicio r14) 30)
		(= (dia-final r14) 30)

		(= (personas r15) 2)
		(= (dia-inicio r15) 10)
		(= (dia-final r15) 21)

		(= (personas r16) 2)
		(= (dia-inicio r16) 28)
		(= (dia-final r16) 29)

		(= (personas r17) 4)
		(= (dia-inicio r17) 6)
		(= (dia-final r17) 27)

		(= (personas r18) 2)
		(= (dia-inicio r18) 28)
		(= (dia-final r18) 28)

		(= (personas r19) 2)
		(= (dia-inicio r19) 4)
		(= (dia-final r19) 26)

		(= (personas r20) 4)
		(= (dia-inicio r20) 17)
		(= (dia-final r20) 22)

		(= (personas r21) 4)
		(= (dia-inicio r21) 15)
		(= (dia-final r21) 28)

		(= (personas r22) 4)
		(= (dia-inicio r22) 3)
		(= (dia-final r22) 29)

		(= (personas r23) 3)
		(= (dia-inicio r23) 30)
		(= (dia-final r23) 30)

		(= (personas r24) 4)
		(= (dia-inicio r24) 19)
		(= (dia-final r24) 22)

		(= (personas r25) 1)
		(= (dia-inicio r25) 11)
		(= (dia-final r25) 16)

		(= (personas r26) 2)
		(= (dia-inicio r26) 24)
		(= (dia-final r26) 26)

		(= (personas r27) 2)
		(= (dia-inicio r27) 27)
		(= (dia-final r27) 27)

		(= (personas r28) 1)
		(= (dia-inicio r28) 6)
		(= (dia-final r28) 17)

		(= (personas r29) 2)
		(= (dia-inicio r29) 15)
		(= (dia-final r29) 23)

		(= (personas r30) 1)
		(= (dia-inicio r30) 21)
		(= (dia-final r30) 22)

		(= (personas r31) 1)
		(= (dia-inicio r31) 15)
		(= (dia-final r31) 19)

		(= (personas r32) 1)
		(= (dia-inicio r32) 5)
		(= (dia-final r32) 17)

		(= (personas r33) 4)
		(= (dia-inicio r33) 4)
		(= (dia-final r33) 29)

		(= (personas r34) 1)
		(= (dia-inicio r34) 26)
		(= (dia-final r34) 29)

		(= (personas r35) 2)
		(= (dia-inicio r35) 23)
		(= (dia-final r35) 27)

		(= (personas r36) 4)
		(= (dia-inicio r36) 29)
		(= (dia-final r36) 29)

		(= (personas r37) 3)
		(= (dia-inicio r37) 25)
		(= (dia-final r37) 26)

		(= (personas r38) 2)
		(= (dia-inicio r38) 26)
		(= (dia-final r38) 27)

		(= (personas r39) 3)
		(= (dia-inicio r39) 16)
		(= (dia-final r39) 25)

		(= (personas r40) 4)
		(= (dia-inicio r40) 9)
		(= (dia-final r40) 21)

		(= (personas r41) 1)
		(= (dia-inicio r41) 19)
		(= (dia-final r41) 21)

		(= (personas r42) 4)
		(= (dia-inicio r42) 5)
		(= (dia-final r42) 23)

		(= (personas r43) 3)
		(= (dia-inicio r43) 24)
		(= (dia-final r43) 26)

		(= (personas r44) 3)
		(= (dia-inicio r44) 11)
		(= (dia-final r44) 12)

		(= (personas r45) 2)
		(= (dia-inicio r45) 19)
		(= (dia-final r45) 19)

		(= (personas r46) 1)
		(= (dia-inicio r46) 28)
		(= (dia-final r46) 29)

		(= (personas r47) 3)
		(= (dia-inicio r47) 15)
		(= (dia-final r47) 18)

		(= (personas r48) 4)
		(= (dia-inicio r48) 24)
		(= (dia-final r48) 26)

		(= (personas r49) 1)
		(= (dia-inicio r49) 23)
		(= (dia-final r49) 24)

		(= (personas r50) 4)
		(= (dia-inicio r50) 1)
		(= (dia-final r50) 18)

		(= (personas r51) 2)
		(= (dia-inicio r51) 15)
		(= (dia-final r51) 16)

		(= (personas r52) 1)
		(= (dia-inicio r52) 3)
		(= (dia-final r52) 9)

		(= (personas r53) 4)
		(= (dia-inicio r53) 8)
		(= (dia-final r53) 11)

		(= (personas r54) 4)
		(= (dia-inicio r54) 5)
		(= (dia-final r54) 28)

		(= (personas r55) 4)
		(= (dia-inicio r55) 3)
		(= (dia-final r55) 24)

		(= (personas r56) 1)
		(= (dia-inicio r56) 4)
		(= (dia-final r56) 4)

		(= (personas r57) 4)
		(= (dia-inicio r57) 11)
		(= (dia-final r57) 19)

		(= (personas r58) 2)
		(= (dia-inicio r58) 11)
		(= (dia-final r58) 15)

		(= (personas r59) 3)
		(= (dia-inicio r59) 2)
		(= (dia-final r59) 4)

		(= (personas r60) 1)
		(= (dia-inicio r60) 6)
		(= (dia-final r60) 6)

		(= (personas r61) 3)
		(= (dia-inicio r61) 5)
		(= (dia-final r61) 6)

		(= (personas r62) 1)
		(= (dia-inicio r62) 6)
		(= (dia-final r62) 26)

		(= (personas r63) 1)
		(= (dia-inicio r63) 13)
		(= (dia-final r63) 15)

		(= (personas r64) 1)
		(= (dia-inicio r64) 28)
		(= (dia-final r64) 28)

		(= (personas r65) 1)
		(= (dia-inicio r65) 1)
		(= (dia-final r65) 23)

		(= (personas r66) 4)
		(= (dia-inicio r66) 30)
		(= (dia-final r66) 30)

		(= (personas r67) 4)
		(= (dia-inicio r67) 11)
		(= (dia-final r67) 24)

		(= (personas r68) 2)
		(= (dia-inicio r68) 4)
		(= (dia-final r68) 29)

		(= (personas r69) 3)
		(= (dia-inicio r69) 11)
		(= (dia-final r69) 23)

		(= (personas r70) 4)
		(= (dia-inicio r70) 11)
		(= (dia-final r70) 25)

		(= (personas r71) 1)
		(= (dia-inicio r71) 12)
		(= (dia-final r71) 23)

		(= (personas r72) 2)
		(= (dia-inicio r72) 10)
		(= (dia-final r72) 23)

		(= (personas r73) 4)
		(= (dia-inicio r73) 19)
		(= (dia-final r73) 23)

		(= (personas r74) 1)
		(= (dia-inicio r74) 27)
		(= (dia-final r74) 29)

		(= (personas r75) 1)
		(= (dia-inicio r75) 1)
		(= (dia-final r75) 25)

		(= (personas r76) 1)
		(= (dia-inicio r76) 7)
		(= (dia-final r76) 27)

		(= (personas r77) 1)
		(= (dia-inicio r77) 8)
		(= (dia-final r77) 21)

		(= (personas r78) 4)
		(= (dia-inicio r78) 20)
		(= (dia-final r78) 28)

		(= (personas r79) 1)
		(= (dia-inicio r79) 3)
		(= (dia-final r79) 7)

		(= (personas r80) 1)
		(= (dia-inicio r80) 10)
		(= (dia-final r80) 19)

	)
	(:goal (forall (?reserva - reserva) (servida ?reserva)))
)
