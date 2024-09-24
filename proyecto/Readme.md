# Proyecto final: Radar

## Autores

- _Roger Moreno Giraldo_
- _Juan Felipe _

## Descripción

Este proyecto tiene como objetivo principal aplicar los conocimientos de la asignatura aprendidos en las clases magistrales y las prácticas de laboratorio, para ello se van a utilizar los siguientes actuadores y sensores: Sensor JoyStick, sensor ultrasonido y un servomotor.

## Contenido

1. [Autores](#autores)
2. [Descripción](#descripción)
3. [Marco Teórico](#marco-teórico)
   3.1. [Sensores](#sensores)
   3.1.1. [Sensor de ultrasonido HC-SR04](#sensor-de-ultrasonido-HC-SR04)
   3.1.2. [Sensor Joystick KY-023](#sensor-joystick-KY-023)
   3.2. [Actuadores](#actuadores)
   3.2.3. [Servo Motor SG90](#servo-Motor-SG90)
   3.3. [FPGA](#fpga)
5. [Materiales](#materiales)
6. [Resultados](#resultados)
7. [Análisis de resultados](#Análisisderesultados)
8. [Conclusiones](#conclusiones)
9. [Referecicas bibliográficas.](#Referenciasbibliográficas)

## Marco Teórico.

**1. Sensores.**
Un sensor es un dispositivo o instrumento que detecta y responde a ciertos cambios en su entorno físico. Estos cambios pueden incluir variaciones en temperatura, luz, presión, movimiento, humedad, entre otros. Los sensores convierten estas variaciones en señales eléctricas u ópticas que pueden ser leídas y procesadas por otros dispositivos, como un controlador o una computadora.

- **Sensor de ultrasonido HC-SR04:** El sensor de ultrasonido HC-SR04 es un dispositivo utilizado para medir distancias mediante la emisión y recepción de ondas ultrasónicas. Funciona emitiendo un pulso ultrasónico y  midiendo el tiempo que tarda en rebotar el eco del objeto y regresar al sensor. Con base en el tiempo de retorno del eco, el sensor calcula la distancia que se encuentra el objeto.
**2. Actuadores.**
Dispositivo que recibe energía y la convierte en una salida eléctrica, movimiento, fuerza. Los actuadores pueden ser de tipo lineal o rotativos.

- **Actuadores lineales:** Se caracterizan por mover objetos en línea recta, además de su repetibilidad y precisión de posicionamiento. Se usan para tareas de empuje, tracción, elevación y posicionamiento.
  
- **Actuadores rotativos:** Convierten la energía en movimiento giratorio mediante un eje que se encarga del control de la velocidad, posición y la rotación; funcionan con un motor de rotación que se acciona por señales eléctricas.  Se usan en equipos médicos, radares, monitorización, robótica y simuladores de vuelo.
  
- **Servo Motor SG90:** Es un actuador rotativo compuesto por un motor eléctrico de corriente contínual, que cuenta la capacidadd de seleccionar posición y mantenerse en dicho lugar, debido al circuito de control con el que cuenta, puede rotar 360°, el control se realiza por modulación de pulsos (PWM) a una frecuencia de 50Hz, de esta forma se determina la dirección y y la posición.
  
**3. FPGA**. (Fiel programmable Gate Array) es un circuito integrado digital que se compone por bloques lógicos configurables y puertos de entrada/salida; se caracteriza porque su funcionalidad e interconexión se pueden programar y reprogramar. Las FPGA se componen de compuertas lógicas AND, OR, memoria RAM Y controladores de reloj, por lo que es idea para el diseño de sistemas embebidos con microprocesadores.

- **Documentación**
A continuación se presentan las epecificaciones del proyecto.

- _**Datasheet Sensor Ultrasonico HC-SR04.**_
