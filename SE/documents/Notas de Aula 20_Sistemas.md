## Page 1

&lt;img&gt;Logo with red circle and green squares&lt;/img&gt;
INSTITUTO FEDERAL
DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA
Minas Gerais
Campus Bambuí

Disciplina: BiSuEEA.512 – Sistemas Embarcados
2º semestre – 2025
Notas de Aula 20

Instrutor: Williams L. Nicomedes
Laboratório de Automação e Controle – Núcleo 2 de Laboratórios, Sala 02

williams.nicomedes@ifmg.edu.br

15/01/2026

---


## Page 2

Projeto de circuitos sequenciais através da linguagem VHDL:

[1]. Flip-flops;

[2]. Contadores.

&lt;page_number&gt;2&lt;/page_number&gt;

---


## Page 3

# FF tipo JK: Elemento de memória

## Circuito combinacional: Saída depende das entradas:

Mudança nas entradas → Atualização (“instantânea”) da saída.

## Circuito sequencial: Saída depende das entradas e do clock.

Mudança nas entradas → Atualização da saída ocorre apenas na transição do clock:

*clock:* Onda quadrada, periódica (geralmente).

Borda de subida (↑) ou de descida (↓).

Estados da saída ao longo do tempo: 0, 1, 2, 3, ...

A saída permanece no estado durante um ciclo do clock (independentemente das entradas).

---


## Page 4

# FF tipo JK: Elemento de memória

Flip-flop tipo JK – Tabela de transição. Estado atual: Q(n).

<table>
  <thead>
    <tr>
      <th>J</th>
      <th>K</th>
      <th>Q(n + 1)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>Q(n)</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>$\overline{Q(n)}$</td>
    </tr>
  </tbody>
</table>

&lt;img&gt;A circuit diagram showing a clock signal (CLK) connected to a flip-flop. The flip-flop has two inputs labeled J and K, and two outputs labeled Q and $\overline{Q}$. The J input is connected to one side of the clock, and the K input is connected to the other side.&lt;/img&gt;

&lt;page_number&gt;4&lt;/page_number&gt;

---


## Page 5

# FF tipo JK: Elemento de memória

&lt;img&gt;A circuit diagram showing a JK flip-flop with inputs J, K, and CLK, and outputs Q and Q̄.&lt;/img&gt;

<table>
  <thead>
    <tr>
      <th>J</th>
      <th>K</th>
      <th>Q(n + 1)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>Q(n)</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>0</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>1</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>Q̄(n)</td>
    </tr>
  </tbody>
</table>

&lt;img&gt;A timing diagram illustrating the behavior of a JK flip-flop over time. The diagram shows four columns labeled J, K, CLK, and Q, each with multiple horizontal lines representing different states (0 or 1) at various points in time. The CLK signal is shown as a series of pulses, and the Q output transitions accordingly. A horizontal arrow labeled "Tempo" indicates the passage of time.&lt;/img&gt;

&lt;page_number&gt;5&lt;/page_number&gt;

---


## Page 6

# FF tipo JK - Bloco lógico: Código VHDL

Ex.: Salvar como Codigo_01.vhd

```vhdl
library ieee;
use ieee.std_logic_1164.all;

--FF tipo JK.
entity BlocoFF_JK is
    port (J, K, clk : in std_logic;
        Q : out std_logic);
end BlocoFF_JK;

--Lógica do bloco.
architecture funcionamento of BlocoFF_JK is

--Saída: Variável auxiliar.
signal Qstate : std_logic := '0';

begin

    process(J, K, clk)
    begin
        --Transição clock: Borda de descida.
        --clk: tipo 'std_logic'.
        if falling_edge(clk) then
            --Não se pode tomar a saída Q, e atribuí-la
            --(invertida) a ela mesma.
            if J = '1' and K = '1' then Qstate <= NOT(Qstate);
            elsif J = '1' and K = '0' then Qstate <= '1';
```
&lt;page_number&gt;6&lt;/page_number&gt;

---


## Page 7

# FF tipo JK - Bloco lógico: Código VHDL

Ex.: Salvar como Codigo_01.vhd

```vhdl
32 elsif J = '1' and K = '0' then Qstate <= '1';
33 elsif J = '0' and K = '1' then QState <= '0';
34 end if;
35 end if;
36
37 end process;
38
39 --Saída recebe Qstate, após o processamento.
40 Q <= Qstate;
41
42 end funcionamento;
43
44
45
46
47
```

&lt;page_number&gt;7&lt;/page_number&gt;

---


## Page 8

# FF tipo JK - Bloco lógico: Código VHDL

Não é necessário incluir o caso J = 0 e K = 0.

Qstate só será alterado caso alguma condição seja verdadeira.

Quando J = 0 e K = 0, nenhuma condição é verdadeira. Logo, Qstate permanece inalterado.

A saída Q não pode ser invertida e atribuída a ela mesma:

Variável auxiliar Qstate.

---


## Page 9

# FF tipo JK - Bloco lógico: Código VHDL

*   Geração do bloco;
*   Inserção no esquemático (Nome: Esquematico_01.bdf);
*   Inclusão das entrada e saídas;
*   Set as Top-Level Entity;
*   Compilação.

&lt;img&gt;A schematic diagram showing inputs J, K, and CLOCK connected to a block labeled "BlocoFF_JK". Inside this block, there's an instance of a component with pins J, K, clk, and Q. The output pin Q is connected to another block.&lt;/img&gt;

&lt;page_number&gt;9&lt;/page_number&gt;

---


## Page 10

# FF tipo JK

Formas de onda: Especificação dos sinais de entrada:

Arquivos *University Program VWF*;

Verificação do funcionamento do circuito.

Salvar como Waveform_01.vwf.

&lt;img&gt;Waveform diagram showing CLOCK, J, K, and Q signals with values B0 and B1 over time.&lt;/img&gt;

&lt;page_number&gt;10&lt;/page_number&gt;

---


## Page 11

Contador MOD 8 / Divisor de frequências

&lt;img&gt;Circuit diagram showing three JK flip-flops (FF0, FF1, FF2) connected in series with clock inputs (CLK) and power supply (Vcc). Each flip-flop has J and K inputs, and outputs QOUT0, QOUT1, and QOUT2 respectively.&lt;/img&gt;

&lt;img&gt;Timing diagram illustrating the operation of the counter. It shows:
- A horizontal line labeled "Clock pulses" with a series of pink rectangular pulses.
- A vertical line labeled "T_CLK" indicating the duration of each clock pulse.
- Three vertical lines labeled "Q0", "Q1", and "Q2" displaying the state of the flip-flops over time.
- Dashed vertical lines marking the transitions between states.
- A horizontal line labeled "T_Q1" indicating the duration of the first flip-flop's output change.
- A horizontal line labeled "T_Q2" indicating the duration of the second flip-flop's output change.
- A horizontal line labeled "T_Q3" indicating the duration of the third flip-flop's output change.
- A horizontal line labeled "Count Q2Q1Q0>" at the bottom, showing the binary state of the flip-flops over time, starting with 000 and progressing through 001, 010, 011, 100, 101, 110, 111, 000, 001, 010, 100, etc.&lt;/img&gt;
&lt;page_number&gt;11&lt;/page_number&gt;

---


## Page 12

Contador MOD 8: Blocos

Idea: Interconectar três blocos lógicos correspondentes ao FF tipo JK (BlocoFF_JK) implementado em VHDL:

Três instâncias (inst, inst1, inst2).

&lt;img&gt;Circuit Diagram showing three instances of BlocoFF_JK connected to form a counter. Each instance has J, K, clk inputs and Q output. The outputs are connected to AND gates labeled 00, 01, and 02.&lt;/img&gt;

&lt;page_number&gt;12&lt;/page_number&gt;

---


## Page 13

# Contador MOD 8: Blocos

Arquivo Esquematico_01.bdf: Teste do bloco simples (pg. 09);

Interconexão dos três blocos (pg. 12): **Novo arquivo esquemático** (Esquematico_02.bdf);

Especificar Esquematico_02.bdf como a entidade de máximo nível: Painel *Project Navigator* (lado esquerdo da tela), clicar com o botão direito sobre o nome do arquivo e escolher *Set as Top-Level Entity*, antes de proceder à compilação.

&lt;img&gt;Screenshot of Project Navigator window with files listed on the left. A right-click context menu is open over "Esquematico_2.bdf", showing options like Open, Remove File from Project, Set as Top-Level Entity (highlighted with Ctrl+Shift+J), and Properties...&lt;/img&gt;

&lt;page_number&gt;13&lt;/page_number&gt;

---


## Page 14

Contador MOD 8: Blocos - Formas de onda

Entrada VCC = 1. (Salvar como Waveform_02.vwf)

<table>
<thead>
<tr>
<th>Name</th>
<th>Value at<br>0 ps</th>
</tr>
</thead>
<tbody>
<tr>
<td>in<br>Vcc</td>
<td>B 1</td>
</tr>
<tr>
<td>in<br>CLOCK</td>
<td>B 0</td>
</tr>
<tr>
<td>out<br>Q0</td>
<td>B 0</td>
</tr>
<tr>
<td>out<br>Q1</td>
<td>B 0</td>
</tr>
<tr>
<td>out<br>Q2</td>
<td>B 0</td>
</tr>
</tbody>
</table>

&lt;img&gt;Waveform diagram showing Vcc, CLOCK, Q0, Q1, and Q2 signals over time.&lt;/img&gt;

&lt;img&gt;Timing diagram illustrating clock pulses, Q0, Q1, Q2, and count states.&lt;/img&gt;

&lt;page_number&gt;14&lt;/page_number&gt;

---


## Page 15

# Contador MOD 8: Blocos - Formas de onda

**Obs.:** Dentro do mesmo projeto:

*   Waveform_01.vwf associado a Esquematico_01.bdf;
*   Waveform_02.vwf associado a Esquematico_02.bdf;

Escolher o esquemático (1 ou 2);

*   Set as Top-Level Entity;

*   Selecionar a waveform correspondente;

*   (Não precisa compilar de novo).

&lt;page_number&gt;15&lt;/page_number&gt;

---


## Page 16

(Próx.) Contador MOD 8: Encapsulamento

Ideia: Produzir um único bloco correspondente ao contador (ao invés de usar três blocos como na pag. 12).

Código anterior com a descrição do bloco FF tipo JK (Codigo_01.vhd), pag. 06:

Incluso no projeto;

Escrever novo código VHDL referente ao contador ‘encapsulado’ (Codigo_02.vhd)

Entrada única (clock);

Saída única (contador).

&lt;page_number&gt;16&lt;/page_number&gt;