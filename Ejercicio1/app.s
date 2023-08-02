.globl app
app:
	//---------------- Inicialización GPIO --------------------

	mov w20, PERIPHERAL_BASE + GPIO_BASE     // Dirección de los GPIO.		
	
	// Configurar GPIO 17 como input:
	mov X21,#0
	str w21,[x20,GPIO_GPFSEL1] 		// Coloco 0 en Function Select 1 (base + 4)   	
	
	//---------------- Main code --------------------
	// X0 contiene la dirección base del framebuffer (NO MODIFICAR)
	
		
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
loop2:
	mov x2,512         	// Tamaño en Y
loop1:
	mov x1,512         	// Tamaño en X

	mov w3, 0xF800    	// 0xF800 = ROJO	

	mov w12,0x0020		// unidad de verde
	mov w13,0x0800		// unidad de rojo
	mov w14,0x0001		// unidad de azul
	
	mov w15,0xFFE0		// seteo el amarillo en w15
	mov w16,0x07E0		// seteo el verde en w16
	mov w17,0x07FF		// seteo el celeste en w17
	mov w18,0x001F		// seteo el azul en w18
	mov w19,0xF81F		// seteo el violeta en w19
	mov w20,0xF800		// seteo el rojo en w20

rojoaamarillo:
	cmp w3,w15		// me fijo si w3 llego a amarillo
	b.eq amarilloaverde	// si llego termino
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel 
	add w3,w3,w12		// le sumo verde al rojo
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,rojoaamarillo	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar
	b InfLoop		// Si es la ultima fila, saltar a infloop

amarilloaverde:
	cmp w3,w16		// me fijo si w3 llego a verde
	b.eq verdeaceleste	// si llego termino
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel 
	sub w3,w3,w13		// le resto rojo al amarillo
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,amarilloaverde	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar	

verdeaceleste: 
	cmp w3,w17		// me fijo si w3 llego a celeste
	b.eq celesteaazul	// si llego termino
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	add w3,w3,w14		// le sumo azul al verde
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,verdeaceleste	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar

celesteaazul: 
	cmp w3,w18		// me fijo si w3 llego a verde
	b.eq azulavioleta	// si llego termino
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub w3,w3,w12		// le resto verde al celeste
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,celesteaazul	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar

azulavioleta: 
	cmp w3,w19		// me fijo si w3 llego a violeta
	b.eq violetaarojo	// si llego termino
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	add w3,w3,w13		// le sumo rojo al azul
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,azulavioleta	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar

violetaarojo:
	cmp w3,w20		// me fijo si w3 llego a rojo
	b.eq rojoaamarillo	// si llego termino, la primer vez que llegue a esta funcion deberia estar en el pixel 256, la segunda en el pixel 512
	sturh w3,[x10]	   	// Setear el color del pixel N
	add x10,x10,2	   	// Siguiente pixel
	sub w3,w3,w14		// le resto azul al violeta
	sub x1,x1,1	   		// Decrementar el contador X
	cbnz x1,violetaarojo	// Si no terminó la fila, saltar
	sub x2,x2,1	   		// Decrementar el contador Y
	cbnz x2,loop1	  	// Si no es la última fila, saltar

	// --- Delay loop ---
	movz x11, 0x10, lsl #16
delay1: 
	sub x11,x11,#1
	cbnz x11, delay1
	// ------------------
		
	bl inputRead		// Leo el GPIO17 y lo guardo en x21
	mov w3, 0x001F    	// 0x001F = AZUL	
	add x10, x0, 0		// X10 contiene la dirección base del framebuffer
	cbz X22, loop2
	mov w3, 0x07E0    	// 0x07E0 = VERDE			
	b loop2
	
	// --- Infinite Loop ---	
InfLoop: 
	b InfLoop
	