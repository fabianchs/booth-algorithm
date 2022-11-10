Algoritmo de Booth - Multiplicador con signo <a color="green" name="TOP"></a>
===================

<h4>Realizado por:</h4>
<p>-William Sánchez <br> -Johanel Álvarez <br> -Fabián Chacón </p>

# Descripción de funcionamiento y subsistemas #

<p>Este repositorio es un informe que contiene el desarrollo de un circuito con el algoritmo de Booth, encargado de realizar multiplicaciones con signo. El circuito consta de cuatro subsistemas:</p>

1. Subsistema lectura.
2. Subsistema de cálculo de multiplicación.
3. Subsistema de conversión de binario a representación BCD.
4. Subsistema de despliegue en display 7 segmentos.

<br/>


__1. Subsistema de Lectura__

<p>Este subsistema recibe operandos, y acondiciona los valores para acoplarlos al funcionamiento del algoritmo de booth</p>

En síntesis el subsistema realiza los siguientes pasos:

1. Adquiere los operandos A y B de 8 bits cada uno para realizar la operación de multiplicación.
2. Los operandos A y B se interpretan con signo en complemento a 2.
3. La entrada del código se captura y se sincroniza con el sistema principal por medio de un circuito antirebote con 4 etapas de Flip Flops en cascada por switch.
4. El circuito espera ante el accionar de un push button que debe ser presionado por al menos 500ms. Al cumplirse este tiempo, el sistema dará inicio a la operación aritmética de multiplicación.
5. El circuito no inicia otra operación hasta que el push button vuelva a su posición inicial enc aso de haberse cumplido con el punto anterior.
6. Cada bit adquirido por el sistema a cumplir el requisito 2, debe desplegar en un LED próximo al switch para indicar cómo fue leído.

<br>

__2. Subsistema de cálculo de multiplicación__

<p>Este subsistema se encarga de realizar la multiplicación con signo.</p>

1. El sistema recibe los operandos A y B del subsistema de lectura.
2. La operación de multiplicación se iniciará cuando el subsistema de lectura le indica a este subsistema que los operandos son válidos por medio de una bandera valid.
3.  El cálculo de multiplicación con signo se realiza de manera iterativa por medio del Algoritmo de
Booth.
4.  Este bloque indicará al siguiente bloque consecutivo cuando el resultado de la multiplicación está
estable para ser muestreado con una señal done.


<br>

__3. Subsistema de conversión de binario a representación BCD__

<p>Este subsistema toma los datos en código binario y los convierte a representación decimal.</p>

1. Este sistema registrará el resultado del bloque anterior (16 bits con signo) y lo convertirá en un formato BCD.
2. Se permite realizar la conversión de manera combinacional o secuencial.
3.  Deberá generar al menos 5 dígitos en BCD y uno de signo para el siguiente bloque.
4. Se indicará al siguiente bloque por medio de una bandera de done cuando está lista la conversión para
registrar.

__4. Subsistema de despliegue en display de 7 segmentos__

<p>Este subsistema toma los datos en BCD y los representa en el display de 7 segmentos.</p>

1. Este subsistema toma el resultado de la multiplicación en BCD y los despliega en los dispositivos 7
segmentos disponibles en la placa, de forma decimal e incluyendo el signo.
2. Deberá utilizar al menos 6 dígitos disponibles del 7 segmentos.
3. El sistema deberá tener la tasa de refresco adecuada para una visualización cómoda por parte del
usuario.

# Diagrama de bloques de cada subsistema #


<br/>

![Diagrama de bloques de cada subsistema](/images/diagrama.png)
# Diagrama de estado de las FSM #

# Ejemplo y análisis de simulación funcional del sistema #

# Análisis de consumo de recursos de la FPGA y potencia #

# Velocidades máximas de reloj posibles en el diseño #

# Principales problemas hallados durante la elaboración y soluciones #