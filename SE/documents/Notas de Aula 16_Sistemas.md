## Page 1

&lt;img&gt;Logo of Instituto Federal de Educação, Ciência e Tecnologia Minas Gerais Campus Bambuí&lt;/img&gt;

**INSTITUTO FEDERAL**
**DE EDUCAÇÃO, CIÊNCIA E TECNOLOGIA**
Minas Gerais
Campus Bambuí

**Disciplina:** BiSuEEA.512 – Sistemas Embarcados

2º semestre – 2025

Notas de Aula 16

**Instrutor:** Williams L. Nicomedes

Laboratório de Automação e Controle – Núcleo 2 de Laboratórios, Sala 02

williams.nicomedes@ifmg.edu.br

18/12/2025

---


## Page 2

Projeto de circuitos combinacionais através da linguagem VHDL:

[1]. Processos;

[2]. Decodificadores.

&lt;page_number&gt;2&lt;/page_number&gt;

---


## Page 3

# Processos

**Processos:** Regiões de códigos **sequenciais**:

*   Comandos avaliados sequencialmente;
*   Respeitando a **ordem** na qual estão localizados no código.

**VHDL:** Comandos concorrentes.

&lt;page_number&gt;3&lt;/page_number&gt;

---


## Page 4

# Processos

```vhdl
library ieee;
entity exemplo is
    port(a,b : in bit;
         s : out bit);
end exemplo;

architecture func of exemplo is
begin
    s <= a or b;  <--- Red arrow pointing to this line
    s <= a and b;
end func;
```

Erro: Na região ‘concorrente’ do código (fora de um processo), a descrição envia dois sinais diferentes para a mesma saída s.

&lt;page_number&gt;4&lt;/page_number&gt;

---


## Page 5

# Processos

```vhdl
library ieee;
entity exemplo is
    port (a, b : in bit;
          s : out bit);
end exemplo;

architecture func of exemplo is
begin
    process(a, b)
    begin
        s <= a or b;
        s <= a and b;
    end process
end func;
```

(a, b): **Lista de sensibilidade**: Sinais responsáveis por acionar a execução do processo.

- Execução sequencial;
- Saída s atualizada só ao término do processo.

Executa os comandos sequenciais mas **não atualiza o valor de s enquanto o processo está em andamento**. Resultado: s = a and b. &lt;page_number&gt;5&lt;/page_number&gt;

---


## Page 6

# Estruturas de controle: case-when

```vhdl
case expressao_em_analise is
    when valor_expressao_1 => comando_1;
    when valor_expressao_2 => comando_2;
    when others => comando;
end case;
```

Comandos sequenciais **dentro de processos**.

(não usar atribuição selecionada with...select)

&lt;page_number&gt;6&lt;/page_number&gt;

---


## Page 7

# Estruturas de controle: *if-then*

```pascal
if cond_1 then
  (...)
elsif cond_2 then
  (...)
else
  (...)
end if;
```

Estrutura *if-then-else*: **Dentro de processos.**

(Se trata de construção sequencial.)

---


## Page 8

# Decodificadores

Há mais de uma forma de representar uma mesma informação: Conversão entre uma forma e outra.

*Exemplo*: Calculadora

Usuário entra com os dados numéricos na forma **decimal**;

Processamento dos dados na representação **binária**;

Resultado exibido em display na forma **decimal**.

<mermaid>
graph LR
    subgraph Codificação
        A[Teclado]
        B[Processador]
    end
    subgraph Decodificação
        C[Display]
    end

    A --> B
    B --> C

    A -- "(Sist. Decimal)" --> A
    B -- "(Sist. Binário)" --> B
    C -- "(Sist. Decimal)" --> C
</mermaid>

&lt;img&gt;∞ symbol&lt;/img&gt;

---


## Page 9

# Decodificadores

*Decodificadores*: Circuitos que recebem um código binário e acionam a saída correspondente.

Para cada combinação na entrada, uma única saída é acionada, mantendo todas as outras desativadas.

Para N bits de entrada, há 2^N combinações possíveis, e portanto M = 2^N saídas que podem ser ativadas.

&lt;img&gt;A diagram showing a "Decodificador" (Decoder) with N input lines labeled E0, E1, E2, ..., EN-1 on the left, and M output lines labeled S0, S1, S2, ..., SM-1 on the right.&lt;/img&gt;

&lt;page_number&gt;9&lt;/page_number&gt;

---


## Page 10

# Decodificadores

*Exemplo:* Decodificador binário para decimal (decodificador 2 para 4) simples:

<table>
  <thead>
    <tr>
      <th colspan="2">Entradas</th>
      <th colspan="4">Saídas</th>
    </tr>
    <tr>
      <th>E1</th>
      <th>E0</th>
      <th>S3</th>
      <th>S2</th>
      <th>S1</th>
      <th>S0</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>0</td>
      <td></td>
      <td></td>
      <td></td>
      <td>1</td>
    </tr>
    <tr>
      <td>0</td>
      <td>1</td>
      <td></td>
      <td></td>
      <td>1</td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td></td>
      <td>1</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

*Obs.:* Os valores não indicados nas saída correspondem a um bit **0**.

&lt;page_number&gt;10&lt;/page_number&gt;

---


## Page 11

# Decodificadores

*Exemplo:* Decodificador binário para decimal (decodificador 2 para 4) com ENABLE (habilitar):

<table>
  <thead>
    <tr>
      <th colspan="3">Entradas</th>
      <th colspan="4">Saídas</th>
    </tr>
    <tr>
      <th>ENABLE</th>
      <th>E1</th>
      <th>E0</th>
      <th>S3</th>
      <th>S2</th>
      <th>S1</th>
      <th>S0</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>0</td>
      <td>X</td>
      <td>X</td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>0</td>
      <td></td>
      <td></td>
      <td></td>
      <td>1</td>
    </tr>
    <tr>
      <td>1</td>
      <td>0</td>
      <td>1</td>
      <td></td>
      <td></td>
      <td>1</td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>0</td>
      <td></td>
      <td>1</td>
      <td></td>
      <td></td>
    </tr>
    <tr>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td>1</td>
      <td></td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

*Obs.:* Valores não indicados nas saída correspondem a **0**.

*Obs.:* Quando o sinal de controle **ENABLE = 0**, o decodificador **não funciona** (i.e., não seleciona nenhuma saída), mantendo todas as saídas em **0**, independentemente das entradas.

&lt;page_number&gt;1&lt;/page_number&gt;

---


## Page 12

# Decodificadores

## Cuidados – Implementação Quartus

No arquivo esquemático:

[1]. Não atribuir os mesmos nomes aos sinais de entrada/saída do bloco do que aqueles declarados na entity do código VHDL.

[2]. Tratar os vetores de acordo: Se uma entrada/saída é do tipo `bit_vector(3 downto 0)` e recebe o nome de `nome_sinal`, devemos então nomear a porta como

`nome_sinal[3..0]`

&lt;page_number&gt;12&lt;/page_number&gt;

---


## Page 13

# Decodificadores

Implementação via portas lógicas...

Portas AND de três entradas, algumas das quais devem ser invertidas (active low)....

&lt;img&gt;Circuit diagram showing four 3-input AND gates (S0, S1, S2, S3) with Enable inputs E1 and E0. The Enable inputs are connected to the first two inputs of each AND gate. The third input of each AND gate is inverted by a NOT gate before being connected to the other two inputs.&lt;/img&gt;

&lt;page_number&gt;13&lt;/page_number&gt;