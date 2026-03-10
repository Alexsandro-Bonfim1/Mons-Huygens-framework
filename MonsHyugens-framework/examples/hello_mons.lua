-- Mons Huygens Framework Hello World Example
-- Demonstração inicial do framework lunar inovador

-- Importa o framework Mons Huygens
local MonsHuygens = require("MonsHuygens")

print("⛰️ Inicializando Mons Huygens Framework...")

-- Inicializa o framework com configurações lunares
local mons = MonsHuygens.new({
    quantum = true,           -- Ativa computação quântica
    neural = true,            -- Ativa processamento neural
    crypto = "lunar_grade",   -- Criptografia de nível lunar
    asm_optimized = true,     -- Otimizações Assembly
    debug = true,            -- Modo debug
    theme = "mountain_silver" -- Tema lunar
})

print("✅ Framework inicializado com sucesso!")
print()

-- Exemplo 1: Processamento com otimização Assembly
print("🔧 Testando otimizações Assembly...")
local asm_result = mons:process({
    input = {value = 42, value2 = 24},
    algorithm = "assembly_optimized"
})
print(string.format("Resultado: %.2f + %.2f = %.2f", 
      42, 24, asm_result.result.add))
print(string.format("Tempo de execução: %.3f ms (speedup: %s)", 
      asm_result.execution_time, asm_result.speedup))
print()

-- Exemplo 2: Criptografia quântica
print("🔐 Testando criptografia lunar...")
local secret_message = "Mons Huygens is the future!"
local encrypted = mons:encrypt({
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

local neural_result = mons:neural_process({
    input = neural_input,
    model_id = 1,
    operation = "predict"
})
print(string.format("Confiança da previsão: %.2f%%", neural_result.confidence * 100))
print(string.format("Otimização: %s", neural_result.optimization))
print()

-- Exemplo 4: Computação quântica
print("⚛️ Testando computação quântica...")
local qubit = mons:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})
print(string.format("Qubit criado: ID %d, Estado: %s", qubit.qubit_id, qubit.state))

-- Aplica porta Hadamard
local hadamard_result = mons:quantum_compute({
    operation = "apply_gate",
    data = {qubit_id = qubit.qubit_id, gate = "H"}
})
print(string.format("Porta Hadamard aplicada: Novo estado %s", hadamard_result.new_state))
print(string.format("Fidelidade: %.3f", hadamard_result.fidelity))

-- Medição quântica
local measurement = mons:quantum_compute({
    operation = "measure",
    data = {qubit_id = qubit.qubit_id}
})
print(string.format("Medição: %s (probabilidade de |0⟩: %.2f)", 
      measurement.measured_state, measurement.probability_zero))
print()

-- Exemplo 5: Algoritmo de Deutsch-Jozsa
print("🔬 Testando algoritmo Deutsch-Jozsa...")
local deutsch_result = mons:quantum_compute({
    operation = "deutsch_jozsa",
    data = {function_type = "constant"}
})
print(string.format("Função detectada: %s", deutsch_result.function_type))
print(string.format("Resultado: %s", deutsch_result.result))
print(string.format("Speedup quântico: %s", deutsch_result.quantum_speedup))
print()

-- Exemplo 6: Blockchain
print("⛓️ Testando blockchain lunar...")
local wallet = mons.modules.blockchain:process({
    operation = "create_wallet",
    owner = "lunar_user"
})
print(string.format("Carteira criada: %s", wallet.address))
print(string.format("Saldo inicial: %.8f MONS", wallet.balance))

-- Cria transação
local tx = mons.modules.blockchain:process({
    operation = "create_transaction",
    from = wallet.address,
    to = "MONS_HUYGENS_MINING",
    amount = 1.0,
    data = "Mons Huygens mining reward"
})
print(string.format("Transação criada: ID %d, Taxa: %.6f", tx.transaction_id, tx.fee))

-- Minera bloco
local block = mons.modules.blockchain:process({
    operation = "mine_block",
    miner = wallet.address
})
print(string.format("Bloco minerado: %s", block.block_hash))
print(string.format("Recompensa: %.8f MONS", block.block_reward))
print()

-- Exemplo 7: Interface lunar
print("🎨 Testando interface lunar...")
local terminal = mons.modules.ui:process({
    operation = "create_terminal",
    options = {
        title = "MONS_HUYGENS_TERMINAL_v2.0",
        glitch = true,
        scanlines = true
    }
})
print(string.format("Terminal criado: ID %d, Dimensões: %dx%d", 
      terminal.component_id, terminal.dimensions.width, terminal.dimensions.height))

-- Renderiza texto com efeitos
local lunar_text = mons.modules.ui:process({
    operation = "render_text",
    text = "Welcome to the Lunar Mountain!",
    effect = "glitch",
    component_id = terminal.component_id
})
print(string.format("Texto renderizado: %s", lunar_text.rendered_text))
print(string.format("Efeitos aplicados: %s", table.concat(lunar_text.effects, ", ")))
print()

-- Exemplo 8: Métricas de performance
print("📊 Métricas de performance do Mons Huygens:")
local metrics = mons:get_metrics()
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
local combined_result = mons:process({
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
print("🔒 Testando segurança lunar...")
local security_test = mons.modules.crypto:process({
    input = "classified_lunar_data",
    algorithm = "lunar_quantum_crypto"
})
print(string.format("Nível de segurança: %s", security_test.security_level or "MAXIMUM"))
print()

-- Exemplo 11: Informações sobre Mons Huygens
print("🏔️ Sobre Mons Huygens:")
print("Mons Huygens é uma montanha lunar localizada na:")
print("- Latitude: 20.0° N")
print("- Longitude: 29.5° W") 
print("- Diâmetro: aproximadamente 30 km")
print("- Altura: aproximadamente 5.5 km")
print("- Nomeada em homenagem a Christiaan Huygens")
print("- Uma das mais altas montanhas da Lua!")
print()

print("🎉 Mons Huygens Framework demonstração concluída!")
print("🌟 O futuro lunar do código está aqui!")
print()

-- Desliga o framework gracefully
mons:shutdown()

print("👋 Até a próxima aventura lunar!")
