## Page 1

&lt;img&gt;Logo with red circle and green squares&lt;/img&gt;
INSTITUTO FEDERAL
DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA
Minas Gerais
Campus Bambuí

Disciplina: BiSuEEA.512 – Sistemas Embarcados
2º semestre – 2025
Notas de Aula 15

Instrutor: Williams L. Nicomedes
Laboratório de Automação e Controle – Núcleo 2 de Laboratórios, Sala 02

williams.nicomedes@ifmg.edu.br

11/12/2025

---


## Page 2

Projeto de circuitos combinacionais através da linguagem VHDL (Cont.)

&lt;page_number&gt;2&lt;/page_number&gt;

---


## Page 3

# Tipos de dados em VHDL (pacote padrão)

## Dados escalares

`bit: '0' e '1'` (entre aspas simples);

## Dados compostos (vetores)

`bit_vector` (vetor de bits). Aspas duplas. Ex.:

```vhdl
signal controle : bit_vector(0 to 3) := "1011";
```
MSB

```vhdl
signal entrada : bit_vector(7 down to 0) := "11110011";
```
MSB

```vhdl
saida <= "0000";
```

&lt;page_number&gt;3&lt;/page_number&gt;

---


## Page 4

# Operador de concatenação em VHDL

Ex.: Seja porção de código VHDL:

```vhdl
signal vet_A : bit_vector(0 to 1) := "11";
signal vet_B : bit_vector(0 to 3) := "0000";
signal vet_C : bit_vector(0 to 7);
signal bit1, bit2 : bit := '1';

(...)

vet_C <= vet_A & vet_B & bit1 & bit2;
```

O resultado desta operação é:

`vet_C = 11000011`

&lt;page_number&gt;4&lt;/page_number&gt;

---


## Page 5

# 2. Tabela-verdade baseada na análise do problema SACI

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

&lt;page_number&gt;5&lt;/page_number&gt;

---


## Page 6

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

&lt;page_number&gt;6&lt;/page_number&gt;

---


## Page 7

# Alternativa: Atribuição selecionada

Construir circuitos utilizando expressões concorrentes com operadores lógicos:

Tarefa trabalhosa (inviável, para o caso de circuitos mais complexos).

**Ideia:** Permitir ao projetista trabalhar em *abstrações mais altas*:

*Foco no funcionamento do circuito;*

*(Sem se preocupar com operadores lógicos e expressões booleanas).*

---


## Page 8

# Alternativa: Atribuição selecionada

## Atribuição selecionada:

Verificar em qual condição se encontra a expressão ou sinal para teste (no caso, os sinais de entrada);

Realizar a atribuição (às saídas) correspondente à condição.

## Sintaxe:

```vhdl
with expressao_teste select
    destino <= valor1 when condicao 1,
    valor2 when condicao 2,
    valor3 when condicao 3;
```

Condições relativas à expressao_teste

&lt;img&gt;∞&lt;/img&gt;