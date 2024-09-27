module ControladorTrigger (
    input  wire clk,     // Señal de reloj de 25 MHz
    output wire trigger,  // Señal de trigger del sensor HCSR04
    output wire probe
);

  wire pulso;
  // Una sonda de pruebas
  //assign probe = pulso;

  // Instancia divisor de frecuencia
  DivisorFrecuencia divisor (
      .clk(clk),
      .pulso_start(pulso)
      // conexión de la señal lógica
  );

  // Instancia del generador de pulso
  GeneradorPulso generador (
      .clk(clk),
      .start(pulso),
      .trigger(trigger)
  
  );
endmodule


module DivisorFrecuencia (
    input wire clk,  // Señal de reloj de 25 MHz
    output reg pulso_start = 1'b0  // Señal de 191 Hz aprox.
);
  reg [18:0] contador = 19'b0;  // Contador para dividir la frecuencia
  
  always @(posedge clk) begin
    contador <= contador + 19'd1;
  
    if (contador <= 19'd1) begin  // 25 MHz / 191 Hz =  130900 ciclos de reloj
      pulso_start <= 1'd1;
    end else begin
      pulso_start <= 19'b0;
    end
  end
endmodule


module GeneradorPulso (
    input  wire clk,            // Señal de reloj de 25 MHz
    input  wire start,
    output reg  trigger = 1'b0  // Señal de trigger del sensor HCSR04
);

  reg [9:0] contador_us = 10'b0;  // Contador para los 10 microsegundos
  reg init = 1'b0;
  always @(posedge clk) begin

    // Si se percibe la señal de start hacer
    if (start == 1'b1) begin
      // Inicializar el conteo del trigger
      init <= 1'b1;
      // En caso contrario de no tener la señal de start debe verificar el init
    end else begin
      // Si init está en 1 debe empezar a contar
      if (init == 1'b1) begin
        // Contando
        contador_us = contador_us + 1;
        // Si la cuenta supera el límite debe poner en cero el triger y apagar
        // el init para que deje de hacer cuentas.
        if (contador_us > 24'd249) begin
          // Poner trigger en cero
          trigger <= 1'b0;
          // Detener cuenta
          init <= 1'b0;
          // En caso de que aún no se supere la cuenta debe mantener el
          // trigger en alto (1)
        end else begin
          // Trigger en 1
          trigger <= 1'b1;
        end
        // Debido a que el init está en cero, no debe contar más
      end else begin
        // Contador siempre en cero por no tener nueva cuenta
        contador_us <= 10'b0;
      end
    end

  end
endmodule

module GeneradorEcho (
    input wire clk,            // Señal de reloj de 25 MHz
    input wire echo_signal,    // Señal de ECHO del sensor
    output reg [6:0] contador_echo = 7'b0, // Contador de 14 bits para contar hasta 18250
    output reg echo_active = 1'b0,  // Indica si el ECHO está activa
	output reg reset = 1'b0
);

	parameter LIMITE = 127;  // Límite de conteo para 50 cm
	
	
    always @(posedge clk) begin
        if (echo_signal) begin
            echo_active <= 1'b1; // Activar señal de ECHO
            contador_echo <= contador_echo + 1; // Contar mientras ECHO está activo
        end else begin
            echo_active <= 1'b0; // Desactivar señal de ECHO
            contador_echo <= 7'b0; // Reiniciar el contador
        end
        
        if(contador_echo>=LIMITE)begin
			reset<=1'b0;
        end
        
        if (reset == 1'b1) begin
            contador_echo <= 7'b0;       // Reiniciar el contador
        end else if (contador_echo < LIMITE) begin
            contador_echo <= contador_echo + 1; // Incrementar el contador
        end else begin
            contador_echo <= 7'b0;       // Reiniciar el contador al alcanzar el límite
        end
    end
		
endmodule

module BinarioABCD (
    input wire [6:0] binario,     // Entrada de 7 bits en binario
    output reg [3:0] bcd0,         // Dígito de las unidades (0-9)
    output reg [3:0] bcd1          // Dígito de las decenas (0-9)
);

    integer i;
    reg [9:0] temp;  // Utilizamos un registro de 10 bits para el BCD

    always @(*) begin
        // Inicializar BCD
        bcd0 = 4'b0000;
        bcd1 = 4'b0000;
        temp = {3'b000, binario};  // Cargamos el valor binario en los 7 LSB

        // Algoritmo de conversión BCD
        for (i = 0; i < 7; i = i + 1) begin
            // Si el dígito es mayor o igual a 5, sumamos 3 para la corrección BCD
            if (temp[3:0] >= 4'b0101) begin
                temp[3:0] = temp[3:0] + 4'b0011;  // Unidades
            end
            if (temp[7:4] >= 4'b0101) begin
                temp[7:4] = temp[7:4] + 4'b0011;  // Decenas
            end
            // Desplazar a la izquierda
            temp = temp << 1;
        end

        // Asignar resultados a las salidas BCD
        bcd0 = temp[3:0];   // Las unidades
        bcd1 = temp[7:4];   // Las decenas
    end
endmodule

//mux para escoger dìgito

module mux_U_D (
    input wire [3:0] bcd0,          // Entrada para el dígito de las unidades
    input wire [3:0] bcd1,          // Entrada para el dígito de las decenas
    input wire selector,             // Selector: 0 para bcd0, 1 para bcd1
    output reg [3:0] salida,          // Salida de 4 bits
	output reg [1:0] catodo         // Salida para los cátodos (0: unidades, 1: decenas)
);
	
    always @(*) begin
        case (selector)
            1'b0: begin
                salida = bcd0;      // Si selector es 0, asigna bcd0 a la salida
                catodo = 2'b10;  // Se puede definir cómo se comporta el cátodo
            end
            1'b1: begin
                salida = bcd1;      // Si selector es 1, asigna bcd1 a la salida
                catodo = 2'b01;  // Ejemplo: activo bajo para el cátodo
            end
            default: begin
                salida = 4'b0;   // En caso de valor no esperado, salida en 0
                catodo = 2'b11;   // En caso de valor no esperado, cátodo en 0
            end
        endcase
    end
    
endmodule

module bin_to_7segmentos (
    input wire [3:0] salida,         // Entrada binaria de 4 bits
    output reg [6:0] segmentos    // Salida para el display de 7 segmentos
);
    always @(*) begin
	segmentos = 7'b0000000;
	
        case (salida)
            4'b0000: segmentos[0] = 7'b0111111; // 0
            4'b0001: segmentos[1] = 7'b0000110; // 1
            4'b0010: segmentos[2] = 7'b1011011; // 2
            4'b0011: segmentos[3] = 7'b1001111; // 3
            4'b0100: segmentos[4] = 7'b1100110; // 4
            4'b0101: segmentos[5] = 7'b1101101; // 5
            4'b0110: segmentos[6] = 7'b1111101; // 6
            4'b0111: segmentos[7] = 7'b0000111; // 7
            4'b1000: segmentos[8] = 7'b1111111; // 8
            4'b1001: segmentos[9] = 7'b1100111; // 9
        endcase
	
    end
    
endmodule

//modulo de carita triste

module divisor_frecuencia2 (
    input wire clk,           // Señal de reloj de 25 MHz
    output reg pulso2 = 1'b0  // Señal de salida que corresponde a 500 kHz
);
    reg [5:0] contador = 6'b0;  // Contador de 6 bits para contar hasta 50

    always @(posedge clk) begin
        if (contador < 6'd49) begin
            contador <= contador + 1;  // Incrementar contador
            pulso2 <= 1'b0;             // Mantener pulso2 en 0
        end else begin
            pulso2 <= 1'b1;             // Generar pulso
        end
        if (pulso2) begin
            contador <= 6'b0;     // Reiniciar contador si pulso2 es 1
            pulso2 <= 1'b0;       // Desactivar pulso2
       end
    end
endmodule



//`include "./ControladorTrigger.v"
module top (
    input  clk,
    //input wire echo_signal,        // Señal ECHO del sensor
    // outputs
    output trigger,
    input wire echo_signal,
    output wire echo_active,        // Indica si el ECHO está activo
	output wire [6:0] contador_echo,
    output wire [3:0] bcd0,   // Salida para unidades
    output wire [3:0] bcd1,    // Salida para decenas
	output wire [3:0] salida_mux, // Salida del MUX
	input wire selector,
	output wire [6:0] segmentos, // Salida para el display de 7 segmentos
	output wire [1:0] catodo, // Salida para el cátodo del display
	output wire pulso2          // Salida de pulso2

);

  
  ControladorTrigger controlador (
      .clk(clk),
      .trigger(trigger)
  );
  
  // Instancia de GeneradorEcho
    GeneradorEcho generador_echo (
        .clk(clk),
        .echo_signal(echo_signal),
        .contador_echo(contador_echo),
        .echo_active(echo_active)
    );
    
    // Instancia de la conversión de binario a BCD
    BinarioABCD convertidor (
        .binario(contador_echo),
        .bcd0(bcd0),
        .bcd1(bcd1)
    );


	 // Instancia de mux_U_D
    mux_U_D mux (
        .bcd0(bcd0),
        .bcd1(bcd1),
        .selector(selector),
        .salida(salida_mux),      // Salida del MUX
		.catodo(catodo)
  
    );

   // Instancia del módulo de conversión a 7 segmentos
    bin_to_7segmentos display (
        .salida(salida_mux), // Conecta la salida del MUX
        .segmentos(segmentos)
    );

	// Instancia del divisor de frecuencia
    divisor_frecuencia2 divisor (
        .clk(clk),
        .pulso2(pulso2)  // Salida del pulso2
    );


endmodule
