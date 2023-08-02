.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)  

	
	// Configurar GPIO 2 y 3 como output:
	mov X26,#0x240
	str w26,[x20,0] 		// 001 en los gpio 2 y 3   	
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)

	mov w26,0x4
	bl outputOff

	mov w3, 0xDFFF    	// color	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
loop2:
	mov x2,512         	// Tamaño en Y
loop1:
	mov x1,512         	// Tamaño en X
loop0:
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,loop0	   	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar

	add x10,x0,0		// reiniciar el framebuffer
	mov w3, 0x2FFF		// celeste paliducho
	mov x2,16		// tama;o en y
techo1:
	mov x1,512		// tama;o en x
techo0:
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   	// Decrementar el contador X
	cbnz x1,techo0	// Si no terminó la fila, saltar
	sub x2,x2,1	   	// Decrementar el contador Y
	cbnz x2,techo1	// Si no es la última fila, saltar
	
	mov x2,480
paredizq1:
	mov x1,16
paredizq0:
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   	// Decrementar el contador X
	cbnz x1,paredizq0	// Si no terminó la fila, saltar
	add x10,x10,992
	sub x2,x2,1	   	// Decrementar el contador Y
	cbnz x2,paredizq1	// Si no es la última fila, saltar
	
	mov x2,16
piso1:
	mov x1,512		// tama;o en x
piso0:
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1	   	// Decrementar el contador X
	cbnz x1,piso0	// Si no terminó la fila, saltar
	sub x2,x2,1	   	// Decrementar el contador Y
	cbnz x2,piso1	// Si no es la última fila, saltar
	
	
	add x10,x0,0
	mov x13,512
	mov x2,496
paredder1:
	mov x1,512
paredder0:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,496	   	
	bne paredder0		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,15		// Incrementar el contador Y
	bne paredder1		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,78
obsh11:
	mov x1,326
obsh10:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,62	   	
	bne obsh10		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,62		// Incrementar el contador Y
	bne obsh11		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,140
obsh21:
	mov x1,388
obsh20:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,186	   	
	bne obsh20		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,124		// Incrementar el contador Y
	bne obsh21		// Si no es la última fila, saltar
	
	add x10,x0,0
	mov x2,202
obsh31:
	mov x1,450
obsh30:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,140	   	
	bne obsh30		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,186		// Incrementar el contador Y
	bne obsh31		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,202
obsh41:
	mov x1,78
obsh40:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,15	   	
	bne obsh40		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,186		// Incrementar el contador Y
	bne obsh41		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,264
obsh51:
	mov x1,264
obsh50:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,140	   	
	bne obsh50		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,248		// Incrementar el contador Y
	bne obsh51		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,326
obsh61:
	mov x1,326
obsh60:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,248	   	
	bne obsh60		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,310		// Incrementar el contador Y
	bne obsh61		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,326
obsh71:
	mov x1,496
obsh70:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,388	   	
	bne obsh70		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,310		// Incrementar el contador Y
	bne obsh71		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,388
obsh81:
	mov x1,202
obsh80:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,78	   	
	bne obsh80		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,372		// Incrementar el contador Y
	bne obsh81		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,388
obsh91:
	mov x1,388
obsh90:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,310	   	
	bne obsh90		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,372		// Incrementar el contador Y
	bne obsh91		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,450
obsh101:
	mov x1,140
obsh100:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,62	   	
	bne obsh100		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,434		// Incrementar el contador Y
	bne obsh101		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,450
obsh111:
	mov x1,450
obsh110:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,186	   	
	bne obsh110		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,434		// Incrementar el contador Y
	bne obsh111		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,140
obsv11:
	mov x1,78
obsv10:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,62	   	
	bne obsv10		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,78		// Incrementar el contador Y
	bne obsv11		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,388
obsv21:
	mov x1,78
obsv20:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,62	   	
	bne obsv20		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,186		// Incrementar el contador Y
	bne obsv21		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,326
obsv31:
	mov x1,140
obsv30:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,124	   	
	bne obsv30		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,78		// Incrementar el contador Y
	bne obsv31		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,434
obsv41:
	mov x1,140
obsv40:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,124	   	
	bne obsv40		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,388		// Incrementar el contador Y
	bne obsv41		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,372
obsv51:
	mov x1,202
obsv50:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,186	   	
	bne obsv50		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,310		// Incrementar el contador Y
	bne obsv51		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,434
obsv61:
	mov x1,264
obsv60:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,248	   	
	bne obsv60		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,326		// Incrementar el contador Y
	bne obsv61		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,310
obsv71:
	mov x1,326
obsv70:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,310	   	
	bne obsv70		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,202		// Incrementar el contador Y
	bne obsv71		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,372
obsv81:
	mov x1,388
obsv80:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,372	   	
	bne obsv80		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,248		// Incrementar el contador Y
	bne obsv81		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,124
obsv91:
	mov x1,388
obsv90:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,372	   	
	bne obsv90		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,15		// Incrementar el contador Y
	bne obsv91		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,264
obsv101:
	mov x1,450
obsv100:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,434	   	
	bne obsv100		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,62		// Incrementar el contador Y
	bne obsv101		// Si no es la última fila, saltar

	add x10,x0,0
	mov x2,496
obsv111:
	mov x1,450
obsv110:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,434	   	
	bne obsv110		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,372		// Incrementar el contador Y
	bne obsv111		// Si no es la última fila, saltar

	mov w3,0xF800
	mov x2,494
llegada1:
	mov x1,494
llegada0:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,452	   	
	bne llegada0		// Si no terminó la fila, saltar
	sub x2,x2,1
	cmp x2,490		// Incrementar el contador Y
	bne llegada1		// Si no es la última fila, saltar


	add x10,x0,0
	

// la posicion inicial de x2 es 242 y la x es 49

	mov x15,0		// variacion en x
	mov x16,0		// variacion en y
	mov x17,0
triangulorec:
	mov w3,0x07E0		//verde
	mov x14,29		// 
	add x14,x14,x17		// posicion final en x (fin de linea)
	mov x2,242		// posicion inicial en y del vertice inferior derecho
	add x2,x2,x16		// le agrego la variacion
	mov x9,x2		
	sub x9,x9,20		// posicion final en y
triangulorec1:
	mov x1,49		// posicion inicial en x del vertice inferior derecho
	add x1,x1,x15
triangulorec0:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,x14		// me fijo si llegue al fin de linea	   	
	bne triangulorec0		// Si no terminó la fila, saltar
	add x14,x14,1		// le sumo uno al fin de linea
	sub x2,x2,1		// Incrementar el contador Y
	cmp x2,x9		// 
	bne triangulorec1		// Si no es la última fila, saltar

	mov x9,494
llegue1:
	mov x8,494
llegue0:
	mul x12,x9,x13
	add x10,x12,x8
	add x10,x10,x10
	add x10,x0,x10
	ldurh w7,[x10]
	cmp w3,w7
	beq win
	sub x8,x8,1		// Incrementar el contador X
	cmp x8,468	   	
	bne llegue0		// Si no terminó la fila, saltar
	sub x9,x9,1
	cmp x9,480		// Incrementar el contador Y
	bne llegue1		// Si no es la última fila, saltar
	b sigue

win:
	mov w26,0x8
	bl outputOff
	mov w26,0x4
	bl outputOn

sigue:
// --- Delay loop ---
	movz x11, 0x1, lsl #16
delay01: 
	sub x11,x11,#1
	cbnz x11, delay01
	// ------------------

mov w3, 0xDFFF    	// despues va a ser del mismo color del fondo
	mov x14,29		// 
	add x14,x14,x17		// posicion final en x (fin de linea)
	mov x2,242		// posicion inicial en y del vertice inferior derecho
	add x2,x2,x16		// le agrego la variacion
	mov x9,x2		
	sub x9,x9,20		// posicion final en y
borrartriangulorec1:
	mov x1,49		// posicion inicial en x del vertice inferior derecho
	add x1,x1,x15
borrartriangulorec0:
	mul x12,x2,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	sturh w3,[x10]
	add x10,x10,2	   	// Siguiente pixel
	sub x1,x1,1		// Incrementar el contador X
	cmp x1,x14		// me fijo si llegue al fin de linea	   	
	bne borrartriangulorec0		// Si no terminó la fila, saltar
	add x14,x14,1		// le sumo uno al fin de linea
	sub x2,x2,1		// Incrementar el contador Y
	cmp x2,x9		// 
	bne borrartriangulorec1		// Si no es la última fila, saltar

	

// leo los pulsadores

	bl inputRead		// Leo el GPIO17 y lo guardo en x21
	cbnz x22, movedown	// si el bit 17 no esta en 0, salto a moveright
	cbnz x23, moveleft
	cbnz x24, moveright
	cbnz x25, moveup
	b triangulorec

movedown:
	add x18,x2,21
	mul x12,x18,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	sub x19,x1,20
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	add x19,x19,10
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec
				
	add x16,x16,1
	b triangulorec
moveright:
	add x19,x1,2
	mul x12,x2,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	add x18,x2,20
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	sub x18,x18,10
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	add x15,x15,1
	add x17,x17,1
	b triangulorec
moveleft:
	sub x19,x1,21
	mul x12,x2,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	add x18,x2,20
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	sub x18,x18,10
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec
	
	sub x15,x15,1
	sub x17,x17,1
	b triangulorec
moveup:
	sub x18,x2,1
	mul x12,x18,x13
	add x10,x12,x1
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	sub x19,x1,20
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec

	add x19,x19,10
	mul x12,x18,x13
	add x10,x12,x19
	add x10,x10,x10
	add x10,x0,x10
	ldurh w8,[x10]
	cmp w8,w3
	bne triangulorec
	
	sub x16,x16,1
	b triangulorec

