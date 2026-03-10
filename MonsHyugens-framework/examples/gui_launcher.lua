-- Mons Huygens Framework GUI Launcher
-- Interface Gráfica Lunar com Logo Animado

local MonsHuygens = require("MonsHuygens")
local gui = require("MonsHuygens.gui")

print("⛰️ Inicializando Mons Huygens GUI Framework...")

-- Inicializa o framework
local mons = MonsHuygens.new({
    quantum = true,
    neural = true,
    crypto = "lunar_grade",
    asm_optimized = true,
    debug = true,
    theme = "mountain_silver"
})

-- Configurações da GUI
local gui_config = {
    title = "Mons Huygens Framework - GUI v2.0",
    width = 1400,
    height = 900,
    fullscreen = false,
    vsync = true,
    theme = "lunar_silver",
    show_logo = true,
    show_fps = true,
    show_metrics = true
}

-- Inicializa a GUI
local gui_instance = gui.init(gui_config)

-- Adiciona o logo animado
function show_logo_animation()
    print("🎨 Exibindo logo animado...")
    
    -- Lê o logo ASCII
    local logo_file = io.open("assets/logo_ascii.txt", "r")
    if logo_file then
        local logo_content = logo_file:read("*all")
        logo_file:close()
        print(logo_content)
    else
        -- Logo ASCII inline se arquivo não existir
        print([[
    ╔════════════════════════════════════════════════════════════╗
    ║                                                              ║
    ║    ⛰️  MONS HUYGENS FRAMEWORK  ⛰️                           ║
    ║                                                              ║
    ║            /\\                                              ║
    ║           /  \\                                             ║
    ║          /    \\        🌙                                   ║
    ║         /      \\      /\\                                   ║
    ║        /   🌟   \\    /  \\                                  ║
    ║       /          \\  /    \\                                 ║
    ║      /____________\\_/______\\                                ║
    ║                                                              ║
    ║    Quantum • Neural • Blockchain • Assembly • Lunar          ║
    ║                                                              ║
    ╚════════════════════════════════════════════════════════════╝
        ]])
    end
end

-- Funções de interação da GUI
function gui_interactions()
    print("🎮 Configurando interações da GUI...")
    
    -- Configura callbacks para eventos
    gui_instance.on_start = function()
        print("🚀 Framework iniciado via GUI")
        mons:debug("GUI Start button clicked")
    end
    
    gui_instance.on_stop = function()
        print("⏹️ Framework parado via GUI")
        mons:debug("GUI Stop button clicked")
    end
    
    gui_instance.on_reset = function()
        print("🔄 Métricas resetadas via GUI")
        mons:debug("GUI Reset button clicked")
    end
    
    gui_instance.on_export = function()
        print("📤 Exportando dados via GUI")
        mons:debug("GUI Export button clicked")
        return gui_export_data()
    end
    
    gui_instance.on_quantum_change = function(value)
        print(string.format("⚛️ Quantum level: %d%%", value))
        mons:debug(string.format("Quantum slider: %d", value))
    end
    
    gui_instance.on_neural_change = function(value)
        print(string.format("🧠 Neural level: %d%%", value))
        mons:debug(string.format("Neural slider: %d", value))
    end
    
    gui_instance.on_crypto_change = function(value)
        print(string.format("🔐 Crypto level: %d%%", value))
        mons:debug(string.format("Crypto slider: %d", value))
    end
end

-- Exporta dados do framework
function gui_export_data()
    local metrics = mons:get_metrics()
    local export_data = {
        timestamp = os.date("%Y-%m-%d %H:%M:%S"),
        framework = "Mons Huygens Framework",
        version = MonsHuygens.VERSION,
        build = MonsHuygens.BUILD,
        metrics = metrics,
        modules = {
            quantum = mons.config.quantum_enabled,
            neural = mons.config.neural_enabled,
            crypto = mons.config.crypto_level,
            assembly = mons.config.assembly_optimized
        }
    }
    
    -- Salva em arquivo JSON simulado
    local json_string = "-- Mons Huygens Export Data\n"
    json_string = json_string .. string.format("-- Timestamp: %s\n", export_data.timestamp)
    json_string = json_string .. string.format("-- Framework: %s v%s [%s]\n", 
                                              export_data.framework, 
                                              export_data.version, 
                                              export_data.build)
    json_string = json_string .. "-- Metrics:\n"
    
    for key, value in pairs(export_data.metrics) do
        json_string = json_string .. string.format("--   %s: %s\n", key, tostring(value))
    end
    
    json_string = json_string .. "-- Modules:\n"
    for key, value in pairs(export_data.modules) do
        json_string = json_string .. string.format("--   %s: %s\n", key, tostring(value))
    end
    
    local file = io.open("mons_huygens_export.txt", "w")
    if file then
        file:write(json_string)
        file:close()
        print("📁 Dados exportados para 'mons_huygens_export.txt'")
    else
        print("❌ Erro ao exportar dados")
    end
    
    return export_data
end

-- Demo de funcionalidades da GUI
function gui_demo()
    print("🎨 Iniciando demo da GUI...")
    
    -- Animação do logo
    show_logo_animation()
    
    -- Configura interações
    gui_interactions()
    
    -- Demo de terminal
    print("📟 Demo do Terminal Lunar:")
    gui_instance.components.terminal:add_line("⛰️ Mons Huygens Framework v" .. MonsHuygens.VERSION .. " iniciado")
    gui_instance.components.terminal:add_line("🌙 Tema lunar carregado com sucesso")
    gui_instance.components.terminal:add_line("⚛️ Módulo quântico: " .. (mons.config.quantum_enabled and "ATIVO" or "INATIVO"))
    gui_instance.components.terminal:add_line("🧠 Módulo neural: " .. (mons.config.neural_enabled and "ATIVO" or "INATIVO"))
    gui_instance.components.terminal:add_line("🔐 Criptografia: " .. mons.config.crypto_level)
    gui_instance.components.terminal:add_line("🔧 Assembly: " .. (mons.config.assembly_optimized and "OTIMIZADO" or "PADRÃO"))
    gui_instance.components.terminal:add_line("✅ Todos os sistemas operacionais")
    
    -- Demo de métricas em tempo real
    print("📊 Demo de Métricas em Tempo Real:")
    for i = 1, 5 do
        local metrics = mons:get_metrics()
        print(string.format("Frame %d: Ops=%d, Quantum=%d, Neural=%d, Crypto=%d, Memory=%.2fKB", 
                           i, metrics.operations, metrics.quantum_cycles, 
                           metrics.neural_processes, metrics.crypto_operations, 
                           metrics.memory_usage))
        
        -- Simula atividade
        mons:process({input = {value = i}, algorithm = "assembly_optimized"})
        mons:quantum_compute({operation = "create_qubit"})
        mons:neural_process({input = {math.random()}, operation = "predict"})
        mons:encrypt({data = "test_" .. i, method = "quantum_aes"})
        
        -- Atualiza GUI
        if gui_instance.components.metrics_panel then
            gui_instance.components.metrics_panel.gauges.cpu.value = math.random(20, 80)
            gui_instance.components.metrics_panel.gauges.memory.value = math.random(30, 70)
            gui_instance.components.metrics_panel.gauges.quantum.value = math.random(10, 90)
            gui_instance.components.metrics_panel.gauges.neural.value = math.random(15, 85)
        end
        
        -- Pequena pausa para efeito visual
        os.execute("ping 127.0.0.1 -n 2 > nul 2>&1")
    end
    
    -- Demo do visualizador quântico
    print("⚛️ Demo do Visualizador Quântico:")
    local quantum_viz = gui_instance.components.quantum_visualizer
    if quantum_viz then
        for i = 1, 8 do
            -- Cria superposição quântica
            quantum_viz.qubits[i].state = math.random() > 0.5 and "|0⟩" or "|1⟩"
            quantum_viz.qubits[i].amplitude.alpha = math.random()
            quantum_viz.qubits[i].amplitude.beta = math.random()
            quantum_viz.qubits[i].phase = math.random() * 2 * math.pi
            
            print(string.format("Qubit %d: %s, α=%.2f, β=%.2f, φ=%.2f", 
                               i, quantum_viz.qubits[i].state,
                               quantum_viz.qubits[i].amplitude.alpha,
                               quantum_viz.qubits[i].amplitude.beta,
                               quantum_viz.qubits[i].phase))
        end
    end
    
    -- Demo da rede neural
    print("🧠 Demo da Rede Neural:")
    local neural_viz = gui_instance.components.neural_network_view
    if neural_viz then
        for layer_idx, layer in ipairs(neural_viz.layers) do
            print(string.format("Layer %d (%s): %d neurônios", 
                               layer_idx, layer.type, layer.neurons))
        end
        
        -- Simula ativação
        for layer_idx = 1, #neural_viz.layers do
            for neuron_idx = 1, neural_viz.layers[layer_idx].neurons do
                local activity = math.random()
                print(string.format("  Neuron [%d,%d]: %.3f", layer_idx, neuron_idx, activity))
            end
        end
    end
    
    -- Demo do blockchain explorer
    print("⛓️ Demo do Blockchain Explorer:")
    local blockchain = gui_instance.components.blockchain_explorer
    if blockchain then
        for i = 1, 5 do
            local block = blockchain.blocks[i]
            print(string.format("Block #%d: %s...%s (%d txs)", 
                               block.height, 
                               block.hash:sub(1, 8), 
                               block.hash:sub(-8),
                               block.transactions))
        end
    end
end

-- Função principal
function main()
    print("🌙 Mons Huygens GUI Framework - Launcher")
    print("=" .. string.rep("=", 50))
    
    -- Mostra logo
    show_logo_animation()
    
    -- Inicializa framework
    print("\n⛰️ Framework Mons Huygens inicializado!")
    print(string.format("📋 Versão: %s [%s]", MonsHuygens.VERSION, MonsHuygens.BUILD))
    print(string.format("🎨 Tema: %s", gui_config.theme))
    print(string.format("🖥️  Resolução: %dx%d", gui_config.width, gui_config.height))
    
    -- Inicia demo
    print("\n🎮 Iniciando demonstração da GUI...")
    gui_demo()
    
    -- Menu interativo
    print("\n📋 Menu Interativo:")
    print("1. Ver métricas em tempo real")
    print("2. Testar processamento quântico")
    print("3. Testar rede neural")
    print("4. Testar criptografia")
    print("5. Exportar dados")
    print("6. Sair")
    
    while true do
        io.write("\n🔹 Escolha uma opção (1-6): ")
        local choice = io.read()
        
        if choice == "1" then
            local metrics = mons:get_metrics()
            print("\n📊 Métricas Atuais:")
            for key, value in pairs(metrics) do
                print(string.format("  %s: %s", key, tostring(value)))
            end
            
        elseif choice == "2" then
            print("\n⚛️ Teste Quântico:")
            local qubit = mons:quantum_compute({operation = "create_qubit"})
            print(string.format("Qubit criado: ID %d, Estado: %s", qubit.qubit_id, qubit.state))
            
        elseif choice == "3" then
            print("\n🧠 Teste Neural:")
            local neural_input = {}
            for i = 1, 10 do
                neural_input[i] = math.random()
            end
            local result = mons:neural_process({input = neural_input, operation = "predict"})
            print(string.format("Previsão: %.2f%% confiança", result.confidence * 100))
            
        elseif choice == "4" then
            print("\n🔐 Teste de Criptografia:")
            local message = "Mons Huygens secret message"
            local encrypted = mons:encrypt({data = message, method = "quantum_aes"})
            print(string.format("Mensagem: %s", message))
            print(string.format("Criptografado com: %s", encrypted.algorithm))
            
        elseif choice == "5" then
            print("\n📤 Exportando dados...")
            gui_export_data()
            
        elseif choice == "6" then
            print("\n👋 Encerrando GUI...")
            break
            
        else
            print("❌ Opção inválida!")
        end
    end
    
    -- Cleanup
    mons:shutdown()
    gui.cleanup()
    print("✅ Mons Huygens GUI Framework encerrado com sucesso!")
end

-- Executa se for chamado diretamente
if arg and arg[0] and arg[0]:match("gui_launcher%.lua$") then
    main()
end

return {
    main = main,
    show_logo = show_logo_animation,
    demo = gui_demo,
    export_data = gui_export_data
}
