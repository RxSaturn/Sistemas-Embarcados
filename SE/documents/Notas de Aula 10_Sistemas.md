## Page 1

&lt;img&gt;Logo with red circle and green squares&lt;/img&gt;
INSTITUTO FEDERAL
DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA
Minas Gerais
Campus Bambuí

Disciplina: BiSuEEA.512 – Sistemas Embarcados
2º semestre – 2025
Notas de Aula 10

Instrutor: Williams L. Nicomedes
Laboratório de Automação e Controle – Núcleo 2 de Laboratórios, Sala 02

williams.nicomedes@ifmg.edu.br

06/11/2025

---


## Page 2

A linguagem VHDL

&lt;page_number&gt;2&lt;/page_number&gt;

---


## Page 3

# Introdução

Década de 1980:

Dep. Defesa EUA: Definição dos requisitos de uma linguagem de descrição de hardware (hardware description language);

Necessidade de documentação para projetos:

Circuitos passaram a se tornar mais complexos.

Altera Corp. (hoje pertencente à Intel): Linguagem AHDL.

Dezenas de HDL's surgiram:

Fabricantes de PLD's/FPGA's desenvolvem suas próprias linguagens.

&lt;page_number&gt;3&lt;/page_number&gt;

---


## Page 4

# Introdução

HDL's mais empregada: Verilog e VHDL

VHDL: Very High Speed Integrated Circuit Hardware Description Language

Padronizada pelo IEEE (Institute of Electrical and Electronics Engineers) pela primeira vez em 1987;

Várias revisões (mais recente: 2019).

Padronizada: Aceita por diferentes fabricantes.

Uso: Ferramentas EDA (Electronic Design Automation)

Softwares (disponibilizados pelos fabricantes) para descrever o hardware e “traduzir” o que foi descrito pelo projetista via HDL para um circuito físico.

&lt;page_number&gt;4&lt;/page_number&gt;

---


## Page 5

# PLD's vs. Microcontroladores

HDL's não dão origem a um programa (execução de uma sequência de instruções).

*Exemplo 1: Função lógica AND (z = AB)*

**Microcontrolador:**

Realizada como uma instrução, i.e., execução de uma operação entre duas variáveis diferentes (determinação de z: processador).

**PLD/FPGA:**

Não se executa instrução, mas sim constrói-se a porta lógica, que é um circuito (hardware).

Ferramenta EDA “desenha” uma porta lógica AND no chip FPGA (determinação de z: sinais).

&lt;page_number&gt;5&lt;/page_number&gt;

---


## Page 6

# PLD's vs. Microcontroladores

Tempo de resposta (sinais de saída em resposta a estímulos de entrada) corresponde a:

**Microcontroladores:**

Tempo de execução do programa no processador;

**PLD:**

Tempo de propagação do sinal (elétrico) pelo caminho físico percorrido no chip (trilhas).

O circuito foi construído no chip; a partir daí, não há sentido em falar de “execução” de instruções.

&lt;page_number&gt;6&lt;/page_number&gt;

---


## Page 7

# PLD's vs. Microcontroladores

*Exemplo 2. Circuito digital (2 entradas e 2 saídas).*

&lt;img&gt;
Circuito
a
b
saída2
saída1
VHDL
saida2 <= a OR b;
saida1 <= a AND b;
Linguagem C
saida2 = a | b;
saida1 = a & b;
Figura 3.1 — Circuito composto por duas portas lógicas: AND e OR.
&lt;/img&gt;

&lt;page_number&gt;7&lt;/page_number&gt;

---


## Page 8

# PLD's vs. Microcontroladores

*Exemplo 2.* Circuito digital (2 entradas e 2 saídas).

**Microcontrolador/Linguagem C:**

Instruções são **sequenciais**;

Operação AND executada antes da operação OR.

**FPGA/VHDL:**

Instruções são **concorrentes**;

Interpretadas pela ferramenta EDA ao mesmo tempo

Inverter a ordem: Obtemos o mesmo resultado

&lt;img&gt;∞ symbol&lt;/img&gt;

---


## Page 9

# PLD's vs. Microcontroladores

Caso particular: Entradas A = 1 e B = 1:

Diferença nos tempos de resposta

Diagrama de tempo – FPGA (VHDL)
&lt;img&gt;Diagram showing timing for FPGA with labels A, B, saida2, saida1.&lt;/img&gt;

Diagrama de tempo – Microcontrolador (Linguagem C)
&lt;img&gt;Diagram showing timing for Microcontroller with labels A, B, saida2, saida1.&lt;/img&gt;

Figura 3.2 – Diagramas de tempo diferentes em FPGA e microcontrolador.

&lt;page_number&gt;9&lt;/page_number&gt;

---


## Page 10

# PLD's vs. Microcontroladores

Caso particular: Entradas A = 1 e B = 1:

Diferença nos tempos de resposta

Microcontrolador/C:
Leva em conta o tempo de processamento;
'saida2' comuta primeiro, pois a sua instrução é executada antes da 'saida1'.

FPGA/VHDL:
Leva em conta o tempo de propagação do sinal;
As duas saídas comutam simultaneamente.

&lt;page_number&gt;10&lt;/page_number&gt;

---


## Page 11

# Fluxo de projeto

<mermaid>
graph LR
    A[Especificações] --> B[HDL]
    B --> C[RTL]
    C --> D[Síntese]
    D --> E[Fabricação]
</mermaid>

1.  **Especificações** sobre o sistema digital a ser construído.
    Modelo de chip FPGA e ferramenta EDA serão empregados.

    Diferentes materiais, tensões, tempos propagação dos sinais, quantidade de blocos lógicos disponíveis, etc.

2.  **Código HDL**: Descrição do comportamento do circuito (abstração alta), sem se preocupar com o hardware.

3.  **Circuito/descrição RTL (register transfer level)**: Circuito digital "genérico", i.e., não leva a tecnologia em conta (ferramenta EDA). Obtido do entendimento da ferramenta em relação ao código do projetista.

&lt;page_number&gt;1&lt;/page_number&gt;

---


## Page 12

# Fluxo de projeto

<mermaid>
graph LR
    A[Especificações] --> B[HDL]
    B --> C[RTL]
    C --> D[Síntese]
    D --> E[Fabricação]
</mermaid>

4. **Síntese**: A partir da descrição/circuito RTL, a ferramenta gera um arquivo *netlist* (nível de portas lógicas – *gate level* – nível baixo de abstração), levando-se em conta a tecnologia disponível em (1).

Do arquivo *netlist* sairão as informações de posicionamento e roteamento (*place and route*) que serão utilizadas para as interligações implementadas no FPGA.

*"Para implementar o circuito RTL neste chip específico eu preciso interligar..."*

5. **Fabricação**: Implementação física (ligações no chip).

&lt;page_number&gt;12&lt;/page_number&gt;

---


## Page 13

# Linguagem VHDL – Características Gerais

**Padronização IEEE:** Aceita por todas as tecnologias e fabricantes de PLD's;

**Estilos de modelagem:**

a) **Comportamental**: O projetista informa o comportamento do circuito (abstração alta) a partir de processos e atribuições de sinais (**mapear entradas e saídas**).

b) **Estrutural**: Formação do circuito desejado via estrutura hierárquica: Interligação de subsistemas (formados por circuitos menores).

&lt;img&gt;
Circuito Final (topo de hierarquia)
Circuito 1
Circuito 2
Circuito 3
Circuito 4
Figura 3.3 – Modelamento estrutural.
&lt;/img&gt;

&lt;page_number&gt;13&lt;/page_number&gt;

---


## Page 14

# Linguagem VHDL – Características Gerais

Não diferencia letras maiúsculas e minúsculas (i.e., não é case sensitive);

Sentenças devem ser terminadas por “ ; ” (ponto-e-vírgula);

Contém palavras reservadas (entity, in, out, architecture, begin, etc.) que não devem ser usadas como identificadores (nomes);

Comentários:

“ -- ”: Única linha de comentário;

“ /* ” e “ * / ”: Comentário em múltiplas linhas.

&lt;page_number&gt;14&lt;/page_number&gt;

---


## Page 15

# Estrutura básica dos códigos VHDL

Dividida em três unidades principais de projeto (design units):

**Bibliotecas/pacotes**, **entidade**, e **arquitetura**.

Ordem em que aparecem no código:

&lt;img&gt;A diagram showing three stacked rectangles. The top rectangle contains the text "BIBLIOTECAS / PACOTES". The middle rectangle contains the text "ENTIDADE". The bottom rectangle contains the text "ARQUITETURA".&lt;/img&gt;

&lt;page_number&gt;15&lt;/page_number&gt;

---


## Page 16

# Estrutura básica dos códigos VHDL

**Biblioteca/pacotes:** “Cabeçalho” do código. Fornecem informações sobre o que será utilizado ao longo do código, como tipos de dados, funções e componentes.

**Entidade:** Forma como o mundo enxerga o componente (ou circuito). Pinos (entradas e saídas).

**Arquitetura:** Funcionalidade do circuito, i.e., sua lógica interna. “O que acontece dentro do circuito?”

&lt;img&gt;A diagram showing a chip with "Entidade" (Entity) at the top left, an arrow pointing to the chip, and "Arquitetura" (Architecture) at the bottom right, with an arrow pointing from the chip to the architecture.&lt;/img&gt;

&lt;page_number&gt;16&lt;/page_number&gt;

---


## Page 17

# Estrutura básica dos códigos VHDL

```vhdl
library nome_biblioteca;
use nome_biblioteca.nome_pacote.nome_objeto;

entity nome_entidade is
    port (declaração de entradas e saídas);
end nome_entidade;

architecture nome_arquitetura of nome_entidade is
    --declarações (sinais, constantes, etc.)
begin
    --descrição lógica do circuito
end nome_arquitetura;
```

&lt;page_number&gt;17&lt;/page_number&gt;

---


## Page 18

# Bibliotecas e pacotes

**Biblioteca:** Diretório contendo informações que serão utilizadas na descrição do circuito. **Conjunto de pacotes (de informação);**

**Início do código:** Visibilidade.

**Cláusula library;**

**Palavra reservada use:** Especifica o pacote e o objeto pertencentes à biblioteca que serão utilizados.

**Biblioteca mais comum:** ieee

&lt;page_number&gt;18&lt;/page_number&gt;

---


## Page 19

# Bibliotecas e pacotes

<table>
  <thead>
    <tr>
      <th>Biblioteca</th>
      <th>Pacote</th>
      <th>Resumo</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>ieee</td>
      <td>std_logic</td>
      <td>Define o tipo de dado std_logic;</td>
    </tr>
    <tr>
      <td>ieee</td>
      <td>numeric_std</td>
      <td>Operações aritméticas com std_logic_vector;</td>
    </tr>
    <tr>
      <td>ieee</td>
      <td>numeric_bit</td>
      <td>Operações aritméticas com bit_vector.</td>
    </tr>
  </tbody>
</table>

Usar *todos* os objetos do pacote numeric_std (p. ex.):
```vhdl
library ieee;
use ieee.numeric_std.all;

---


## Page 20

# Entidade

Declaração de portas: Entradas e saídas do circuito.

Palavra reservada **port**, sempre entre parênteses.

```vhdl
entity exemplo is
    port (
        p1, p2 : in bit;
        p3 : out bit
    );
end exemplo;
```

Entradas/saídas do mesmo tipo p1 e p2: Podem ser declaradas juntas (separadas por vírgula);

&lt;page_number&gt;20&lt;/page_number&gt;

---


## Page 21

# Entidade

## Sintaxe portas:

nome_porta : modo tipo;

<table>
  <thead>
    <tr>
      <th>Modo</th>
      <th>Significado</th>
      <th>Observação</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>in</td>
      <td>Entrada</td>
      <td>-</td>
    </tr>
    <tr>
      <td>out</td>
      <td>Saída</td>
      <td>-</td>
    </tr>
    <tr>
      <td>inout</td>
      <td>Bidirecional</td>
      <td>-</td>
    </tr>
    <tr>
      <td>buffer</td>
      <td>Saída</td>
      <td>Permite realimentação</td>
    </tr>
  </tbody>
</table>

&lt;page_number&gt;21&lt;/page_number&gt;

---


## Page 22

# Arquitetura

Representa a lógica dentro da entidade:

Descreve como as saídas estão relacionadas com as entradas.

A arquitetura possui um nome, e é associada a uma entidade (declarada anteriormente via entity).

Sintaxe:

architecture nome_arquitetura of nome_entidade is

&lt;page_number&gt;22&lt;/page_number&gt;

---


## Page 23

# Arquitetura

```vhdl
entity exemplo is
    port (
        p1, p2 : in bit;
        p3 : out bit
    );
end exemplo;

architecture arq of exemplo is
    --declarações (sinais, constantes, etc.)
begin
    p3 <= not (p1 and p2);
end arq;
```

Operador de atribuição: "<="

&lt;page_number&gt;23&lt;/page_number&gt;

---


## Page 24

# Identificadores

Nomes dados a sinais, variáveis, portas, processos, etc.

Regras:

*   Podem conter apenas letras do alfabeto (A, B, C,..., a, b, c,...), *underline "_"*, e números decimais (0, 1,..., 9).
*   Sempre começar com letras.
*   Não podem terminar com *underline* ou conter dois *underlines* em sequência ("_")
*   Não utilizar os mesmos nomes de palavras reservadas.

&lt;page_number&gt;24&lt;/page_number&gt;

---


## Page 25

# Identificadores

## Exemplos válidos:

Somador1
Porta_3
RESULTADO_FINAL
X3

## Exemplos inválidos:

result_final
bus_
1porta
resultado@soma
_porta4
sinal#2

&lt;page_number&gt;25&lt;/page_number&gt;