# Notas de Aula 15 — Tipos de dados em VHDL (pacote padrão)

> **Disciplina:** BiSuEEA.512 – Sistemas Embarcados · 2º semestre de 2025  
> **Instrutor:** Williams L. Nicomedes  
> **Instituição:** IFMG Campus Bambuí – Departamento de Engenharia e Computação  
> **Data:** 11/12/2025

Projeto de circuitos combinacionais através da linguagem VHDL (Cont.)

## Tipos de dados em VHDL (pacote padrão)

### Dados escalares

`bit: '0' e '1'` (entre aspas simples);

### Dados compostos (vetores)

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

## Operador de concatenação em VHDL

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

## 2. Tabela-verdade baseada na análise do problema SACI

| U₁ | U₂ | C | E | L<sub>A</sub> | L<sub>V</sub> | |
| --- | --- | --- | --- | --- | --- | --- |
| 0 | 0 | 0 | 1 | 1 | 0 | Umidade menor do que 40% e independe da chave: Válvula e LED azul ativados. |
| 0 | 1 | 0 | X | X | X | Umidade menor do que 40% e maior do que 80% (impossível). Saídas irrelevantes. |
| 0 | 1 | 1 | X | X | X | Umidade entre 40 e 80%, chave desligada: Saídas desativadas |
| 1 | 0 | 0 | 0 | 0 | 0 | Umidade entre 40 e 80%, chave ligada: Válvula e LED azul ativados |
| 1 | 1 | 0 | 0 | 0 | 1 | Umidade maior do que 80% e independe da chave: Só LED vermelho ativado. |

Obs.: L<sub>A</sub> = E, visto que o LED azul funciona como um sinalizador para a irrigação.

1. Obtenção das expressões lógicas (I/O)

Combinar (via *or*) os produtos canônicos (cujas condições de entrada produzam nível lógico 1 na saída)

E = $\overline{U_1} \cdot \overline{U_2} \cdot \overline{C} + \overline{U_1} \cdot \overline{U_2} \cdot C + U_1 \cdot \overline{U_2} \cdot C$

$L_A = E$

$L_V = U_1 \cdot U_2 \cdot \overline{C} + U_1 \cdot U_2 \cdot C$

E as saídas irrelevantes (cujas entradas nunca ocorrerão)?

Se tomarmos $X = 1$, teremos mais produtos canônicos, que poderiam ajudar na simplificação.

**Não é necessária em VHDL!**

**Propósito:** Economizar portas lógicas (Cl's padrão).

Tomar então $X = 0$.

## Alternativa: Atribuição selecionada

Construir circuitos utilizando expressões concorrentes com operadores lógicos:

Tarefa trabalhosa (inviável, para o caso de circuitos mais complexos).

**Ideia:** Permitir ao projetista trabalhar em *abstrações mais altas*:

*Foco no funcionamento do circuito;*

*(Sem se preocupar com operadores lógicos e expressões booleanas).*

### Atribuição selecionada:

Verificar em qual condição se encontra a expressão ou sinal para teste (no caso, os sinais de entrada);

Realizar a atribuição (às saídas) correspondente à condição.

### Sintaxe:

```vhdl
with expressao_teste select
    destino <= valor1 when condicao 1,
    valor2 when condicao 2,
    valor3 when condicao 3;
```

Condições relativas à expressao_teste

<!-- Imagem: ∞ -->
