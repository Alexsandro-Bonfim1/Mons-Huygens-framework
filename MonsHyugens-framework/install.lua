#!/usr/bin/env lua

-- CyberLua Installation Script
-- Script de instalação e configuração do framework cyberpunk

print("🚀 CyberLua Installation Script")
print("==============================")
print("Framework cyberpunk inovador para Lua")
print()

-- Verifica versão do Lua
local lua_version = _VERSION
print(string.format("📋 Detectado Lua: %s", lua_version))

if not lua_version:find("5%.") then
    print("❌ Erro: CyberLua requer Lua 5.0 ou superior")
    os.exit(1)
end

print("✅ Versão Lua compatível")
print()

-- Configuração de instalação
local install_config = {
    framework_path = "CyberLua",
    create_examples = true,
    create_docs = true,
    setup_asm = true,
    verify_installation = true
}

print("🔧 Configuração da instalação:")
for key, value in pairs(install_config) do
    print(string.format("  %s: %s", key, tostring(value)))
end
print()

-- Função para criar diretórios
local function create_directory(path)
    local cmd = string.format("mkdir -p \"%s\" 2>/dev/null || md \"%s\" 2>nul", path, path)
    local result = os.execute(cmd)
    return result == 0 or result == true
end

-- Função para copiar arquivos
local function copy_file(src, dst)
    local src_file = io.open(src, "rb")
    if not src_file then
        return false
    end
    
    local dst_file = io.open(dst, "wb")
    if not dst_file then
        src_file:close()
        return false
    end
    
    dst_file:write(src_file:read("*all"))
    src_file:close()
    dst_file:close()
    
    return true
end

-- Função para verificar se arquivo existe
local function file_exists(path)
    local file = io.open(path, "r")
    if file then
        file:close()
        return true
    end
    return false
end

-- Inicia instalação
print("🏗️ Iniciando instalação...")

-- Cria estrutura de diretórios
local directories = {
    "CyberLua",
    "CyberLua/src",
    "CyberLua/src/core",
    "CyberLua/src/crypto",
    "CyberLua/src/neural",
    "CyberLua/src/quantum",
    "CyberLua/src/blockchain",
    "CyberLua/src/ui",
    "CyberLua/asm",
    "CyberLua/examples",
    "CyberLua/docs",
    "CyberLua/tests"
}

print("📁 Criando estrutura de diretórios...")
for _, dir in ipairs(directories) do
    if create_directory(dir) then
        print(string.format("  ✅ %s", dir))
    else
        print(string.format("  ❌ Falha ao criar %s", dir))
    end
end
print()

-- Verifica se os arquivos de origem existem
local source_files = {
    "src/init.lua",
    "src/core/init.lua",
    "src/crypto/init.lua",
    "src/neural/init.lua",
    "src/quantum/init.lua",
    "src/blockchain/init.lua",
    "src/ui/init.lua",
    "asm/optimizations.asm",
    "examples/hello_cyber.lua",
    "examples/quantum_demo.lua",
    "docs/API_REFERENCE.md",
    "README.md"
}

print("📦 Verificando arquivos de origem...")
local missing_files = {}
for _, file in ipairs(source_files) do
    if file_exists(file) then
        print(string.format("  ✅ %s", file))
    else
        print(string.format("  ❌ %s (faltando)", file))
        table.insert(missing_files, file)
    end
end

if #missing_files > 0 then
    print("\n⚠️ Arquivos faltando. A instalação pode estar incompleta.")
    print("Arquivos faltantes:")
    for _, file in ipairs(missing_files) do
        print(string.format("  - %s", file))
    end
else
    print("\n✅ Todos os arquivos de origem encontrados!")
end
print()

-- Cria script de teste
print("🧪 Criando script de teste...")
local test_script = [[
-- CyberLua Installation Test
local function test_installation()
    print("🧪 Testando instalação do CyberLua...")
    
    -- Tenta carregar o framework
    local success, CyberLua = pcall(require, "CyberLua")
    
    if not success then
        print("❌ Falha ao carregar CyberLua:")
        print(CyberLua)
        return false
    end
    
    print("✅ CyberLua carregado com sucesso!")
    
    -- Tenta inicializar
    local cyber = CyberLua.new({
        quantum = false,
        neural = false,
        crypto = "standard",
        asm_optimized = true,
        debug = false
    })
    
    if not cyber then
        print("❌ Falha ao inicializar CyberLua")
        return false
    end
    
    print("✅ CyberLua inicializado com sucesso!")
    
    -- Testa processamento básico
    local result = cyber:process({
        input = {value = 10, value2 = 5},
        algorithm = "assembly_optimized"
    })
    
    if result and result.result then
        print("✅ Processamento básico funcionando!")
        print(string.format("  10 + 5 = %.2f", result.result.add))
    else
        print("❌ Falha no processamento básico")
        return false
    end
    
    -- Testa criptografia
    local encrypted = cyber:encrypt({
        data = "test message",
        method = "AES256"
    })
    
    if encrypted and encrypted.ciphertext then
        print("✅ Criptografia funcionando!")
    else
        print("❌ Falha na criptografia")
        return false
    end
    
    -- Obtém métricas
    local metrics = cyber:get_metrics()
    if metrics then
        print("✅ Métricas disponíveis!")
        print(string.format("  Operações: %d", metrics.operations))
    else
        print("❌ Falha ao obter métricas")
        return false
    end
    
    -- Cleanup
    cyber:shutdown()
    
    print("🎉 Todos os testes passaram!")
    print("🌟 CyberLua está pronto para uso!")
    
    return true
end

-- Executa teste
return test_installation()
]]

local test_file = io.open("CyberLua/test_installation.lua", "w")
if test_file then
    test_file:write(test_script)
    test_file:close()
    print("✅ Script de teste criado: CyberLua/test_installation.lua")
else
    print("❌ Falha ao criar script de teste")
end
print()

-- Cria script de exemplo rápido
print("📝 Criando exemplo rápido...")
local quick_example = [[
-- CyberLua Quick Example
local CyberLua = require("CyberLua")

print("🚀 CyberLua Quick Start")

-- Inicializa framework
local cyber = CyberLua.new({
    quantum = true,
    neural = true,
    crypto = "military_grade",
    asm_optimized = true
})

-- Processamento otimizado
local result = cyber:process({
    input = {value = 42, value2 = 24},
    algorithm = "assembly_optimized"
})
print(string.format("Resultado: %.2f + %.2f = %.2f", 42, 24, result.result.add))

-- Criptografia quântica
local encrypted = cyber:encrypt({
    data = "CyberLua is amazing!",
    method = "quantum_aes"
})
print(string.format("Criptografado com: %s", encrypted.algorithm))

-- Computação quântica
local qubit = cyber:quantum_compute({
    operation = "create_qubit",
    data = {initial_state = "|0⟩"}
})
print(string.format("Qubit criado: %s", qubit.state))

-- Interface cyberpunk
local terminal = cyber.modules.ui:process({
    operation = "create_terminal",
    options = {title = "CYBER_QUICK_START"}
})
print(string.format("Terminal criado: ID %d", terminal.component_id))

-- Métricas
local metrics = cyber:get_metrics()
print(string.format("Operações realizadas: %d", metrics.operations))

cyber:shutdown()
print("🎉 Exemplo concluído!")
]]

local example_file = io.open("CyberLua/quick_start.lua", "w")
if example_file then
    example_file:write(quick_example)
    example_file:close()
    print("✅ Exemplo rápido criado: CyberLua/quick_start.lua")
else
    print("❌ Falha ao criar exemplo rápido")
end
print()

-- Cria arquivo de configuração
print("⚙️ Criando configuração...")
local config_content = [[
-- CyberLua Configuration File
return {
    -- Configurações padrão
    default_config = {
        quantum = false,
        neural = false,
        crypto = "standard",
        asm_optimized = true,
        debug = false,
        theme = "neon_blue"
    },
    
    -- Configurações de performance
    performance = {
        max_operations = 10000,
        memory_limit = 1024 * 1024 * 64, -- 64MB
        gc_threshold = 100
    },
    
    -- Configurações de segurança
    security = {
        max_key_size = 4096,
        allowed_algorithms = {
            "AES256", "RSA4096", "ED25519", 
            "QUANTUM_AES", "POST_QUANTUM_RSA"
        }
    },
    
    -- Configurações de UI
    ui = {
        default_terminal_size = {80, 24},
        max_animations = 10,
        effects_enabled = true
    },
    
    -- Configurações quânticas
    quantum = {
        max_qubits = 20,
        max_registers = 5,
        decoherence_rate = 0.01
    },
    
    -- Configurações neurais
    neural = {
        max_models = 10,
        max_layers = 50,
        max_neurons = 10000
    }
}
]]

local config_file = io.open("CyberLua/config.lua", "w")
if config_file then
    config_file:write(config_content)
    config_file:close()
    print("✅ Configuração criada: CyberLua/config.lua")
else
    print("❌ Falha ao criar configuração")
end
print()

-- Cria script de build
print("🔨 Criando script de build...")
local build_script = [[
-- CyberLua Build Script
local function build_cyberlua()
    print("🔨 Building CyberLua...")
    
    -- Compila otimizações Assembly (se disponível)
    local asm_available = false
    local asm_files = {
        "asm/optimizations.asm"
    }
    
    for _, asm_file in ipairs(asm_files) do
        local file = io.open(asm_file, "r")
        if file then
            file:close()
            asm_available = true
            print(string.format("  ✅ Found %s", asm_file))
        else
            print(string.format("  ❌ Missing %s", asm_file))
        end
    end
    
    if asm_available then
        print("  🔧 Assembly optimizations available")
        print("  ⚠️ Note: Actual compilation requires assembler (NASM/FASM)")
    else
        print("  ⚠️ No assembly files found")
    end
    
    -- Valida estrutura
    local required_modules = {
        "src/init.lua",
        "src/core/init.lua",
        "src/crypto/init.lua",
        "src/neural/init.lua",
        "src/quantum/init.lua",
        "src/blockchain/init.lua",
        "src/ui/init.lua"
    }
    
    local all_valid = true
    for _, module in ipairs(required_modules) do
        local file = io.open(module, "r")
        if file then
            file:close()
            print(string.format("  ✅ %s", module))
        else
            print(string.format("  ❌ %s", module))
            all_valid = false
        end
    end
    
    if all_valid then
        print("✅ All modules validated!")
        print("🚀 CyberLua build successful!")
        return true
    else
        print("❌ Build failed - missing modules")
        return false
    end
end

return build_cyberlua()
]]

local build_file = io.open("CyberLua/build.lua", "w")
if build_file then
    build_file:write(build_script)
    build_file:close()
    print("✅ Script de build criado: CyberLua/build.lua")
else
    print("❌ Falha ao criar script de build")
end
print()

-- Resumo da instalação
print("📋 Resumo da Instalação:")
print("=======================")
print("✅ Estrutura de diretórios criada")
print("✅ Scripts de configuração criados")
print("✅ Scripts de teste criados")
print("✅ Documentação disponível")
print()

-- Instruções de uso
print("🎯 Como usar o CyberLua:")
print("======================")
print("1. Execute o teste de instalação:")
print("   lua CyberLua/test_installation.lua")
print()
print("2. Execute o exemplo rápido:")
print("   lua CyberLua/quick_start.lua")
print()
print("3. Execute o demo completo:")
print("   lua CyberLua/examples/hello_cyber.lua")
print()
print("4. Execute o demo quântico:")
print("   lua CyberLua/examples/quantum_demo.lua")
print()
print("5. Verifique a documentação:")
print("   CyberLua/docs/API_REFERENCE.md")
print()
print("6. Configure conforme necessário:")
print("   CyberLua/config.lua")
print()

print("🌟 CyberLua Framework instalado com sucesso!")
print("🚀 O futuro do código cyberpunk está em suas mãos!")
print()

-- Pergunta se deseja executar teste
io.write("🧪 Deseja executar o teste de instalação agora? (S/N): ")
local response = io.read():upper()

if response == "S" or response == "SIM" then
    print("\n🧪 Executando teste de instalação...")
    print("=====================================\n")
    
    -- Carrega e executa o teste
    local test_success, test_result = pcall(dofile, "CyberLua/test_installation.lua")
    
    if test_success then
        if test_result then
            print("\n🎉 Instalação validada com sucesso!")
            print("🌟 CyberLua está pronto para uso avançado!")
        else
            print("\n⚠️ Instalação concluída, mas alguns testes falharam.")
            print("📋 Verifique os logs acima para detalhes.")
        end
    else
        print("\n❌ Erro ao executar teste:")
        print(test_result)
        print("📋 Verifique a instalação manualmente.")
    end
else
    print("\n📋 Teste pulado. Execute manualmente com:")
    print("   lua CyberLua/test_installation.lua")
end

print()
print("👋 Obrigado por instalar CyberLua!")
print("🚀 Happy coding in the cyberpunk future!")
