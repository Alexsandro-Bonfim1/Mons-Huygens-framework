-- Sputnik Framework Hello World Example
-- Demonstração inicial do framework espacial inovador

-- Importa o framework Sputnik
local Sputnik = require("Sputnik")

print("🛰️ Inicializando Sputnik Framework...")

-- Inicializa o framework com configurações espaciais
local sputnik = Sputnik.new({
    quantum = true,           -- Ativa computação quântica
    neural = true,            -- Ativa processamento neural
    crypto = "space_grade",   -- Criptografia de nível espacial
    asm_optimized = true,     -- Otimizações Assembly
    debug = true,            -- Modo debug
    theme = "satellite_blue" -- Tema espacial
})

print("✅ Framework inicializado com sucesso!")
print()

-- Exemplo 1: Processamento com otimização Assembly
print("🔧 Testando otimizações Assembly...")
local asm_result = sputnik:process({
    input = {value = 42, value2 = 24},
    algorithm = "assembly_optimized"
})
print(string.format("Resultado: %.2f + %.2f = %.2f", 
      42, 24, asm_result.result.add))
print(string.format("Tempo de execução: %.3f ms (speedup: %s)", 
      asm_result.execution_time, asm_result.speedup))
print()

-- Exemplo 2: Criptografia quântica
print("🔐 Testando criptografia espacial...")
local secret_message = "Sputnik is the future!"
local encrypted = sputnik:encrypt({
    data = secret_message,
    method = "quantum_aes",
    key_size = 512
})
print(string.format("Mensagem original: %s", secret_message))
print(string.format("Algoritmo: %s", encrypted.algorithm))
print(string.format("Estado quântico: %s", encrypted.quantum_state))
print(string.format("Nível de segurança: %s", encrypted.security_level))
print()

-- Exemplo 3: Processamento neural
print("🧠 Testando processamento neural...")
local neural_input = {}
for i = 1, 10 do
    neural_input[i] = math.random() * 2 - 1  -- Valores entre -1 e 1
end

local neural_result = sputnik:neural_process({
    input = neural_input,
    model_id = 1,
    operation = "predict"
})
print(string.format("Confiança da previsão: %.2f%%", neural_result.confidence * 100))
print(string.format("Otimização: %s", neural_result.optimization))
print()

-- Exemplo 4: Computação quântica
print("⚛️ Testando computação quântica...")
local qubit = sputnik:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})
print(string.format("Qubit criado: ID %d, Estado: %s", qubit.qubit_id, qubit.state))

-- Aplica porta Hadamard
local hadamard_result = sputnik:quantum_compute({
    operation = "apply_gate",
    data = {qubit_id = qubit.qubit_id, gate = "H"}
})
print(string.format("Porta Hadamard aplicada: Novo estado %s", hadamard_result.new_state))
print(string.format("Fidelidade: %.3f", hadamard_result.fidelity))

-- Medição quântica
local measurement = sputnik:quantum_compute({
    operation = "measure",
    data = {qubit_id = qubit.qubit_id}
})
print(string.format("Medição: %s (probabilidade de |0⟩: %.2f)", 
      measurement.measured_state, measurement.probability_zero))
print()

-- Exemplo 5: Algoritmo de Deutsch-Jozsa
print("🔬 Testando algoritmo Deutsch-Jozsa...")
local deutsch_result = sputnik:quantum_compute({
    operation = "deutsch_jozsa",
    data = {function_type = "constant"}
})
print(string.format("Função detectada: %s", deutsch_result.function_type))
print(string.format("Resultado: %s", deutsch_result.result))
print(string.format("Speedup quântico: %s", deutsch_result.quantum_speedup))
print()

-- Exemplo 6: Blockchain
print("⛓️ Testando blockchain espacial...")
local wallet = sputnik.modules.blockchain:process({
    operation = "create_wallet",
    owner = "space_user"
})
print(string.format("Carteira criada: %s", wallet.address))
print(string.format("Saldo inicial: %.8f SPUT", wallet.balance))

-- Cria transação
local tx = sputnik.modules.blockchain:process({
    operation = "create_transaction",
    from = wallet.address,
    to = "SPUTNIK_SYSTEM_MINING",
    amount = 1.0,
    data = "Sputnik mining reward"
})
print(string.format("Transação criada: ID %d, Taxa: %.6f", tx.transaction_id, tx.fee))

-- Minera bloco
local block = sputnik.modules.blockchain:process({
    operation = "mine_block",
    miner = wallet.address
})
print(string.format("Bloco minerado: %s", block.block_hash))
print(string.format("Recompensa: %.8f SPUT", block.block_reward))
print()

-- Exemplo 7: Interface espacial
print("🎨 Testando interface espacial...")
local terminal = sputnik.modules.ui:process({
    operation = "create_terminal",
    options = {
        title = "SPUTNIK_TERMINAL_v2.0",
        glitch = true,
        scanlines = true
    }
})
print(string.format("Terminal criado: ID %d, Dimensões: %dx%d", 
      terminal.component_id, terminal.dimensions.width, terminal.dimensions.height))

-- Renderiza texto com efeitos
local space_text = sputnik.modules.ui:process({
    operation = "render_text",
    text = "Welcome to the Space Age!",
    effect = "glitch",
    component_id = terminal.component_id
})
print(string.format("Texto renderizado: %s", space_text.rendered_text))
print(string.format("Efeitos aplicados: %s", table.concat(space_text.effects, ", ")))
print()

-- Exemplo 8: Métricas de performance
print("📊 Métricas de performance do Sputnik:")
local metrics = sputnik:get_metrics()
for key, value in pairs(metrics) do
    if type(value) == "number" then
        print(string.format("  %s: %d", key, value))
    else
        print(string.format("  %s: %s", key, value))
    end
end
print()

-- Exemplo 9: Processamento avançado combinado
print("🚀 Testando processamento quântico-neural combinado...")
local combined_result = sputnik:process({
    input = {
        data = neural_input,
        quantum_circuit = {
            qubits = 4,
            gates = {"H", "CNOT", "H"},
            measurements = true
        }
    },
    algorithm = "neural_quantum",
    optimization = "assembly"
})
print("Processamento combinado concluído com sucesso!")
print()

-- Exemplo 10: Demonstração de segurança
print("🔒 Testando segurança espacial...")
local security_test = sputnik.modules.crypto:process({
    input = "classified_space_data",
    algorithm = "space_quantum_crypto"
})
print(string.format("Nível de segurança: %s", security_test.security_level or "MAXIMUM"))
print()

print("🎉 Sputnik Framework demonstração concluída!")
print("🌟 O futuro espacial do código está aqui!")
print()

-- Desliga o framework gracefully
sputnik:shutdown()

print("👋 Até a próxima aventura espacial!")
