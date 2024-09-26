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
   3.2. [Actuadores](#actuadores)
   3.2.3. [Servo Motor SG90](#servo-Motor-SG90)
   3.3. [FPGA](#fpga)
5. [Materiales](#materiales)
6. [Planteamiento del problema](#resultados)
7. [Análisis de resultados](#Análisisderesultados)
8. [Conclusiones](#conclusiones)
9. [Referecicas bibliográficas.](#Referenciasbibliográficas)

## Marco Teórico.

**1. Sensores.**
Un sensor es un dispositivo o instrumento que detecta y responde a ciertos cambios en su entorno físico. Estos cambios pueden incluir variaciones en temperatura, luz, presión, movimiento, humedad, entre otros. Los sensores convierten estas variaciones en señales eléctricas u ópticas que pueden ser leídas y procesadas por otros dispositivos, como un controlador o una computadora.

- **Sensor de ultrasonido HC-SR04:** El sensor de ultrasonido HC-SR04 es un dispositivo utilizado para medir distancias mediante la emisión y recepción de ondas ultrasónicas. Funciona emitiendo un pulso ultrasónico y  midiendo el tiempo que tarda en rebotar el eco del objeto y regresar al sensor. Con base en el tiempo de retorno del eco, el sensor calcula la distancia que se encuentra el objeto.
-  ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/79073a7b19030830ccc752ebbcefdbd83533bbc3/Im%C3%A1genes/ultrasonico.png)
- - _**Datasheet Sensor Ultrasonico HC-SR04.**_
  
      Voltaje de Operación: 5V DC
      
      Corriente de reposo: < 2mA
      
      Corriente de trabajo: 15mA
      
      Rango de medición: 2cm a 450cm
      
      Precisión: +- 3mm
      
      Ángulo de apertura: 15°
      
      Frecuencia de ultrasonido: 40KHz
      
      Duración mínima del pulso de disparo TRIG (nivel TTL): 10 μS
      
      Duración del pulso ECO de salida (nivel TTL): 100-25000 μS
      
      Dimensiones: 45*20*15 mm
      
      Tiempo mínimo de espera entre una medida y el inicio de otra 20ms (recomendable 50ms)
**2. Actuadores.**
Dispositivo que recibe energía y la convierte en una salida eléctrica, movimiento, fuerza. Los actuadores pueden ser de tipo lineal o rotativos.

- **Actuadores lineales:** Se caracterizan por mover objetos en línea recta, además de su repetibilidad y precisión de posicionamiento. Se usan para tareas de empuje, tracción, elevación y posicionamiento.
  
- **Servo Motor SG90:** Es un actuador rotativo compuesto por un motor eléctrico de corriente contínua, El SG90 funciona recibe una señal PWM (modulación por ancho de pulso) en su pin de control. Según la duración del pulso, el eje del servo se posicionará en un ángulo específico dentro del rango de 0° a 360° a una frecuencia de 50Hz, de esta forma se determina la dirección y y la posición.
- ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/1ea82c30775786714f6d031f3b4f034aedc0aa49/Im%C3%A1genes/servo.pgn)
- - _**Datasheet Servo Motor SG90:**_
    
       Voltaje de operación DC: 4.8V a 6V.
    
       Velocidad de operación: 0.12 s/60º (4.8V).
    
       Torque: 1.8 kg*cm (4.8V) y 2.2 Kg*cm (6V).
    
       Piñonería plástica.
    
       Incluye 3 accesorios plásticos y su tornillo de sujeción, 2 tornillos para montaje del servo y cable de conexión con conector.
    
       Conector universal tipo "S" compatible con la mayoría de receptores incluyendo Futaba, JR, GWS, Cirrus, Blue Bird, Blue Arrow, Corona, Berg, Spektrum y Hitec, entre otros.
  
       Longitud del cable: 25 cm.
    
       Dimensiones: 23 mm x 13 mm x 29 mm.
    
       Peso: 9 gr.
  
**3. FPGA**.  La FPGA un circuito integrado digital compuesto por una matriz de bloques lógicos configurables (CLBs) interconectados a través de una red de conmutación programable, lo que permite implementar diversas funciones de hardware de manera simultánea.. Las FPGA se componen de compuertas lógicas AND, OR, memoria RAM Y controladores de reloj, por lo que es idea para el diseño de sistemas embebidos con microprocesadores.
 ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/d73fb64c5d674c6e1685071ff206f6adb31e7c0a/Im%C3%A1genes/fpga.png)
- **Modulo 7 Segmentos cátodo común:**
Dispositivo utilizado para mostrar números de forma digital, compuesto por 7 LEDs organizados en forma de segmentos (etiquetados como a, b, c, d, e, f, g), que juntos pueden formar dígitos del 0 al 9. Este tipo de módulo se denomina "de cátodo común" porque todos los cátodos de los LEDs (las terminales negativas) están conectados entre sí y a un punto común es decir las pines deben estar alimntados con un 1 para ver las salidas, generalmente se conecta a tierra (GND). Para encender un segmento, se debe aplicar una señal positiva (voltaje) a los ánodos de los LEDs correspondientes.
- ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/03357fd636c7ee034f8a06be51200a71940481ae/Im%C3%A1genes/display-anodo-comum.png)
- ## Materiales.
- **Protoboard**.
Una protoboard (también conocida como placa de pruebas o breadboard) es una herramienta utilizada en electrónica para construir prototipos de circuitos de manera temporal, sin necesidad de soldadura. Es muy útil para desarrollar y probar circuitos electrónicos de forma rápida y sencilla, permitiendo realizar modificaciones sin dificultad.
![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/a651cf82ffbc38d8fae4dcfd9d38f7e72bf64bc6/Im%C3%A1genes/proto.pgn)
- **Jumpers**.
- Es un pequeño conector utilizado para establecer conexiones eléctricas temporales entre dos puntos en un circuito. Los jumpers son especialmente comunes en protoboards y en placas de desarrollo, donde se utilizan para conectar componentes de manera flexible y rápida sin necesidad de soldadura.
- ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/75be5ecf04d4a41ab92c25347c14ea4da3c68468/Im%C3%A1genes/jumper.pgn)
- **Pulsador**.
- también conocido como botón o interruptor momentáneo, es un componente electrónico que permite cerrar o abrir un circuito de manera temporal cuando se presiona. Su función principal es iniciar o detener el flujo de corriente eléctrica al accionar un circuito, como encender un LED, activar un motor o enviar una señal a un microcontrolador.
- ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/ddfc191e6d3bf7c24b04e956395bf0db3652c1ef/Im%C3%A1genes/pulsador.pgn)

 ## Planteamiento del ploblema
 Al momento de llevar acabo el problema se decidio trabajarlo en diferentes modulos ya que al trabajar todo el modulo completo en primera instancia al cometer un error es más dificil de encontrarlo 
 - **Contador**.
 -  ![Imagen](https://github.com/rog-pix/Sensor-de-Ultra-Sonido-/blob/83b31ead37eca3e755fa55ebe8207e23089b1bde/Im%C3%A1genes/contador.png)
 -  El modulo presentado tiene la finalidad de entrar una cantidad n de bit que entraran en codigo binario a decimal en primera instancia que a su vez pasaran por un mux que separara los 1 por decesnas y los 0 por unidades con la finalidad de darle un valor de entrada al contador, el codigo al estar en binario tendra que ser pasado a 7 segmentos mediante un display que mandra una señal a nuestro 7 segmentos para mostrarnos la distancia en forma númerica 
 -  por otro lado tenemos un pulso el cual pasa por una demux y nos activa de formas instantanea los dos 7 segmentos haciendo parecer que se prenden al instante ambos.
