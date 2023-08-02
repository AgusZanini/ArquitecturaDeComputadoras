# Proyecto de laboratorio de Arquitectura de Computadoras 2

Se realizaron dos ejercicios de programación bare-metal sobre una Raspberry pi 3.

## Ejercicio 1:

El primer ejercicio consiste en pintar un arcoiris en la pantalla en la que se conecte la Raspberry, se debieron cumplir algunas condiciones:
* Las transiciones de un color a otro deben ser graduales, por ejemplo, para transicionar de rojo a amarillo se va gradualmente aumentando el amarillo y disminuyendo el rojo
* Las transiciones de colores se deben hacer horizontalmente, lo que generaria barras verticales con cada color
* Se debe empezar en color rojo y terminar en rojo

![arcoiris](https://github.com/AgusZanini/ArquitecturaDeComputadoras/blob/master/imagenes/arcoiris.png)

## Ejercicio 2:

El segundo ejercicio consiste en el desarrollo de un juego a eleccion, que debe complir con ciertas condiciones:
* Se nos facilitó de un control que debemos usar para mover el personaje, usando los GPIO
* Debe haber colisiones
* Debe haber, por lo menos 2 tipos de figuras distintas
* Se debe hacer uso de 2 leds segun alguna logica deseada, un led es de color rojo y otro de color verde

El juego desarrollado es un escape de un laberinto, el personaje es un triangulo verde que debe llegar hasta el final del laberinto, cuando el juego empieza el led rojo se prende, y cuando se llega al final el mismo se apaga y se prende el led verde

![laberinto](https://github.com/AgusZanini/ArquitecturaDeComputadoras/blob/master/imagenes/laberinto.png)

Diseño del laberinto

![personaje](https://github.com/AgusZanini/ArquitecturaDeComputadoras/blob/master/imagenes/personaje.png)

Personaje

Lamentablemente no se cuentan con mas imagenes del proyecto, la Raspberry tuvo que ser devuelta a la universidad luego de la entrega.

Los códigos podrían mejorarse, el ejercicio dos particularmente tiene muchas instrucciones que podrian ser reutilizadas, lo que daría un codigo mas corto y elegante. Por cuestiones de tiempo no se logró mejorar esto para la entrega.
