-- CyberLua Blockchain Module
-- Blockchain cyberpunk com contratos inteligentes e criptomoedas

local blockchain = {}

-- Configurações da blockchain
local chain_config = {
    block_size = 1024 * 1024,  -- 1MB
    difficulty_target = "0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
    block_reward = 6.25,
    halving_interval = 210000,
    max_supply = 21000000
}

-- Inicialização do módulo blockchain
function blockchain.init(config)
    local instance = {
        config = config,
        chain = {},
        mempool = {},
        wallets = {},
        smart_contracts = {},
        nodes = {},
        metrics = {
            blocks_mined = 0,
            transactions_processed = 0,
            contracts_deployed = 0,
            total_hash_power = 0
        }
    }
    
    -- Cria bloco gênesis
    local genesis_block = create_genesis_block()
    table.insert(instance.chain, genesis_block)
    
    print("⛓️ LunarChain inicializada - Blockchain Lunar Ativada")
    
    return setmetatable(instance, {__index = blockchain})
end

-- Criação do bloco gênesis
function create_genesis_block()
    return {
        index = 0,
        timestamp = os.time() - 1000000,  -- No passado
        data = "Mons Huygens Genesis Block - The Lunar Age is Now",
        previous_hash = "0" * 64,
        nonce = 0,
        hash = "0000monshuygensgenesisblockhash2025lunarframeworkinnovation",
        miner = "mons_huygens_system",
        transactions = {}
    }
end

-- Criação de nova transação
function blockchain:create_transaction(from, to, amount, data)
    local transaction = {
        id = math.random(100000, 999999),
        from = from,
        to = to,
        amount = amount,
        data = data or "",
        timestamp = os.time(),
        fee = math.random(0.0001, 0.001),
        signature = self:sign_transaction(from, to, amount)
    }
    
    table.insert(self.mempool, transaction)
    
    return {
        transaction_id = transaction.id,
        status = "pending",
        fee = transaction.fee,
        mempool_size = #self.mempool
    }
end

-- Assinatura de transação (simulada)
function blockchain:sign_transaction(from, to, amount)
    local message = from .. to .. amount .. os.time()
    local signature = ""
    for i = 1, 64 do
        signature = signature .. string.format("%x", math.random(0, 15))
    end
    return signature
end

-- Mineração de bloco
function blockchain:mine_block(miner_address)
    local previous_block = self.chain[#self.chain]
    local new_block = {
        index = previous_block.index + 1,
        timestamp = os.time(),
        data = "CyberBlock " .. previous_block.index + 1,
        previous_hash = previous_block.hash,
        nonce = 0,
        miner = miner_address,
        transactions = {}
    }
    
    -- Seleciona transações do mempool
    local selected_transactions = {}
    local total_size = 0
    local total_fees = 0
    
    for _, tx in ipairs(self.mempool) do
        if total_size < chain_config.block_size then
            table.insert(selected_transactions, tx)
            total_size = total_size + 256  -- Estimativa de tamanho
            total_fees = total_fees + tx.fee
        end
    end
    
    new_block.transactions = selected_transactions
    
    -- Proof of Work (simulado)
    local target_hash = chain_config.difficulty_target
    local hash = ""
    
    while true do
        new_block.nonce = new_block.nonce + 1
        hash = self:calculate_block_hash(new_block)
        
        -- Simula encontrar hash válido após alguns tentativas
        if new_block.nonce > 1000 or math.random() < 0.001 then
            hash = "0000" .. string.sub(hash, 5)  -- Garante prefixo 0000
            break
        end
    end
    
    new_block.hash = hash
    
    -- Adiciona bloco à chain
    table.insert(self.chain, new_block)
    
    -- Remove transações do mempool
    for _, tx in ipairs(selected_transactions) do
        for i, mempool_tx in ipairs(self.mempool) do
            if mempool_tx.id == tx.id then
                table.remove(self.mempool, i)
                break
            end
        end
    end
    
    self.metrics.blocks_mined = self.metrics.blocks_mined + 1
    self.metrics.transactions_processed = self.metrics.transactions_processed + #selected_transactions
    
    return {
        block_hash = hash,
        block_index = new_block.index,
        nonce = new_block.nonce,
        transactions_included = #selected_transactions,
        block_reward = chain_config.block_reward + total_fees,
        mining_time = os.time() - new_block.timestamp + new_block.nonce * 0.001
    }
end

-- Cálculo de hash do bloco
function blockchain:calculate_block_hash(block)
    local block_string = string.format("%d%d%s%s%d%s",
        block.index,
        block.timestamp,
        block.data,
        block.previous_hash,
        block.nonce,
        block.miner
    )
    
    -- Simula hash SHA-256
    local hash = ""
    for i = 1, 64 do
        hash = hash .. string.format("%x", math.random(0, 15))
    end
    
    return hash
end

-- Validação da blockchain
function blockchain:validate_chain()
    local is_valid = true
    local invalid_blocks = {}
    
    for i = 2, #self.chain do
        local current_block = self.chain[i]
        local previous_block = self.chain[i - 1]
        
        -- Verifica hash anterior
        if current_block.previous_hash ~= previous_block.hash then
            is_valid = false
            table.insert(invalid_blocks, {
                index = current_block.index,
                error = "Invalid previous hash"
            })
        end
        
        -- Verifica hash do bloco
        local calculated_hash = self:calculate_block_hash(current_block)
        if calculated_hash ~= current_block.hash then
            is_valid = false
            table.insert(invalid_blocks, {
                index = current_block.index,
                error = "Invalid block hash"
            })
        end
    end
    
    return {
        is_valid = is_valid,
        chain_length = #self.chain,
        invalid_blocks = invalid_blocks,
        total_difficulty = #self.chain * 1000  -- Simplificado
    }
end

-- Criação de carteira
function blockchain:create_wallet(owner)
    local wallet = {
        address = self:generate_address(),
        private_key = self:generate_private_key(),
        public_key = self:generate_public_key(),
        balance = 0,
        owner = owner,
        created_at = os.time()
    }
    
    self.wallets[wallet.address] = wallet
    
    return {
        address = wallet.address,
        public_key = wallet.public_key,
        balance = wallet.balance,
        owner = owner
    }
end

-- Geração de endereço
function blockchain:generate_address()
    local address = "CYBER"
    for i = 1, 32 do
        address = address .. string.format("%x", math.random(0, 15))
    end
    return address
end

-- Geração de chave privada
function blockchain:generate_private_key()
    local private_key = ""
    for i = 1, 64 do
        private_key = private_key .. string.format("%x", math.random(0, 15))
    end
    return private_key
end

-- Geração de chave pública
function blockchain:generate_public_key()
    local public_key = "04"
    for i = 1, 128 do
        public_key = public_key .. string.format("%x", math.random(0, 15))
    end
    return public_key
end

-- Saldo da carteira
function blockchain:get_balance(address)
    local wallet = self.wallets[address]
    if not wallet then
        return {error = "Wallet not found"}
    end
    
    -- Calcula saldo a partir das transações
    local balance = 0
    for _, block in ipairs(self.chain) do
        for _, tx in ipairs(block.transactions) do
            if tx.to == address then
                balance = balance + tx.amount
            elseif tx.from == address then
                balance = balance - tx.amount
            end
        end
    end
    
    wallet.balance = balance
    
    return {
        address = address,
        balance = balance,
        transactions_count = self:get_transaction_count(address)
    }
end

-- Contagem de transações
function blockchain:get_transaction_count(address)
    local count = 0
    for _, block in ipairs(self.chain) do
        for _, tx in ipairs(block.transactions) do
            if tx.from == address or tx.to == address then
                count = count + 1
            end
        end
    end
    return count
end

-- Contrato inteligente
function blockchain:deploy_smart_contract(code, owner, initial_data)
    local contract = {
        address = self:generate_address(),
        owner = owner,
        code = code,
        storage = initial_data or {},
        created_at = os.time(),
        gas_used = 0,
        transactions = 0
    }
    
    self.smart_contracts[contract.address] = contract
    self.metrics.contracts_deployed = self.metrics.contracts_deployed + 1
    
    return {
        contract_address = contract.address,
        owner = owner,
        created_at = contract.created_at,
        gas_cost = 100000  -- Simulado
    }
end

-- Execução de contrato inteligente
function blockchain:execute_contract(contract_address, function_name, parameters, caller)
    local contract = self.smart_contracts[contract_address]
    if not contract then
        return {error = "Contract not found"}
    end
    
    -- Simula execução
    local execution_result = {
        contract_address = contract_address,
        function_name = function_name,
        parameters = parameters,
        caller = caller,
        result = nil,
        gas_used = math.random(1000, 50000),
        success = true,
        return_value = "execution_successful"
    }
    
    -- Atualiza métricas do contrato
    contract.transactions = contract.transactions + 1
    contract.gas_used = contract.gas_used + execution_result.gas_used
    
    return execution_result
end

-- Processamento principal
function blockchain:process(params)
    local operation = params.operation or "get_balance"
    
    if operation == "create_transaction" then
        return self:create_transaction(params.from, params.to, params.amount, params.data)
    elseif operation == "mine_block" then
        return self:mine_block(params.miner or "system_miner")
    elseif operation == "get_balance" then
        return self:get_balance(params.address)
    elseif operation == "create_wallet" then
        return self:create_wallet(params.owner)
    elseif operation == "deploy_contract" then
        return self:deploy_smart_contract(params.code, params.owner, params.initial_data)
    elseif operation == "execute_contract" then
        return self:execute_contract(params.contract_address, params.function_name, params.parameters, params.caller)
    elseif operation == "validate_chain" then
        return self:validate_chain()
    else
        return {error = "Operação blockchain não reconhecida: " .. operation}
    end
end

-- Estatísticas da rede
function blockchain:get_network_stats()
    local total_transactions = 0
    local total_fees = 0
    
    for _, block in ipairs(self.chain) do
        total_transactions = total_transactions + #block.transactions
        for _, tx in ipairs(block.transactions) do
            total_fees = total_fees + tx.fee
        end
    end
    
    return {
        chain_length = #self.chain,
        total_transactions = total_transactions,
        pending_transactions = #self.mempool,
        active_wallets = #self.wallets,
        deployed_contracts = #self.smart_contracts,
        total_fees_collected = total_fees,
        network_hash_rate = self.metrics.total_hash_power,
        difficulty = chain_config.difficulty_target
    }
end

-- Cleanup do módulo
function blockchain:cleanup()
    print("⛓️ Limpando LunarChain...")
    self.chain = {}
    self.mempool = {}
    self.wallets = {}
    self.smart_contracts = {}
    print("✅ LunarChain limpa!")
end

return blockchain
