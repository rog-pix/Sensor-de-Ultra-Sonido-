`timescale 1ns / 1ps
`include "./top.v"

module top_tb ();
  // Señales del testbench
	reg  clk_tb;  // Señal de reloj para la simulación
	wire trigger_tb;  // Señal de salida del trigger
	reg echo_signal_tb;
	wire echo_active_tb;
	wire probe;  // Señal de salida del trigger
	wire reset;  
	wire [6:0] contador_echo_tb;
	wire [1:0] bcd0_tb;           // Salida para el dígito de las unidades
    wire [1:0] bcd1_tb;           // Salida para el dígito de las decenas
	wire [3:0] salida_mux_tb;    
	reg  selector_tb;  
	wire [6:0] segmentos_tb;    // Salida para el display de 7 segmentos
	wire [1:0] catodo_tb; // Salida para el cátodo
	wire pulso2_tb;               // Salida de pulso2
  
  // Instancia del módulo a probar (UUT - Unit Under Test)
  top UUT (
      .clk(clk_tb),
      .trigger(trigger_tb),
      .echo_signal(echo_signal_tb),
      .echo_active(echo_active_tb),
      .contador_echo(contador_echo_tb),
      .bcd0(bcd0_tb),
      .bcd1(bcd1_tb),
      .salida_mux(salida_mux_tb), // Salida del MUX
	  .selector(selector_tb),
	  .segmentos(segmentos_tb), 
	  .catodo(catodo_tb), // Salida del cátodo
	  .pulso2(pulso2_tb)   
  );

  // Generador de señal de reloj (25 MHz)
  initial begin
    clk_tb = 0;
    forever #20 clk_tb = ~clk_tb;  // Período de 40 ns (25 MHz)
  end

  // Proceso de simulación
  initial begin
	
	echo_signal_tb = 0; // Inicializa la señal ECHO
    selector_tb = 0;
    
    // Inicialización de la simulación
    // Mensajes de inicio
    $display("Iniciando la simulación...");
    
     // Simulación del ECHO inicio prueba
        #1000;
                 
        echo_signal_tb = 1; // Activa la señal ECHO
        #60000;             // Mantiene el ECHO alto por aproximadamente 1.2 ms (simulando una distancia)
        echo_signal_tb = 0; // Desactiva la señal ECHO

        #20000;
        
        // Cambia el selector para probar la salida
		selector_tb = 1; // Cambia a decenas
		#100; // Mantiene el selector en 1 durante más tiempo
		selector_tb = 0; // Cambia de nuevo a unidades
		#100; // Mantiene el selector en 0 durante más tiempo
        
        //fin prueba

    $display("Fin de la simulación.");
    #20000 $finish;
  end

  initial begin
    // $dumpfile("ControladorTrigger_tb.vcd");
    $dumpvars(0, top_tb);
  end
  
endmodule
