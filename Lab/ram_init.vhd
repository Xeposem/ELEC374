library ieee;
use ieee.std_logic_1164.all;

package ram_init is

type mem is array (0 to 511) of std_logic_vector(31 downto 0);

constant initial_mem : mem := ( 
x"08800057", --0	ldi R1, $87; R1 = $57				00001/0001/000_0/000/0000/0000/0101/0111
x"59100002", --1	ldi  R3, 1(R3); R3 = $88			00001/0011/0011/0000000000000000001
x"01000066", --2	ld R2, $66; R2 = ($66) = $57		00000/0010/0000/0000000000001000010
x"0917FFFF", --3	ldi R2, -1(R2); R2 = $56			00001/0010/0010/1111111111111111111
x"1B800061", --4	ldr R7, $61; R7 = ($61+ 5) = $57	00011/0111/0000/0000000000000111101
x"23800060", --5	str  $60, R7; ($66) = $57			00100/0111/0000/0000000000000111100
x"00900000", --6	ld R1, 0(R2); R1 = ($56) = $34		00000/0001/0010/0000000000000000000
x"08000001", --7	ldi R0, 1; R0 = 1					00001/0000/0000/0000000000000000001
x"D8000000", --8	nop									11011/000000000000000000000000000
x"29918000", --9	add   R3, R2, R3; R3 = $DE			00101/0011/0010/0011/000000000000000
x"6BB80002", --10	addi  R7, R7, 2; R7 = $59			01101/0111/0111/0000000000000000010
x"93B80000", --11	neg R7, R7; R7 = $FFFFFFA7			10010/0111/0111/0000000000000000000
x"9BB80000", --12	not R7, R7; R7 = $58				10011/0111/0111/0000000000000000000
x"73B8000F", --13	andi R7, R7, $0F; R7 = 8			01110/0111/0111/0000000000000001111
x"7B880003", --14	ori R7, R1, 3; R7 = $37				01111/0111/0001/0000000000000000011
x"49180000", --15	shr  R2, R3, R0; R2 = $6F			01001/0010/0011/0000/000000000000000
x"11000056", --16	st $56, R2; ($56) = $6F				00010/0010/0000/0000000000000111000
x"58880000", --17	ror R1, R1, R0; R1 = $0000001A		01011/0001/0001/0000/000000000000000
x"61100000", --18	rol R2, R2, R0; R2 = $DE			01100/0010/0010/0000/000000000000000
x"41180000", --19	or R2, R3, R0; R2 = $DF				01000/0010/0011/0000/000000000000000
x"38908000", --20	and R1, R2, R1 ; R1 = $1A			00111/0001/0010/0001/000000000000000
x"1188004C", --21	st $4C(R1), R3 ; ($66) = $DE		00010/0011/0001/0000000000001100110
x"31918000", --22	sub R3, R2, R3 ; R3 = 1				00110/0011/0010/0011/000000000000000
x"50900000", --23	shl R1, R2, R0 ; R1 = $1BE			01010/0001/0010/0000/000000000000000
x"0A000005", --24	ldi R4, 5 ; R4 = 5					00001/0100/0000/0000000000000000101
x"0A80001F", --25	ldi R5, $1F ; R5 = $1F				00001/0101/0000/0000000000000011111
x"82A00000", --26	
x"CB800000", --27	
x"D3000000", --28
x"8AA00000", --29	
x"0D200000", --30	
x"0DA80000", --31	
x"0E300000", --32	
x"0EB80000", --33	
x"B6700000", --34	
x"E0000000", --35	
x"00000000", --36	
x"00000000", --37
x"00000000", --38
x"00000000", --39
x"00000000", --40
x"00000000", --41     
x"00000000", --42																
x"00000000", --43     
x"00000000", --44      
x"00000000", --45     
x"00000000", --46
x"A9000000", --47  
x"B1700000", --48  
x"00000000", --49
x"71180019", --50 
x"79180019", --51  
x"00000000", --52  
x"00000000", --53
x"00000000", --54  
x"00000000", --55
x"00000022", --56   -- holds the value 34 for phase 3
x"00000000", --57
x"00000000", --58
x"00000000", --59
x"CA000000", --60  
x"D3000000", --61  
x"00000000", --62
x"00000000", --63
x"00000000", --64
x"00000000", --65 
x"00000039", --66    -- holds the value 57 for phase 3
x"00000000", --67
x"00000000", --68
x"00000000", --69
x"0000000a", --70 
x"00000000", --71
x"00000000", --72
x"00000000", --73
x"00000000", --74
x"00000000", --75
x"00000000", --76
x"00000000", --77
x"00000000", --78
x"00000000", --79
x"00000000", --80
x"00000000", --81
x"00000000", --82
x"00000000", --83
x"00000000", --84
x"00000000", --85
x"00000034", --86/$56   phase 3
x"00000000", --87
x"00000000", --88
x"00000000", --89
x"00000000", --90
x"00000000", --91
x"00000000", --92
x"00000000", --93
x"00000000", --94
x"00000000", --95
x"00000000", --96
x"00000000", --97
x"00000000", --98
x"00000000", --99
x"000000aa", --100 
x"00000000", --101
x"00000057", --102/$66  -- phase 3
x"00000000", --103
x"00000000", --104
x"00000000", --105
x"00000000", --106
x"00000000", --107
x"00000000", --108
x"00000000", --109
x"00000000", --110
x"00000000", --111
x"00000000", --112
x"00000000", --113
x"00000000", --114
x"00000000", --115
x"00000000", --116
x"00000000", --117
x"00000000", --118
x"00000000", --119
x"00000000", --120
x"00000000", --121
x"00000000", --122
x"00000000", --123
x"00000000", --124
x"00000000", --125
x"00000000", --126
x"00000000", --127
x"00000000", --128
x"00000000", --129
x"00000000", --130
x"00000000", --131
x"00000000", --132
x"00000000", --133
x"00000000", --134
x"00000000", --135
x"00000000", --136
x"00000000", --137
x"00000000", --138
x"00000000", --139
x"00000000", --140
x"00000000", --141
x"00000000", --142
x"00000000", --143
x"00000000", --144
x"00000000", --145
x"00000000", --146
x"00000000", --147
x"00000000", --148
x"00000000", --149
x"00000000", --150
x"00000000", --151
x"00000000", --152
x"00000000", --153
x"00000000", --154	subA ORG $9B ; procedure subA
x"2CD60000", --155	add R9, R10, R12 ; R8 and R9 are return value registers	00101/1001/1010/1100/000000000000000
x"345E8000", --156	sub R8, R11, R13 ; R9 = $A0, R8 = $1F					00110/1000/1011/1101/000000000000000
x"34CC0000", --157	sub R9, R9, R8 ; R9 = $81								00110/1001/1001/1000/000000000000000
x"AF000000", --158	jr R14 ; return from procedure							10101/1110/00000000000000000000000
x"00000000", --159
x"00000000", --160
x"00000000", --161
x"00000000", --162
x"00000000", --163
x"00000000", --164
x"00000000", --165
x"00000000", --166
x"00000000", --167
x"00000000", --168
x"00000000", --169
x"00000000", --170
x"00000000", --171
x"00000000", --172
x"00000000", --173
x"00000000", --174
x"00000000", --175
x"00000000", --176
x"00000000", --177
x"00000000", --178
x"00000000", --179
x"00000000", --180
x"00000000", --181
x"00000000", --182
x"00000000", --183
x"00000000", --184
x"00000000", --185
x"00000000", --186
x"00000000", --187
x"00000000", --188
x"00000000", --189
x"00000000", --190
x"00000000", --191
x"00000000", --192
x"00000000", --193
x"00000000", --194
x"00000000", --195
x"00000000", --196
x"00000000", --197
x"00000000", --198
x"00000000", --199
x"00000000", --200
x"00000000", --201
x"00000000", --202
x"00000000", --203
x"00000000", --204
x"00000000", --205
x"00000000", --206
x"00000000", --207
x"00000000", --208
x"00000000", --209
x"00000000", --210
x"00000000", --211
x"00000000", --212
x"00000000", --213
x"00000000", --214
x"00000000", --215
x"00000000", --216
x"00000000", --217
x"00000000", --218
x"00000000", --219
x"00000000", --220
x"00000000", --221
x"00000000", --222
x"00000000", --223
x"00000000", --224
x"00000000", --225
x"00000000", --226
x"00000000", --227
x"00000000", --228
x"00000000", --229
x"00000000", --230
x"00000000", --231
x"00000000", --232
x"00000000", --233
x"00000000", --234
x"00000000", --235
x"00000000", --236
x"00000000", --237
x"00000000", --238
x"00000000", --239
x"00000000", --240
x"00000000", --241
x"00000000", --242
x"00000000", --243
x"00000000", --244
x"00000000", --245
x"00000000", --246
x"00000000", --247
x"00000000", --248
x"00000000", --249
x"00000000", --250
x"00000000", --251
x"00000000", --252
x"00000000", --253
x"00000000", --254
x"00000000", --255
x"00000000", --256
x"00000000", --257
x"00000000", --258
x"00000000", --259
x"00000000", --260
x"00000000", --261
x"00000000", --262
x"00000000", --263
x"00000000", --264
x"00000000", --265
x"00000000", --266
x"00000000", --267
x"00000000", --268
x"00000000", --269
x"00000000", --270
x"00000000", --271
x"00000000", --272
x"00000000", --273
x"00000000", --274
x"00000000", --275
x"00000000", --276
x"00000000", --277
x"00000000", --278
x"00000000", --279
x"00000000", --280
x"00000000", --281
x"00000000", --282
x"00000000", --283
x"00000000", --284
x"00000000", --285
x"00000000", --286
x"00000000", --287
x"00000000", --288
x"00000000", --289
x"00000000", --290
x"00000000", --291
x"00000000", --292
x"00000000", --293
x"00000000", --294
x"00000000", --295
x"00000000", --296
x"00000000", --297
x"00000000", --298
x"00000000", --299
x"00000000", --300
x"00000000", --301
x"00000000", --302
x"00000000", --303
x"00000000", --304
x"00000000", --305
x"00000000", --306
x"00000000", --307
x"00000000", --308
x"00000000", --309
x"00000000", --310
x"00000000", --311
x"00000000", --312
x"00000000", --313
x"00000000", --314
x"00000000", --315
x"00000000", --316
x"00000000", --317
x"00000000", --318
x"00000000", --319
x"00000000", --320
x"00000000", --321
x"00000000", --322
x"00000000", --323
x"00000000", --324
x"00000000", --325
x"00000000", --326
x"00000000", --327
x"00000000", --328
x"00000000", --329
x"00000000", --330
x"00000000", --331
x"00000000", --332
x"00000000", --333
x"00000000", --334
x"00000000", --335
x"00000000", --336
x"00000000", --337
x"00000000", --338
x"00000000", --339
x"00000000", --340
x"00000000", --341
x"00000000", --342
x"00000000", --343
x"00000000", --344
x"00000000", --345
x"00000000", --346
x"00000000", --347
x"00000000", --348
x"00000000", --349
x"00000000", --350
x"00000000", --351
x"00000000", --352
x"00000000", --353
x"00000000", --354
x"00000000", --355
x"00000000", --356
x"00000000", --357
x"00000000", --358
x"00000000", --359
x"00000000", --360
x"00000000", --361
x"00000000", --362
x"00000000", --363
x"00000000", --364
x"00000000", --365
x"00000000", --366
x"00000000", --367
x"00000000", --368
x"00000000", --369
x"00000000", --370
x"00000000", --371
x"00000000", --372
x"00000000", --373
x"00000000", --374
x"00000000", --375
x"00000000", --376
x"00000000", --377
x"00000000", --378
x"00000000", --379
x"00000000", --380
x"00000000", --381
x"00000000", --382
x"00000000", --383
x"00000000", --384
x"00000000", --385
x"00000000", --386
x"00000000", --387
x"00000000", --388
x"00000000", --389
x"00000000", --390
x"00000000", --391
x"00000000", --392
x"00000000", --393
x"00000000", --394
x"00000000", --395
x"00000000", --396
x"00000000", --397
x"00000000", --398
x"00000000", --399
x"00000000", --400
x"00000000", --401
x"00000000", --402
x"00000000", --403
x"00000000", --404
x"00000000", --405
x"00000000", --406
x"00000000", --407
x"00000000", --408
x"00000000", --409
x"00000000", --410
x"00000000", --411
x"00000000", --412
x"00000000", --413
x"00000000", --414
x"00000000", --415
x"00000000", --416
x"00000000", --417
x"00000000", --418
x"00000000", --419
x"00000000", --420
x"00000000", --421
x"00000000", --422
x"00000000", --423
x"00000000", --424
x"00000000", --425
x"00000000", --426
x"00000000", --427
x"00000000", --428
x"00000000", --429
x"00000000", --430
x"00000000", --431
x"00000000", --432
x"00000000", --433
x"00000000", --434
x"00000000", --435
x"00000000", --436
x"00000000", --437
x"00000000", --438
x"00000000", --439
x"00000000", --440
x"00000000", --441
x"00000000", --442
x"00000000", --443
x"00000000", --444
x"00000000", --445
x"00000000", --446
x"00000000", --447
x"00000000", --448
x"00000000", --449
x"00000000", --450
x"00000000", --451
x"00000000", --452
x"00000000", --453
x"00000000", --454
x"00000000", --455
x"00000000", --456
x"00000000", --457
x"00000000", --458
x"00000000", --459
x"00000000", --460
x"00000000", --461
x"00000000", --462
x"00000000", --463
x"00000000", --464
x"00000000", --465
x"00000000", --466
x"00000000", --467
x"00000000", --468
x"00000000", --469
x"00000000", --470
x"00000000", --471
x"00000000", --472
x"00000000", --473
x"00000000", --474
x"00000000", --475
x"00000000", --476
x"00000000", --477
x"00000000", --478
x"00000000", --479
x"00000000", --480
x"00000000", --481
x"00000000", --482
x"00000000", --483
x"00000000", --484
x"00000000", --485
x"00000000", --486
x"00000000", --487
x"00000000", --488
x"00000000", --489
x"00000000", --490
x"00000000", --491
x"00000000", --492
x"00000000", --493
x"00000000", --494
x"00000000", --495
x"00000000", --496
x"00000000", --497
x"00000000", --498
x"00000000", --499
x"00000000", --500
x"00000000", --501
x"00000000", --502
x"00000000", --503
x"00000000", --504
x"00000000", --505
x"00000000", --506
x"00000000", --507
x"00000000", --508
x"00000000", --509
x"00000000", --510
x"00000000" --511
);

end package ram_init;