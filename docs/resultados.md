# Resultados no Quartus II

Capturas de tela retiradas das entregas corrigidas em `entregas/`. Cada seção traz o
esquemático montado no Block Editor e as formas de onda da simulação funcional.

| Entrega | Circuito | Tipo |
| --- | --- | --- |
| [Lista 3](#lista-3--função-booleana-z) | `z = A · B + (C + D)` | Combinacional |
| [Lista 4](#lista-4--circuito-de-votação) | `bloco_votacao` | Combinacional |
| [Lista 5](#lista-5--decodificador-3-para-8) | `decod_3_8` | Combinacional |
| [Trabalho 1](#trabalho-1--contador-mod-8) | Contador MOD 8 | Sequencial |
| [Trabalho 2](#trabalho-2--contador-mod-8-encapsulado) | Contador MOD 8 encapsulado | Sequencial |

## Lista 3 – Função booleana z

A lista pedia a função `z = A · B + (C + D)` de duas formas: montada com portas
lógicas no esquemático, e descrita em VHDL. As saídas das duas versões tinham de ser
comparadas.

Circuito com portas lógicas. Quatro entradas, uma porta AND2, uma OR2, uma NOT e uma
OR2 final:

![Esquemático da função z montado com portas lógicas no Quartus II. As entradas A e B vão para uma AND2, C e D para uma OR2, e o resultado passa por uma NOT antes da OR2 final que produz z](img/funcao-z-esquematico.png)

As duas versões no mesmo esquemático. O bloco `BlocoComb4`, gerado a partir do VHDL,
produz `z2`. O circuito de portas produz `z`:

![Esquemático comparando as duas implementações. À esquerda o bloco BlocoComb4 vindo do VHDL com saída z2, à direita o mesmo circuito montado com portas lógicas e saída z](img/funcao-z-comparacao.png)

Na simulação, `z` e `z2` são idênticas em todos os instantes:

![Formas de onda da simulação da função z, mostrando as saídas z e z2 com valores iguais ao longo de todo o tempo simulado](img/funcao-z-onda.png)

## Lista 4 – Circuito de votação

Quatro entradas binárias: `L` é o voto do líder, `M1`, `M2` e `M3` são os votos dos
membros. `0` rejeita e `1` aceita. A saída `A` indica a aprovação.

![Esquemático do circuito de votação no Quartus II. As entradas L, M1, M2 e M3 alimentam o bloco bloco_votacao, que produz a saída A](img/bloco-votacao-esquematico.png)

![Formas de onda da simulação do circuito de votação, percorrendo as 16 combinações possíveis das quatro entradas](img/bloco-votacao-onda.png)

## Lista 5 – Decodificador 3 para 8

Decodificador com três entradas de seleção e uma entrada de habilitação, escrito com
`process` e `case` em VHDL. O guia de ligação dos pinos está em
[`listas/guia-lista-05.md`](listas/guia-lista-05.md).

![Esquemático do decod_3_8 no Quartus II. Os pinos Ent[2..0] e Habilita entram à esquerda, o barramento Saidas_[7..0] sai à direita](img/decod-3-8-esquematico.png)

A simulação separa os dois regimes. Até 16 µs, `Habilita` fica em `0` e todas as
saídas ficam em `0`. Depois de 16 µs, cada combinação de `Ent[2..0]` aciona uma única
saída:

![Formas de onda da simulação do decod_3_8. Na primeira metade todas as saídas estão em zero porque Habilita está em 0. Na segunda metade cada valor de Ent aciona uma saída diferente](img/decod-3-8-onda.png)

## Trabalho 1 – Contador MOD 8

Contador de módulo 8 construído com três flip-flops JK descritos em VHDL e ligados
entre si no esquemático. Cada flip-flop é uma instância do bloco `BlocoFF_JK`, com
`J` e `K` amarrados em `Vcc`.

![Esquemático do contador MOD 8 no Quartus II. Três instâncias do bloco BlocoFF_JK em cascata, com as entradas J e K ligadas a Vcc e as saídas QOUT0, QOUT1 e QOUT2](img/contador-mod8-esquematico.png)

![Formas de onda da simulação do contador MOD 8, mostrando as saídas percorrendo a sequência de 000 a 111 a cada pulso de clock](img/contador-mod8-onda.png)

## Trabalho 2 – Contador MOD 8 encapsulado

O mesmo contador, agora dentro de um único bloco VHDL em vez de três blocos ligados
no esquemático. O comportamento é o mesmo, e a diferença está na organização do
código.

![Formas de onda da simulação do contador MOD 8 encapsulado, com a mesma sequência de contagem do Trabalho 1](img/contador-mod8-encapsulado-onda.png)
