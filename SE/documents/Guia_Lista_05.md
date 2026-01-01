# Guia de Conexão dos Pinos no Quartus II

Com base na imagem do bloco `decod_3_8` gerado, vou explicar detalhadamente como realizar as conexões de entrada e saída no esquemático. 

## Análise do Bloco Gerado

Observando a imagem ![image7](image7), o bloco possui: 
- **Entradas**: `entr[2..0]` (barramento de 3 bits) e `enable` (sinal simples)
- **Saídas**: `saidas[7..0]` (barramento de 8 bits)

## Diagrama de Conexão Completo

```mermaid
flowchart LR
    subgraph ENTRADAS ["PINOS DE ENTRADA (INPUT)"]
        direction TB
        IN1["INPUT<br/>━━━━━━━━━━<br/>Nome:  Ent[2..0]<br/>Tipo:  Barramento 3 bits"]
        IN2["INPUT<br/>━━━━━━━━━━<br/>Nome: Habilita<br/>Tipo: Sinal simples"]
    end

    subgraph BLOCO ["BLOCO decod_3_8"]
        direction TB
        B_ENT["entr[2..0]"]
        B_EN["enable"]
        B_SAID["saidas[7..0]"]
    end

    subgraph SAIDAS ["PINOS DE SAÍDA (OUTPUT)"]
        direction TB
        OUT1["OUTPUT<br/>━━━━━━━━━━<br/>Nome: Saidas_[7..0]<br/>Tipo: Barramento 8 bits"]
    end

    IN1 ===|"Barramento<br/>3 fios"| B_ENT
    IN2 ---|"Fio simples"| B_EN
    B_SAID ===|"Barramento<br/>8 fios"| OUT1

    style IN1 fill:#90EE90,stroke:#228B22,stroke-width:2px
    style IN2 fill:#90EE90,stroke:#228B22,stroke-width: 2px
    style OUT1 fill:#FFB6C1,stroke:#DC143C,stroke-width:2px
    style BLOCO fill:#E6E6FA,stroke:#483D8B,stroke-width: 2px
```

## Processo Passo a Passo

### Passo 1: Inserir o Bloco no Esquemático

```mermaid
flowchart TD
    A["1. Criar novo arquivo esquemático<br/><b>File → New → Block Diagram/Schematic File</b>"] --> B
    B["2. Inserir símbolo do decodificador<br/><b>Duplo clique na área de trabalho</b>"] --> C
    C["3. Na janela Symbol: <br/>Navegar até <b>Project → decod_3_8</b>"] --> D
    D["4. Clicar OK e posicionar o bloco"]
    
    style A fill:#E8F4FD,stroke:#1E88E5
    style B fill:#E8F4FD,stroke:#1E88E5
    style C fill:#E8F4FD,stroke:#1E88E5
    style D fill:#E8F4FD,stroke:#1E88E5
```

### Passo 2: Adicionar Pinos de Entrada

```mermaid
flowchart TD
    subgraph ENTRADA_BARRAMENTO ["ENTRADA:  Barramento entr[2..0]"]
        direction TB
        E1["1. Duplo clique → Symbol → <b>primitives → pin → input</b>"]
        E2["2. Posicionar à ESQUERDA do bloco"]
        E3["3. Duplo clique no pino criado"]
        E4["4. Em <b>Pin name</b> digitar: <b>Ent[2..0]</b>"]
        E5["5.  Conectar ao pino <b>entr[2..0]</b> do bloco"]
        E1 --> E2 --> E3 --> E4 --> E5
    end

    subgraph ENTRADA_SIMPLES ["ENTRADA: Sinal enable"]
        direction TB
        F1["1. Inserir outro pino INPUT"]
        F2["2. Posicionar abaixo do anterior"]
        F3["3. Em <b>Pin name</b> digitar: <b>Habilita</b>"]
        F4["4. Conectar ao pino <b>enable</b> do bloco"]
        F1 --> F2 --> F3 --> F4
    end

    style ENTRADA_BARRAMENTO fill:#E8F5E9,stroke:#4CAF50,stroke-width:2px
    style ENTRADA_SIMPLES fill:#E8F5E9,stroke:#4CAF50,stroke-width:2px
```

### Passo 3: Adicionar Pino de Saída

```mermaid
flowchart TD
    subgraph SAIDA_BARRAMENTO ["SAÍDA: Barramento saidas[7..0]"]
        direction TB
        S1["1. Duplo clique → Symbol → <b>primitives → pin → output</b>"]
        S2["2. Posicionar à DIREITA do bloco"]
        S3["3. Duplo clique no pino criado"]
        S4["4. Em <b>Pin name</b> digitar: <b>Saidas_[7..0]</b>"]
        S5["5. Conectar ao pino <b>saidas[7..0]</b> do bloco"]
        S1 --> S2 --> S3 --> S4 --> S5
    end

    style SAIDA_BARRAMENTO fill:#FFEBEE,stroke:#F44336,stroke-width:2px
```

## Regras Importantes para Nomenclatura

```mermaid
flowchart TB
    subgraph REGRAS ["⚠️ REGRAS DE NOMENCLATURA - EVITAR ERROS"]
        direction TB
        R1["<b>REGRA 1:</b> NÃO usar mesmos nomes da entity VHDL<br/>❌ entr[2..0] → ✅ Ent[2..0]<br/>❌ enable → ✅ Habilita<br/>❌ saidas[7..0] → ✅ Saidas_[7.. 0]"]
        R2["<b>REGRA 2:</b> Notação de vetores no Quartus<br/>VHDL:  (N downto 0)<br/>Quartus: [N..0]"]
        R3["<b>REGRA 3:</b> Usar underscore para diferenciar<br/>Exemplo:  Saidas_ ao invés de Saidas"]
    end

    style R1 fill:#FFF3E0,stroke:#FF9800,stroke-width:2px
    style R2 fill:#FFF3E0,stroke:#FF9800,stroke-width:2px
    style R3 fill:#FFF3E0,stroke:#FF9800,stroke-width:2px
```

## Diagrama do Esquemático Final

```mermaid
flowchart LR
    subgraph ESQUEMATICO ["ESQUEMÁTICO COMPLETO - Proj_Decoder_3_8.bdf"]
        direction LR
        
        subgraph INPUTS ["Pinos INPUT"]
            I1["🟢 INPUT<br/><b>Ent[2..0]</b>"]
            I2["🟢 INPUT<br/><b>Habilita</b>"]
        end

        subgraph DECODER ["Bloco VHDL"]
            D["<b>decod_3_8</b><br/>━━━━━━━━━<br/>entr[2..0]<br/>enable<br/>━━━━━━━━━<br/>saidas[7..0]<br/>━━━━━━━━━<br/><i>inst</i>"]
        end

        subgraph OUTPUTS ["Pinos OUTPUT"]
            O1["🔴 OUTPUT<br/><b>Saidas_[7.. 0]</b>"]
        end

        I1 ==>|"═══"| D
        I2 -->|"───"| D
        D ==>|"════════"| O1
    end

    style I1 fill:#C8E6C9,stroke:#2E7D32,stroke-width:2px
    style I2 fill:#C8E6C9,stroke:#2E7D32,stroke-width:2px
    style D fill:#E1BEE7,stroke:#7B1FA2,stroke-width: 3px
    style O1 fill:#FFCDD2,stroke:#C62828,stroke-width:2px
```

## Tipos de Conexão (Fios)

```mermaid
flowchart LR
    subgraph TIPOS_FIO ["TIPOS DE CONEXÃO"]
        direction TB
        
        subgraph SIMPLES ["Fio Simples (1 bit)"]
            FS1["○───────○"]
            FS2["Usado para: enable/Habilita"]
        end

        subgraph BARRAMENTO ["Barramento (múltiplos bits)"]
            FB1["○═══════○"]
            FB2["Usado para: entr[2..0] e saidas[7..0]"]
            FB3["Linha mais grossa no Quartus"]
        end
    end

    style SIMPLES fill:#E3F2FD,stroke:#1976D2
    style BARRAMENTO fill:#FCE4EC,stroke:#C2185B
```

## Como Fazer as Conexões

```mermaid
flowchart TD
    subgraph CONECTAR ["PROCESSO DE CONEXÃO"]
        direction TB
        C1["1. Posicione o cursor sobre o pino de saída do INPUT"]
        C2["2. O cursor muda para uma <b>cruz (+)</b>"]
        C3["3. Clique e arraste até o pino do bloco"]
        C4["4. Solte o botão quando estiver sobre o pino destino"]
        C5["5. Para barramentos: a linha ficará mais grossa"]
        
        C1 --> C2 --> C3 --> C4 --> C5
    end

    subgraph DICA ["💡 DICA"]
        D1["Se a conexão não formar automaticamente<br/>um barramento, verifique se os nomes<br/>dos pinos têm a mesma dimensão: <br/><b>Ent[2..0]</b> → <b>entr[2.. 0]</b>"]
    end

    style CONECTAR fill:#F3E5F5,stroke:#9C27B0
    style DICA fill:#FFFDE7,stroke:#FBC02D
```

## Checklist Final

```mermaid
flowchart TB
    subgraph CHECK ["✅ CHECKLIST ANTES DE COMPILAR"]
        direction TB
        CH1["☐ Pino Ent[2..0] conectado a entr[2..0]"]
        CH2["☐ Pino Habilita conectado a enable"]
        CH3["☐ Pino Saidas_[7..0] conectado a saidas[7..0]"]
        CH4["☐ Nenhum nome igual aos da entity VHDL"]
        CH5["☐ Barramentos com linhas grossas"]
        CH6["☐ Arquivo salvo como . bdf"]
        CH7["☐ Definido como Top-Level Entity"]
    end

    style CHECK fill:#E8F5E9,stroke:#388E3C,stroke-width: 2px
```

## Resumo Visual do Esquemático Esperado

```
    ┌─────────────────────────────────────────────────────────┐
    │                   Proj_Decoder_3_8.bdf                  │
    │                                                         │
    │   ┌──────────┐      ┌─────────────┐      ┌──────────┐  │
    │   │  INPUT   │      │  decod_3_8  │      │  OUTPUT  │  │
    │   │          │      │             │      │          │  │
    │   │Ent[2..0] │══════│entr[2..0]   │      │          │  │
    │   └──────────┘      │             │      │          │  │
    │                     │      saidas[7..0]│══│Saidas_[7..0]│
    │   ┌──────────┐      │             │      │          │  │
    │   │  INPUT   │      │             │      └──────────┘  │
    │   │          │      │             │                    │
    │   │ Habilita │──────│enable       │                    │
    │   └──────────┘      │             │                    │
    │                     │    inst     │                    │
    │                     └─────────────┘                    │
    │                                                         │
    └─────────────────────────────────────────────────────────┘
    
    Legenda:  ══════ Barramento (múltiplos bits)
              ────── Fio simples (1 bit)
```
