# CyberLua API Reference

## Overview

CyberLua é um framework cyberpunk inovador que combina Lua com otimizações Assembly, computação quântica, redes neurais e criptografia de nível militar.

## Core Module

### `CyberLua.new(options)`

Inicializa o framework CyberLua.

**Parâmetros:**
- `options` (table): Configurações do framework
  - `quantum` (boolean): Ativa computação quântica
  - `neural` (boolean): Ativa processamento neural
  - `crypto` (string): Nível de criptografia ("standard", "military_grade")
  - `asm_optimized` (boolean): Otimizações Assembly
  - `debug` (boolean): Modo debug
  - `theme` (string): Tema cyberpunk ("neon_blue", "matrix_green", "cyber_orange", "quantum_purple")

**Retorno:** Instância do CyberLua

**Exemplo:**
```lua
local cyber = CyberLua.new({
    quantum = true,
    neural = true,
    crypto = "military_grade",
    asm_optimized = true
})
```

### `cyber:process(params)`

Processamento unificado de dados.

**Parâmetros:**
- `params` (table): Parâmetros de processamento
  - `input` (any): Dados de entrada
  - `algorithm` (string): Algoritmo a ser usado
  - `optimization` (string): Tipo de otimização

**Retorno:** Resultado do processamento

### `cyber:get_metrics()`

Obtém métricas de performance do framework.

**Retorno:** Table com métricas
- `uptime`: Tempo de execução
- `operations`: Número de operações
- `quantum_cycles`: Ciclos quânticos
- `neural_processes`: Processos neurais
- `crypto_operations`: Operações criptográficas

## Crypto Module

### `cyber:encrypt(params)`

Criptografa dados usando algoritmos avançados.

**Parâmetros:**
- `params.data` (string): Dados a criptografar
- `params.method` (string): Método de criptografia
- `params.key_size` (number): Tamanho da chave

**Retorno:** Table com resultado da criptografia

**Exemplo:**
```lua
local encrypted = cyber:encrypt({
    data = "secret message",
    method = "quantum_aes",
    key_size = 512
})
```

### `cyber:decrypt(params)`

Descriptografa dados.

**Parâmetros:**
- `params.ciphertext` (string): Dados criptografados
- `params.key` (string): Chave de descriptografia
- `params.algorithm` (string): Algoritmo usado

**Retorno:** Table com dados descriptografados

## Neural Module

### `cyber:neural_process(params)`

Processa dados usando redes neurais.

**Parâmetros:**
- `params.input` (table): Dados de entrada
- `params.model_id` (number): ID do modelo neural
- `params.operation` (string): Tipo de operação

**Retorno:** Resultado do processamento neural

**Exemplo:**
```lua
local result = cyber:neural_process({
    input = {1, 2, 3, 4, 5},
    model_id = 1,
    operation = "predict"
})
```

## Quantum Module

### `cyber:quantum_compute(params)`

Executa computação quântica.

**Parâmetros:**
- `params.operation` (string): Operação quântica
- `params.data` (table): Dados específicos da operação

**Retorno:** Resultado da computação quântica

**Operações disponíveis:**
- `create_qubit`: Cria um qubit
- `create_register`: Cria registrador quântico
- `apply_gate`: Aplica porta quântica
- `entangle`: Entrelaça qubits
- `measure`: Mede qubit
- `deutsch_jozsa`: Algoritmo Deutsch-Jozsa
- `grover`: Algoritmo de Grover

**Exemplo:**
```lua
local qubit = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})

local hadamard = cyber:quantum_compute({
    operation = "apply_gate",
    data = {qubit_id = qubit.qubit_id, gate = "H"}
})
```

## Blockchain Module

### `cyber.modules.blockchain:process(params)`

Processa operações de blockchain.

**Parâmetros:**
- `params.operation` (string): Operação blockchain

**Operações disponíveis:**
- `create_wallet`: Cria carteira
- `create_transaction`: Cria transação
- `mine_block`: Minera bloco
- `get_balance`: Obtém saldo
- `deploy_contract`: Implanta contrato inteligente
- `execute_contract`: Executa contrato

**Exemplo:**
```lua
local wallet = cyber.modules.blockchain:process({
    operation = "create_wallet",
    owner = "cyber_user"
})

local block = cyber.modules.blockchain:process({
    operation = "mine_block",
    miner = wallet.address
})
```

## UI Module

### `cyber.modules.ui:process(params)`

Processa operações de interface cyberpunk.

**Parâmetros:**
- `params.operation` (string): Operação UI

**Operações disponíveis:**
- `create_terminal`: Cria terminal cyberpunk
- `create_hud`: Cria HUD
- `render`: Renderiza componente
- `animate`: Cria animação
- `render_text`: Renderiza texto com efeitos

**Exemplo:**
```lua
local terminal = cyber.modules.ui:process({
    operation = "create_terminal",
    options = {title = "CYBER_TERMINAL", glitch = true}
})

local text = cyber.modules.ui:process({
    operation = "render_text",
    text = "Welcome to Cyberpunk!",
    effect = "glitch",
    component_id = terminal.component_id
})
```

## Core Module Functions

### `cyber.modules.core:process(params)`

Processamento core otimizado.

**Algoritmos disponíveis:**
- `assembly_optimized`: Operações matemáticas otimizadas
- `vector_processing`: Processamento vetorial SIMD
- `memory_efficient`: Gerenciamento de memória
- `string_boost`: Processamento de strings

### `cyber.modules.core:fast_math(a, b, operation)`

Operações matemáticas de alta performance.

**Parâmetros:**
- `a` (number): Primeiro operando
- `b` (number): Segundo operando
- `operation` (string): Operação ("add", "sub", "mul", "div", "pow")

## Assembly Optimizations

O framework inclui otimizações Assembly para operações críticas:

- **Fast Math**: Operações aritméticas otimizadas
- **Vector Operations**: Processamento SIMD
- **Memory Management**: Alocação e cópia otimizadas
- **String Processing**: Hash e processamento de strings
- **Quantum Gates**: Aplicação de portas quânticas
- **Neural Activation**: Funções de ativação otimizadas

## Themes

Temas cyberpunk disponíveis:

- **neon_blue**: Ciano e magenta neon
- **matrix_green**: Verde Matrix
- **cyber_orange**: Laranja cyberpunk
- **quantum_purple**: Roxo quântico

## Error Handling

O framework retorna tabelas com campo `error` em caso de falha:

```lua
local result = cyber:process(params)
if result.error then
    print("Error:", result.error)
else
    -- Processa resultado
end
```

## Performance Tips

1. Use `asm_optimized = true` para máxima performance
2. Ative `quantum` e `neural` apenas quando necessário
3. Use `crypto = "military_grade"` para segurança máxima
4. Monitore métricas com `get_metrics()`

## Security Considerations

- Chaves criptográficas são geradas aleatoriamente
- Operações quânticas simuladas para demonstração
- Contratos inteligentes executados em sandbox
- Interface com validação de entradas

## Compatibility

- **Lua**: 5.5+
- **Sistemas**: Windows, Linux, macOS
- **Arquiteturas**: x86, x64
- **Memória**: Mínimo 64MB recomendado
