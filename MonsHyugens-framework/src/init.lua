-- Mons Huygens Framework - Módulo Principal
-- Framework lunar inovador com otimizações Assembly

local MonsHuygens = {}
MonsHuygens.__index = MonsHuygens

-- Versão do framework
MonsHuygens.VERSION = "1.0.0-alpha"
MonsHuygens.BUILD = "MONS_HUYGENS_PEAK"

-- Módulos disponíveis
local modules = {
    core = require("MonsHuygens.core"),
    crypto = require("MonsHuygens.crypto"),
    neural = require("MonsHuygens.neural"),
    quantum = require("MonsHuygens.quantum"),
    blockchain = require("MonsHuygens.blockchain"),
    ui = require("MonsHuygens.ui")
}

-- Função de inicialização do framework
function MonsHuygens.new(options)
    options = options or {}
    
    local self = setmetatable({}, MonsHuygens)
    
    -- Configurações lunares
    self.config = {
        quantum_enabled = options.quantum or false,
        neural_enabled = options.neural or false,
        crypto_level = options.crypto or "standard",
        assembly_optimized = options.asm_optimized or true,
        debug_mode = options.debug or false,
        lunar_theme = options.theme or "mountain_silver"
    }
    
    -- Inicializa módulos
    self.modules = {}
    for name, module in pairs(modules) do
        if module.init then
            self.modules[name] = module.init(self.config)
        else
            self.modules[name] = module
        end
    end
    
    -- Runtime metrics
    self.metrics = {
        uptime = 0,
        operations = 0,
        quantum_cycles = 0,
        neural_processes = 0,
        crypto_operations = 0
    }
    
    print(string.format("⛰️ Mons Huygens v%s [%s] - Framework Lunar Ativado!", 
          MonsHuygens.VERSION, MonsHuygens.BUILD))
    
    return self
end

-- Método de processamento unificado
function MonsHuygens:process(params)
    self.metrics.operations = self.metrics.operations + 1
    
    local input = params.input
    local algorithm = params.algorithm or "standard"
    local optimization = params.optimization or "auto"
    
    -- Seleciona o módulo apropriado
    if algorithm:find("quantum") and self.config.quantum_enabled then
        return self.modules.quantum:process(input, algorithm)
    elseif algorithm:find("neural") and self.config.neural_enabled then
        return self.modules.neural:process(input, algorithm)
    elseif algorithm:find("crypto") then
        return self.modules.crypto:process(input, algorithm)
    else
        return self.modules.core:process(input, algorithm)
    end
end

-- Interface de criptografia
function MonsHuygens:encrypt(params)
    self.metrics.crypto_operations = self.metrics.crypto_operations + 1
    return self.modules.crypto:encrypt(params)
end

function MonsHuygens:decrypt(params)
    self.metrics.crypto_operations = self.metrics.crypto_operations + 1
    return self.modules.crypto:decrypt(params)
end

-- Interface neural
function MonsHuygens:neural_process(params)
    if not self.config.neural_enabled then
        error("Módulo neural não está ativado")
    end
    self.metrics.neural_processes = self.metrics.neural_processes + 1
    return self.modules.neural:process(params)
end

-- Interface quântica
function MonsHuygens:quantum_compute(params)
    if not self.config.quantum_enabled then
        error("Módulo quântico não está ativado")
    end
    self.metrics.quantum_cycles = self.metrics.quantum_cycles + 1
    return self.modules.quantum:compute(params)
end

-- Métricas de performance
function MonsHuygens:get_metrics()
    return {
        uptime = os.time() - (self.start_time or os.time()),
        operations = self.metrics.operations,
        quantum_cycles = self.metrics.quantum_cycles,
        neural_processes = self.metrics.neural_processes,
        crypto_operations = self.metrics.crypto_operations,
        memory_usage = collectgarbage("count"),
        assembly_optimizations = self.config.assembly_optimized and "enabled" or "disabled"
    }
end

-- Debug mode
function MonsHuygens:debug(message)
    if self.config.debug_mode then
        print(string.format("[MONS_DEBUG] %s", tostring(message)))
    end
end

-- Cleanup
function MonsHuygens:shutdown()
    print("⛰️ Desligando Mons Huygens Framework...")
    
    -- Limpa módulos
    for name, module in pairs(self.modules) do
        if module.cleanup then
            module:cleanup()
        end
    end
    
    -- Coleta de lixo
    collectgarbage("collect")
    
    print("✅ Mons Huygens desligado com sucesso!")
end

return MonsHuygens
