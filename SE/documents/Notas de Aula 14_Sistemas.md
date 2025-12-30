## Page 1

&lt;img&gt;Logo with red circle and green squares&lt;/img&gt;
INSTITUTO FEDERAL
DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA
Minas Gerais
Campus Bambuí

Disciplina: BiSuEEA.512 – Sistemas Embarcados
2º semestre – 2025
Notas de Aula 14

Instrutor: Williams L. Nicomedes
Laboratório de Automação e Controle – Núcleo 2 de Laboratórios, Sala 02

williams.nicomedes@ifmg.edu.br

04/12/2025

---


## Page 2

Projeto de circuitos combinacionais através da linguagem VHDL

&lt;page_number&gt;2&lt;/page_number&gt;

---


## Page 3

# Classes de objetos em VHDL

## Objetos: Elementos que armazenam valores.

**Sinal (signal):** Usado para interconexão; fiação interna.
Uso: Dentro da arquitetura (architecture);

**Variável (variable):**
Uso: Dentro de processos (process).

**Constante (constant):**
Uso: Diversos locais do código; inicializada com um valor específico e fixo.

&lt;page_number&gt;3&lt;/page_number&gt;

---


## Page 4

# Tipos de dados em VHDL

## Tipos de dado (pacote padrão):

*   **bit:** `'0'` e `'1'` (entre aspas);
*   **boolean:** true e false (comparações, testes,...)
*   **character:** Caracteres ASCII: `'a'`, `'b'`, ... (entre aspas);
*   **integer:** Números inteiros: 1, 2, ..., 15, ... (sem aspas);
*   **real:** Pontos decimais: 5.2, 10.1, ... (sem aspas);
*   **Tipo std_logic:** (pacote ieee.std_logic_1164);

## Dados escalares x Dados compostos (vetores)...

&lt;page_number&gt;4&lt;/page_number&gt;

---


## Page 5

# Operadores lógicos em VHDL

<table>
  <thead>
    <tr>
      <th>Operador</th>
      <th>Significado</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>not</td>
      <td>Negação</td>
    </tr>
    <tr>
      <td>and</td>
      <td>Conjunção</td>
    </tr>
    <tr>
      <td>or</td>
      <td>Disjunção</td>
    </tr>
    <tr>
      <td>nand</td>
      <td>Negação da conjunção</td>
    </tr>
    <tr>
      <td>nor</td>
      <td>Negação da disjunção</td>
    </tr>
    <tr>
      <td>xor</td>
      <td>Ou-exclusivo</td>
    </tr>
    <tr>
      <td>xnor</td>
      <td>Negação do ou-exclusivo</td>
    </tr>
  </tbody>
</table>

Operador **not**: Maior ordem de precedência (prioridade);
Demais operadores lógicos: Mesma ordem de prioridade.
Parênteses (evitar ambiguidade).
*Operadores relacionais e aritméticos (...)*

---


## Page 6

# Circuitos combinacionais

(Def.) Níveis lógicos das saídas dependentes única e exclusivamente da relação lógica entre as entradas.

&lt;img&gt;A diagram showing a "Circuito digital combinacional" (Digital combinational circuit). On the left side, there are three vertical labels: "Entradas" (Inputs) with arrows pointing to E₀, E₁, and Eₙ. On the right side, there are three vertical labels: "Saídas" (Outputs) with arrows pointing to S₀, S₁, and Sₘ.&lt;/img&gt;

&lt;page_number&gt;6&lt;/page_number&gt;

---


## Page 7

# Projeto de circuitos combinacionais em VHDL

A partir do problema dado, percorrer as etapas:

1. Identificação e definição das variáveis de entrada e saída;
2. Tabela-verdade baseada na análise do problema;
3. Obtenção das expressões lógicas (I/O);
Simplificação das expressões via álgebra booleana e mapas de Karnaugh;
4. Descrição em código VHDL;
5. Implementação em FPGA (síntese).

&lt;page_number&gt;7&lt;/page_number&gt;

---


## Page 8

# Projeto de circuitos combinacionais em VHDL

SE:

Variáveis de entrada normalmente são **chaves** (botões) e **sensores** instalados no processo a ser controlado/automatizado.

Variáveis de saída: Sinais direcionados aos **atuadores** (motores, aquecedores, eletro-válvulas), e aos elementos de **sinalização** (alarmes luminosos e sonoros).

Exemplo prático: Sistema Automático de Controle de Irrigação (SACI)

&lt;img&gt;∞ symbol&lt;/img&gt;

---


## Page 9

# Exemplo prático: SACI

<mermaid>
graph TD
    U1[Sensor de umidade baixa (U1)] --> CL[Circuito Lógico Combinacional]
    U2[Sensor de umidade alta (U2)] --> CL
    C[Chave (C)] --> CL
    CL --> IP[Interface de potência]
    IP --> EV[Eletroválvula (E)]
    CL --> LA[LED azul (LA)]
    CL --> LV[LED vermelho (LV)]
</mermaid>

Circuito lógico: A ser implementado em um chip FPGA.
&lt;page_number&gt;9&lt;/page_number&gt;

---


## Page 10

# Exemplo prático: SACI

## Sensor de umidade do solo:

Permite o **ajuste do nível N** de umidade a ser detectado.

Umidade menor do que *N*: Nível lógico 0.
Umidade maior do que *N*: Nível lógico 1.

&lt;img&gt;A soil moisture sensor with a yellow/orange cable connected to an Arduino Uno board.&lt;/img&gt;
&lt;img&gt;A breadboard circuit showing an Arduino Uno board connected to a soil moisture sensor via wires (yellow, red, black).&lt;/img&gt;

&lt;watermark&gt;fritzing&lt;/watermark&gt;
&lt;page_number&gt;10&lt;/page_number&gt;

---


## Page 11

# Exemplo prático: SACI

**Chave (push button):**

Botão pressionado: Nível lógico 1.
Botão não-pressionado: Nível lógico 0.

&lt;img&gt;A breadboard with an Arduino Uno board, a push button, a resistor, and a LED connected by wires.&lt;/img&gt;

&lt;page_number&gt;11&lt;/page_number&gt;

---


## Page 12

# Exemplo prático: SACI

**Eletroválvula:** Dispositivo que controla uma válvula hidráulica que bloqueia a passagem de água quando sua bobina está desenergizada e permite a sua passagem quando está energizada.

&lt;img&gt;An electric valve with a transparent body showing internal components, including a solenoid coil. The valve has labels "Model: 4V410-15", "Pressure: 0.15~0.8MPa", "VALVE", "CE", and "EVI 24V DC 4.8W 200mA 100% ED IP 65 CE". It also shows ports labeled A, B, R, P, S, and a diagram indicating flow directions.&lt;/img&gt;

&lt;page_number&gt;12&lt;/page_number&gt;

---


## Page 13

# Exemplo prático: SACI

O Sistema Automático de Irrigação consiste em dois sensores de umidade $U_1$ e $U_2$, que detectam se a umidade do solo está abaixo de 40%, entre 40% e 80%, ou acima de 80%.

Umidade detectada abaixo de 40%: A eletroválvula $E$ será acionada automaticamente, iniciando a irrigação.

Umidade entre 40% e 80%: Eletroválvula $E$ passa para o comando manual, controlada pela chave $C$.

Umidade acima de 80%: Eletroválvula $E$ volta para o modo automático, bloqueando a irrigação.

Um LED azul indicará quando o irrigador estiver em operação;

Um LED vermelho indicará umidade acima de 80%.

&lt;page_number&gt;13&lt;/page_number&gt;

---


## Page 14

# 1. Identificação e definição das variáveis de entrada e saída

## Entradas

**Sensor U₁**
*   Umidade menor do que 40%: U₁ = 0
*   Umidade maior do que 40%: U₁ = 1

**Sensor U₂**
*   Umidade menor do que 80%: U₂ = 0
*   Umidade maior do que 80%: U₂ = 1

**Chave C**
*   Chave desligada: C = 0
*   Chave ligada: C = 1

&lt;page_number&gt;14&lt;/page_number&gt;

---


## Page 15

# 1. Identificação e definição das variáveis de entrada e saída

## Saídas

**Eletroválvula E**

*   $E = 0$: Eletroválvula fechada (irrigador desligado)
*   $E = 1$: Eletroválvula aberta (irrigador ligado)

**LED Azul $L_A$**

*   $L_A = 0$: LED apagado (irrigação desligada)
*   $L_A = 1$: LED aceso (irrigação ligada)

**LED Vermelho $L_V$**

*   $L_V = 0$: LED apagado (umidade baixa)
*   $L_V = 1$: LED aceso (umidade alta)

&lt;page_number&gt;15&lt;/page_number&gt;

---


## Page 16

# 2. Tabela-verdade baseada na análise do problema

Atenção: Nem todas as combinações lógicas presentes na entrada são possíveis de ocorrer, por razões puramente físicas.

Exemplo: É impossível que a umidade seja ao mesmo tempo inferior a 40% (U₁ = 0) e superior a 80% (U₂ = 1).

O conjunto de entradas U₁ = 0 e U₂ = 1 portanto não ocorre; as saídas correspondentes são **irrelevantes**, designadas por X.

&lt;img&gt;A diagram showing a "Circuito Lógico Combinacional" with three inputs labeled U1, U2, and C, and three outputs labeled E, LA, and LV.&lt;/img&gt;

&lt;page_number&gt;16&lt;/page_number&gt;

---


## Page 17

# 2. Tabela-verdade baseada na análise do problema

<table>
  <thead>
    <tr>
      <th>U₁</th>
      <th>U₂</th>
      <th>C</th>
      <th>E</th>
      <th>L<sub>A</sub></th>
      <th>L<sub>V</sub></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>Umidade menor do que 40% e independe da chave: Válvula e LED azul ativados.</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>0</td>
      <td>X</td>
      <td>X</td>
      <td>X</td>
      <td>Umidade menor do que 40% e maior do que 80% (impossível). Saídas irrelevantes.</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td>1</td>
      <td>X</td>
      <td>X</td>
      <td>X</td>
      <td>Umidade entre 40 e 80%, chave desligada: Saídas desativadas</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>Umidade entre 40 e 80%, chave ligada: Válvula e LED azul ativados</td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td>0</td>
      <td>1</td>
      <td>Umidade maior do que 80% e independe da chave: Só LED vermelho ativado.</td>
    </tr>
  </tbody>
</table>

Obs.: L<sub>A</sub> = E, visto que o LED azul funciona como um sinalizador para a irrigação.

&lt;page_number&gt;17&lt;/page_number&gt;

---


## Page 18

3. Obtenção das expressões lógicas (I/O)

Combinar (via *or*) os produtos canônicos (cujas condições de entrada produzam nível lógico 1 na saída)

E = $\overline{U_1} \cdot \overline{U_2} \cdot \overline{C} + \overline{U_1} \cdot \overline{U_2} \cdot C + U_1 \cdot \overline{U_2} \cdot C$

$L_A = E$

$L_V = U_1 \cdot U_2 \cdot \overline{C} + U_1 \cdot U_2 \cdot C$

E as saídas irrelevantes (cujas entradas nunca ocorrerão)?

Se tomarmos $X = 1$, teremos mais produtos canônicos, que poderiam ajudar na simplificação.

**Não é necessária em VHDL!**

**Propósito:** Economizar portas lógicas (Cl's padrão).

Tomar então $X = 0$.

&lt;page_number&gt;18&lt;/page_number&gt;

---


## Page 19

4. Descrição em código VHDL

(AVA)

&lt;page_number&gt;19&lt;/page_number&gt;