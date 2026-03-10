-- CyberLua Quantum Computing Demo
-- Demonstração completa das capacidades quânticas do framework

local CyberLua = require("CyberLua")

print("⚛️ CyberLua Quantum Computing Demo")
print("==================================")

-- Inicializa framework com foco quântico
local cyber = CyberLua.new({
    quantum = true,
    neural = false,
    crypto = "quantum_resistant",
    asm_optimized = true,
    debug = true,
    theme = "quantum_purple"
})

print("🚀 Framework quântico inicializado!")
print()

-- Demo 1: Criação e manipulação de qubits
print("🔬 Demo 1: Criação e Manipulação de Qubits")
print("------------------------------------------")

-- Cria qubit no estado |0⟩
local qubit1 = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})
print(string.format("Qubit 1 criado: ID %d, Estado: %s", qubit1.qubit_id, qubit1.state))

-- Cria qubit no estado |1⟩
local qubit2 = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|1⟩"}
})
print(string.format("Qubit 2 criado: ID %d, Estado: %s", qubit2.qubit_id, qubit2.state))

-- Aplica porta Hadamard no primeiro qubit (cria superposição)
local hadamard1 = cyber:quantum_compute({
    operation = "apply_gate",
    data = {qubit_id = qubit1.qubit_id, gate = "H"}
})
print(string.format("Hadamard aplicada ao Qubit 1: Novo estado %s", hadamard1.new_state))
print(string.format("Amplitudes: α=%.3f, β=%.3f", hadamard1.amplitudes.alpha, hadamard1.amplitudes.beta))
print()

-- Demo 2: Entrelaçamento quântico
print("🔗 Demo 2: Entrelaçamento Quântico")
print("-----------------------------------")

-- Cria par de qubits para entrelaçamento
local qubit3 = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})
local qubit4 = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})

-- Entrelaça os qubits
local entanglement = cyber:quantum_compute({
    operation = "entangle",
    data = {qubit1_id = qubit3.qubit_id, qubit2_id = qubit4.qubit_id}
})
print(string.format("Entrelaçamento criado: %s", entanglement.bell_state))
print(string.format("Força de correlação: %.1f", entanglement.correlation_strength))
print()

-- Demo 3: Medição quântica e colapso
print("📏 Demo 3: Medição Quântica")
print("---------------------------")

-- Mede qubit em superposição
local measurement1 = cyber:quantum_compute({
    operation = "measure",
    data = {qubit_id = qubit1.qubit_id}
})
print(string.format("Medição Qubit 1: %s", measurement1.measured_state))
print(string.format("Probabilidade de |0⟩: %.2f", measurement1.probability_zero))

-- Mede qubit entrelaçado
local measurement2 = cyber:quantum_compute({
    operation = "measure",
    data = {qubit_id = qubit3.qubit_id}
})
print(string.format("Medição Qubit 3: %s", measurement2.measured_state))
print("Colapso da função de onda ocorreu!")
print()

-- Demo 4: Registrador quântico
print("🏗️ Demo 4: Registrador Quântico de 3 Qubits")
print("-------------------------------------------")

-- Cria registrador de 3 qubits
local register = cyber:quantum_compute({
    operation = "create_register",
    data = {num_qubits = 3}
})
print(string.format("Registrador criado: ID %d", register.register_id))
print(string.format("Tamanho: %d qubits", register.size))
print(string.format("Dimensionalidade: %d estados", register.dimensionality))

-- Aplica portas aos qubits do registrador
for i, qubit_id in ipairs(register.qubits) do
    local gate_result = cyber:quantum_compute({
        operation = "apply_gate",
        data = {qubit_id = qubit_id, gate = "H"}
    })
    print(string.format("Porta H aplicada ao qubit %d: %s", i, gate_result.new_state))
end
print()

-- Demo 5: Algoritmo de Deutsch-Jozsa
print("🔍 Demo 5: Algoritmo de Deutsch-Jozsa")
print("-------------------------------------")

-- Testa função constante
local deutsch_constant = cyber:quantum_compute({
    operation = "deutsch_jozsa",
    data = {function_type = "constant"}
})
print(string.format("Função constante detectada: %s", deutsch_constant.function_type))
print(string.format("Resultado: %s", deutsch_constant.result))
print(string.format("Speedup quântico: %s", deutsch_constant.quantum_speedup))

-- Testa função balanceada
local deutsch_balanced = cyber:quantum_compute({
    operation = "deutsch_jozsa",
    data = {function_type = "balanced"}
})
print(string.format("Função balanceada detectada: %s", deutsch_balanced.function_type))
print(string.format("Resultado: %s", deutsch_balanced.result))
print()

-- Demo 6: Algoritmo de Grover
print("🔎 Demo 6: Algoritmo de Busca de Grover")
print("---------------------------------------")

-- Busca em espaço de 8 elementos
local grover_search = cyber:quantum_compute({
    operation = "grover",
    data = {search_space = 8, target = 5}
})
print(string.format("Espaço de busca: %d elementos", grover_search.search_space_size))
print(string.format("Alvo: %d", grover_search.target_index))
print(string.format("Encontrado: %d", grover_search.found_index))
print(string.format("Sucesso: %s", grover_search.success and "SIM" or "NÃO"))
print(string.format("Iterações: %d", grover_search.iterations))
print(string.format("Speedup: %s", grover_search.speedup))
print()

-- Demo 7: Teleportação Quântica
print("🌀 Demo 7: Teleportação Quântica")
print("--------------------------------")

-- Cria qubit a ser teleportado
local source_qubit = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|+⟩"}
})

-- Cria qubit de destino
local dest_qubit = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})

-- Realiza teleportação
local teleportation = cyber:quantum_compute({
    operation = "teleport",
    data = {source_id = source_qubit.qubit_id, dest_id = dest_qubit.qubit_id}
})
print(string.format("Teleportação concluída: %s", teleportation.teleportation_complete and "SIM" or "NÃO"))
print(string.format("Estado original: %s", teleportation.original_state))
print(string.format("Fidelidade: %.2f", teleportation.fidelity))
print(string.format("Bits clássicos transmitidos: %d", teleportation.classical_bits_transmitted))
print()

-- Demo 8: Computação Quântica com Criptografia
print("🔐 Demo 8: Criptografia Quântica")
print("---------------------------------")

-- Criptografa mensagem usando método quântico
local quantum_message = "Quantum cryptography is unbreakable!"
local quantum_encrypted = cyber:encrypt({
    data = quantum_message,
    method = "quantum_aes",
    key_size = 512
})

print(string.format("Mensagem original: %s", quantum_message))
print(string.format("Algoritmo: %s", quantum_encrypted.algorithm))
print(string.format("Entrelaçamento quântico: %s", quantum_encrypted.quantum_entanglement and "SIM" ou "NÃO"))
print(string.format("Estado quântico: %s", quantum_encrypted.quantum_state))
print()

-- Demo 9: Simulação de Decoerência
print("💫 Demo 9: Decoerência Quântica")
print("---------------------------------")

-- Cria qubit para teste de decoerência
local decoherence_qubit = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|+⟩"}
})

-- Aplica decoerência gradual
for i = 1, 5 do
    local decoherence_result = cyber.modules.quantum:apply_decoherence(
        decoherence_qubit.qubit_id, 
        0.15  -- 15% de decoerência por passo
    )
    print(string.format("Passo %d: Coerência = %.2f, Colapso = %s", 
          i, decoherence_result.new_coherence, 
          decoherence_result.state_collapsed and "SIM" or "NÃO"))
    
    if decoherence_result.state_collapsed then
        break
    end
end
print()

-- Demo 10: Estatísticas Quânticas
print("📊 Demo 10: Estatísticas de Performance")
print("---------------------------------------")

local metrics = cyber:get_metrics()
print("🔬 Métricas Quânticas:")
print(string.format("  Ciclos quânticos: %d", metrics.quantum_cycles))
print(string.format("  Operações totais: %d", metrics.operations))
print(string.format("  Tempo de execução: %d segundos", metrics.uptime))
print(string.format("  Otimizações Assembly: %s", metrics.assembly_optimizations))
print()

-- Demo 11: Circuito Quântico Complexo
print("⚡ Demo 11: Circuito Quântico Complexo")
print("--------------------------------------")

-- Cria circuito com múltiplas portas
print("Construindo circuito quântico:")
print("Q1: |0⟩ ──H─────■─────H───M")
print("              │")
print("Q2: |0⟩ ──H─────X─────H───M")

-- Cria dois qubits
local circuit_q1 = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})
local circuit_q2 = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})

-- Aplica sequência de portas
local gates = {"H", "H"}  -- Hadamard em ambos
for i, qubit_id in ipairs({circuit_q1.qubit_id, circuit_q2.qubit_id}) do
    local gate_result = cyber:quantum_compute({
        operation = "apply_gate",
        data = {qubit_id = qubit_id, gate = gates[i]}
    })
    print(string.format("H aplicada ao Qubit %d", i))
end

-- Aplica CNOT
local cnot_result = cyber:quantum_compute({
    operation = "apply_gate",
    data = {qubit_id = circuit_q1.qubit_id, gate = "CNOT"}
})
print("CNOT aplicado: Q1 controla Q2")

-- Aplica Hadamard final
for i, qubit_id in ipairs({circuit_q1.qubit_id, circuit_q2.qubit_id}) do
    local gate_result = cyber:quantum_compute({
        operation = "apply_gate",
        data = {qubit_id = qubit_id, gate = "H"}
    })
    print(string.format("H final aplicada ao Qubit %d", i))
end

-- Medição final
local final_measure1 = cyber:quantum_compute({
    operation = "measure",
    data = {qubit_id = circuit_q1.qubit_id}
})
local final_measure2 = cyber:quantum_compute({
    operation = "measure",
    data = {qubit_id = circuit_q2.qubit_id}
})

print(string.format("Medição final - Q1: %s, Q2: %s", final_measure1.measured_state, final_measure2.measured_state))
print()

print("🎉 Demonstração quântica concluída!")
print("🌟 CyberLua: O futuro da computação quântica em Lua!")
print()

-- Desliga o framework
cyber:shutdown()

print("👋 Fim da demonstração quântica!")
