## Page 1

&lt;img&gt;Logo with red circle and green squares&lt;/img&gt;
INSTITUTO FEDERAL
DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA
Minas Gerais
Campus Bambuí

Disciplina: BiSuEEA.512 – Sistemas Embarcados
2º semestre – 2025
Notas de Aula 21

Instrutor: Williams L. Nicomedes
Laboratório de Automação e Controle – Núcleo 2 de Laboratórios, Sala 02

williams.nicomedes@ifmg.edu.br

22/01/2026

---


## Page 2

Projeto de circuitos sequenciais através da linguagem VHDL:

[1]. Flip-flops;

[2]. Contadores;

[3]. Encapsulamento.

&lt;page_number&gt;2&lt;/page_number&gt;

---


## Page 3

# FF tipo JK: Elemento de memória

## Circuito combinacional: Saída depende das entradas:

Mudança nas entradas → Atualização ("instantânea") da saída.

## Circuito sequencial: Saída depende das entradas e do clock.

Mudança nas entradas → Atualização da saída ocorre apenas na transição do clock:

*clock*: Onda quadrada, periódica (geralmente).

Borda de subida (↑) ou de descida (↓).

Estados da saída ao longo do tempo: 0, 1, 2, 3, ...

A saída permanece no estado durante um ciclo do *clock* (independentemente das entradas).

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

&lt;img&gt;A timing diagram illustrating the behavior of a JK flip-flop over time. The diagram shows four columns labeled J, K, CLK, and Q, each with multiple horizontal lines representing different states (0 or 1) at various points in time. The Q column is highlighted in pink to show its state changes. A horizontal arrow labeled "Tempo" indicates the passage of time from left to right.&lt;/img&gt;

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

    process (J, K, clk)
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

&lt;img&gt;VHDL Circuit Diagram showing three instances of BlocoFF_JK connected to form a counter.&lt;/img&gt;

&lt;page_number&gt;12&lt;/page_number&gt;

---


## Page 13

# Contador MOD 8: Blocos

Arquivo Esquematico_01.bdf: Teste do bloco simples (pg. 09);

Interconexão dos três blocos (pg. 12): **Novo arquivo esquemático** (Esquematico_02.bdf);

Especificar Esquematico_02.bdf como a entidade de máximo nível: Painel *Project Navigator* (lado esquerdo da tela), clicar com o botão direito sobre o nome do arquivo e escolher *Set as Top-Level Entity*, antes de proceder à compilação.

&lt;img&gt;Screenshot of Project Navigator window with files listed on the left. The file "Esquematico_2.bdf" is highlighted, and a context menu is open showing options like "Open", "Remove File from Project", "Set as Top-Level Entity Ctrl+Shift+J", and "Properties...".&lt;/img&gt;

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

# Contador MOD 8: Encapsulamento

**Ideia:** Produzir um único bloco correspondente ao contador (ao invés de usar três blocos como na pag. 12).

**Código anterior com a descrição do bloco FF tipo JK (Codigo_01.vhd), pag. 06:**

Incluso no projeto;

**Escrever novo código VHDL referente ao contador 'encapsulado' (Codigo_02.vhd)**

Entrada única (*clock*);

Saída única (contador).

&lt;page_number&gt;16&lt;/page_number&gt;

---


## Page 17

# Contador MOD 8: Encapsulamento

Novo código VHDL (Código_02.vhd) referente ao contador 'encapsulado' (BlocoContador):

```vhdl
library ieee;
use ieee.std_logic_1164.all;

-- Contador MOD 8
entity BlocoContador is
    port(clk_in : in std_logic;
         Q_out : out std_logic_vector(2 downto 0));
end BlocoContador;

-- Logica do bloco
```

Entrada única (clk_in): Sinal de clock;

Saída única (Q_out) – tipo std_logic_vector

0 to 2: Q₀Q₁Q₂

2 downto 0: Q₂Q₁Q₀

&lt;page_number&gt;17&lt;/page_number&gt;

---


## Page 18

# Contador MOD 8: Encapsulamento

Novo código VHDL (Código_02.vhd) referente ao contador ‘encapsulado’ (BlocoContador):

```vhdl
--Logica do bloco
architecture Funcionamento2 of BlocoContador is

signal Vcc : std_logic := '1';
signal Q_out_aux : std_logic_vector(2 downto 0);

component BlocoFF_JK
    port(J,K,clk : in std_logic;
        Q : out std_logic);
end component;

begin

    FF0 : BlocoFF_JK port map (J => Vcc, K => Vcc, clk => clk_in, Q => Q_out_aux(0));
    FF1 : BlocoFF_JK port map (J => Vcc, K => Vcc, clk => Q_out_aux(0), Q => Q_out_aux(1));
    FF2 : BlocoFF_JK port map (J => Vcc, K => Vcc, clk => Q_out_aux(1), Q => Q_out_aux(2));

    Q_out <= Q_out_aux;

end Funcionamento2;
```
&lt;page_number&gt;18&lt;/page_number&gt;

---


## Page 19

# Contador MOD 8: Encapsulamento

***Dentro da arquitetura***

*   **signal Vcc:** Representa o nível alto nas entradas J e K de cada FF.
*   **signal Q_out_aux:** Variável auxiliar. Em VHDL não é permitida a atribuição de saídas (Q_out) às entradas (linha 28).
*   **component BlocoFF_JK:** Referência à descrição VHDL no FF tipo JK (arquivo Codigo_01.vhd na pág. 06).
    *   Repetir a declaração dos pinos (port) do arquivo Codigo_01.vhd.
    *   Trocar a palavra entity por component.

**Incluir Codigo_01.vhd no projeto:**

*   Project > Add Current File to Project

&lt;page_number&gt;19&lt;/page_number&gt;

---


## Page 20

# Contador MOD 8: Encapsulamento

FF0, FF1, FF2: Criação/instanciação de três blocos lógicos (relativos ao FF tipo JK), cada um deles com entradas J, K, clk e saída Q).

&lt;img&gt;Circuit diagram showing three JK flip-flops (FF0, FF1, FF2) connected in series. Each flip-flop has power supply Vcc, clock input CLK, J and K inputs, and output Q. The outputs QOUT0, QOUT1, and QOUT2 are shown.&lt;/img&gt;

“Montar” o circuito acima através do comando port map.
Mapeamento: Símbolo ‘=>’.

Linha 28, (pg. 18): Usar variável auxiliar clk => Q_out_aux(0).

Fazer clk => Q_out(0) [???]

Erro. Teríamos saída (Q_out, pg.17) atribuída à entrada (clk).

&lt;page_number&gt;20&lt;/page_number&gt;

---


## Page 21

# Contador MOD 8: Encapsulamento

Atribuir variável auxiliar (Q_out_aux) à saída verdadeira (Q_out), na linha 32 (pág. 18):

```vhdl
Q_out <= Q_out_aux;
```

Salvar arquivo Codigo_02.vhd.

Criação do bloco:

Com o arquivo Codigo_02.vhd ao fundo:

*   File;
*   Create/Update;
*   Create Symbol Files for Current File.

&lt;page_number&gt;21&lt;/page_number&gt;

---


## Page 22

# Contador MOD 8: Encapsulamento

## Criação do bloco:

&lt;img&gt;Screenshot showing a software interface with a menu on the left and a code editor window on the right. The menu includes options like File, Edit, View, Project, Assignments, Processing, Tools, Window, Help, New..., Open..., Close, New Project Wizard..., Open Project..., Save Project, Close Project, Save, Save As..., Save All, File Properties..., Create / Update, Export..., Convert Programming Files..., Page Setup..., Print Preview, Print..., Recent Files, and various tool icons.&lt;/img&gt;

```vhdl
--Logica do bloco
architecture Funcionamento2 of BlocoContac
signal Vcc : std_logic := '1';
signal Q_out_aux : std_logic_vector(2 downto 0);
component BlocoFF_JK
    port (J,K,clk : in std_logic;
          Q : out std_logic);
end component;
```

&lt;page_number&gt;22&lt;/page_number&gt;

---


## Page 23

# Contador MOD 8: Encapsulamento

Novo arquivo esquemático: Esquematico_03.bdf

&lt;img&gt;Diagram showing a "BlocoContador" block with inputs "CLOCK", "VCC", "clk_in", and outputs "Q_out[2..0]" and "Saida_Cont[2..0]". The "Q_out[2..0]" output is connected to "Saida_Cont[2..0]".&lt;/img&gt;

Entrada clk_in: CLOCK

Saída Q_out [2..0]: Saida_Cont[2..0]

Escolher nome da saída e acrescentar [2..0], pois Q_out é um vetor.

&lt;page_number&gt;23&lt;/page_number&gt;

---


## Page 24

# Contador MOD 8: Encapsulamento

Após salvar o arquivo como Esquematico_03.bdf:

Especificar Esquematico_03.bdf como Top-Level Entity, antes de proceder à compilação:

&lt;img&gt;Screenshot of a software interface showing a Project Navigator with files listed on the left (e.g., Codigo_1.vhd, Esquematico_1.bdf, Waveform_1.vwf, Esquematico_2.bdf, Waveform_2.vwf, Codigo_2.vhd, Esquematico_3.bdf, Waveform_3.vwf). A right-click context menu is open over "Esquematico_3.bdf", displaying options like Open, Remove File from Project, Set as Top-Level Entity (Ctrl+Shift+J), and Properties...&lt;/img&gt;

&lt;page_number&gt;24&lt;/page_number&gt;

---


## Page 25

Contador MOD 8: Encapsulamento

Formas de onda: Especificação dos sinais de entrada:

Arquivos *University Program VWF*;

Verificação do funcionamento do circuito.

Salvar como Waveform_03.vwf.

&lt;img&gt;Waveform Diagram showing CLOCK signal and three output signals (Saida_Cont[2], Saida_Cont[1], Saida_Cont[0]) with values 000, 001, 010, 011, 100, 101, 110, 111 over time.&lt;/img&gt;

&lt;page_number&gt;25&lt;/page_number&gt;
