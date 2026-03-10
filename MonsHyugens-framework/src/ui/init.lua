-- CyberLua UI Module
-- Interface cyberpunk futurista com elementos visuais inovadores

local ui = {}

-- Temas cyberpunk disponíveis
local themes = {
    neon_blue = {
        primary = "#00ffff",
        secondary = "#ff00ff",
        background = "#0a0a0a",
        text = "#ffffff",
        accent = "#ffff00",
        glow = true
    },
    matrix_green = {
        primary = "#00ff00",
        secondary = "#008800",
        background = "#000000",
        text = "#00ff00",
        accent = "#ffffff",
        glow = true
    },
    cyber_orange = {
        primary = "#ff6600",
        secondary = "#ff0066",
        background = "#1a0a0a",
        text = "#ffaa00",
        accent = "#00ffff",
        glow = true
    },
    quantum_purple = {
        primary = "#9400d3",
        secondary = "#4b0082",
        background = "#0a001a",
        text = "#e6e6fa",
        accent = "#00ffff",
        glow = true
    }
}

-- Componentes UI disponíveis
local components = {
    terminal = "Terminal cyberpunk com glitch effects",
    hud = "Heads-up Display futurista",
    matrix = "Matrix-style rain effect",
    neon = "Neon signs e animações",
    hologram = "Interface holográfica 3D",
    cyberdeck = "Cyberdeck interface复古"
}

-- Inicialização do módulo UI
function ui.init(config)
    local instance = {
        config = config,
        current_theme = themes[config.cyber_theme] or themes.neon_blue,
        active_components = {},
        render_queue = {},
        animations = {},
        effects = {},
        metrics = {
            frames_rendered = 0,
            effects_applied = 0,
            interactions = 0
        }
    }
    
    print("🎨 LunarUI inicializada - Interface Lunar Ativada")
    
    return setmetatable(instance, {__index = ui})
end

-- Criação de terminal cyberpunk
function ui:create_terminal(options)
    options = options or {}
    
    local terminal = {
        type = "terminal",
        title = options.title or "CYBER_TERMINAL_v2.0",
        width = options.width or 80,
        height = options.height or 24,
        font = options.font or "monospace",
        theme = options.theme or self.current_theme,
        glitch_enabled = options.glitch or true,
        scanlines = options.scanlines or true,
        text_buffer = {},
        cursor = {x = 1, y = 1, visible = true},
        history = {}
    }
    
    table.insert(self.active_components, terminal)
    
    return {
        component_id = #self.active_components,
        type = "terminal",
        dimensions = {width = terminal.width, height = terminal.height},
        theme = terminal.theme.primary,
        status = "active"
    }
end

-- Renderização de texto com efeitos cyberpunk
function ui:render_cyber_text(text, effect, component_id)
    local component = self.active_components[component_id]
    if not component then
        return {error = "Component not found"}
    end
    
    local rendered_text = text
    local effects_applied = {}
    
    if effect == "glitch" then
        -- Efeito glitch
        local glitch_chars = {"@", "#", "$", "%", "&", "*"}
        for i = 1, #text do
            if math.random() < 0.1 then
                rendered_text = string.sub(rendered_text, 1, i-1) .. 
                              glitch_chars[math.random(#glitch_chars)] .. 
                              string.sub(rendered_text, i+1)
            end
        end
        table.insert(effects_applied, "glitch")
        
    elseif effect == "matrix" then
        -- Efeito Matrix
        rendered_text = ""
        for i = 1, #text do
            local char = string.sub(text, i, i)
            if math.random() < 0.3 then
                rendered_text = rendered_text .. string.char(0x30A0 + math.random(96))  -- Caracteres japoneses
            else
                rendered_text = rendered_text .. char
            end
        end
        table.insert(effects_applied, "matrix_rain")
        
    elseif effect == "neon" then
        -- Efeito neon
        rendered_text = "⚡" .. text .. "⚡"
        table.insert(effects_applied, "neon_glow")
        
    elseif effect == "hologram" then
        -- Efeito holográfico
        rendered_text = string.rep(" ", math.random(0, 2)) .. text .. string.rep(" ", math.random(0, 2))
        table.insert(effects_applied, "holographic_flicker")
    end
    
    self.metrics.effects_applied = self.metrics.effects_applied + 1
    
    return {
        original_text = text,
        rendered_text = rendered_text,
        effects = effects_applied,
        theme_colors = component.theme,
        timestamp = os.time()
    }
end

-- Criação de HUD (Heads-up Display)
function ui:create_hud(options)
    options = options or {}
    
    local hud = {
        type = "hud",
        elements = {
            health_bar = {value = 100, max = 100, color = "#00ff00"},
            energy_bar = {value = 75, max = 100, color = "#00ffff"},
            radar = {range = 100, objects = {}},
            minimap = {zoom = 1.0, center = {x = 0, y = 0}},
            notifications = {},
            system_status = {
                cpu = math.random(20, 80),
                memory = math.random(30, 70),
                network = math.random(0, 100)
            }
        },
        theme = options.theme or self.current_theme,
        transparency = options.transparency or 0.8,
        animations_enabled = options.animations or true
    }
    
    table.insert(self.active_components, hud)
    
    return {
        component_id = #self.active_components,
        type = "hud",
        elements_count = 6,
        theme = hud.theme.primary,
        transparency = hud.transparency
    }
end

-- Animações cyberpunk
function ui:create_animation(type, duration, target)
    local animation = {
        id = math.random(10000, 99999),
        type = type,
        duration = duration or 1000,
        target = target,
        start_time = os.time(),
        current_frame = 0,
        total_frames = 60,
        easing = "ease-in-out"
    }
    
    if type == "pulse" then
        animation.frames = self:generate_pulse_frames(animation.total_frames)
    elseif type == "slide" then
        animation.frames = self:generate_slide_frames(animation.total_frames)
    elseif type == "fade" then
        animation.frames = self:generate_fade_frames(animation.total_frames)
    elseif type == "glitch" then
        animation.frames = self:generate_glitch_frames(animation.total_frames)
    elseif type == "matrix_rain" then
        animation.frames = self:generate_matrix_frames(animation.total_frames)
    end
    
    table.insert(self.animations, animation)
    
    return {
        animation_id = animation.id,
        type = type,
        duration = animation.duration,
        frames_count = animation.total_frames,
        target = target
    }
end

-- Geração de frames para animação pulse
function ui:generate_pulse_frames(total_frames)
    local frames = {}
    for i = 1, total_frames do
        local intensity = math.sin((i / total_frames) * 2 * math.pi) * 0.5 + 0.5
        table.insert(frames, {
            opacity = intensity,
            scale = 1.0 + intensity * 0.2,
            glow_intensity = intensity
        })
    end
    return frames
end

-- Geração de frames para animação slide
function ui:generate_slide_frames(total_frames)
    local frames = {}
    for i = 1, total_frames do
        local progress = i / total_frames
        table.insert(frames, {
            x_offset = progress * 100,
            y_offset = 0,
            rotation = 0
        })
    end
    return frames
end

-- Geração de frames para animação fade
function ui:generate_fade_frames(total_frames)
    local frames = {}
    for i = 1, total_frames do
        local progress = i / total_frames
        table.insert(frames, {
            opacity = progress,
            brightness = progress
        })
    end
    return frames
end

-- Geração de frames para animação glitch
function ui:generate_glitch_frames(total_frames)
    local frames = {}
    for i = 1, total_frames do
        table.insert(frames, {
            channel_offset = {
                r = math.random(-5, 5),
                g = math.random(-5, 5),
                b = math.random(-5, 5)
            },
            noise_level = math.random(0, 0.3),
            pixelation = math.random(0, 5)
        })
    end
    return frames
end

-- Geração de frames para Matrix rain
function ui:generate_matrix_frames(total_frames)
    local frames = {}
    for i = 1, total_frames do
        local drops = {}
        for j = 1, 20 do
            table.insert(drops, {
                x = math.random(0, 80),
                y = math.random(0, 24),
                char = string.char(0x30A0 + math.random(96)),
                speed = math.random(1, 5),
                fade = math.random(0.1, 1.0)
            })
        end
        table.insert(frames, {matrix_drops = drops})
    end
    return frames
end

-- Renderização de componente
function ui:render_component(component_id)
    local component = self.active_components[component_id]
    if not component then
        return {error = "Component not found"}
    end
    
    self.metrics.frames_rendered = self.metrics.frames_rendered + 1
    
    if component.type == "terminal" then
        return self:render_terminal(component)
    elseif component.type == "hud" then
        return self:render_hud(component)
    else
        return {error = "Unknown component type"}
    end
end

-- Renderização de terminal
function ui:render_terminal(terminal)
    local output = {}
    
    -- Cabeçalho cyberpunk
    table.insert(output, string.rep("═", terminal.width))
    table.insert(output, string.format("║ %-" .. (terminal.width-4) .. "s ║", terminal.title))
    table.insert(output, string.rep("═", terminal.width))
    
    -- Conteúdo do terminal
    for i = 1, terminal.height - 4 do
        local line = terminal.text_buffer[i] or string.rep(" ", terminal.width)
        table.insert(output, "║" .. line .. "║")
    end
    
    -- Rodapé
    table.insert(output, string.rep("═", terminal.width))
    
    return {
        component_type = "terminal",
        rendered_lines = output,
        cursor_position = terminal.cursor,
        theme = terminal.theme,
        effects = {
            glitch = terminal.glitch_enabled,
            scanlines = terminal.scanlines
        }
    }
end

-- Renderização de HUD
function ui:render_hud(hud)
    local elements_rendered = {}
    
    -- Renderiza cada elemento do HUD
    for name, element in pairs(hud.elements) do
        if name == "health_bar" then
            elements_rendered.health_bar = {
                value = element.value,
                max = element.max,
                percentage = (element.value / element.max) * 100,
                color = element.color,
                visual = string.rep("█", math.floor((element.value / element.max) * 20)) .. 
                        string.rep("░", 20 - math.floor((element.value / element.max) * 20))
            }
        elseif name == "energy_bar" then
            elements_rendered.energy_bar = {
                value = element.value,
                max = element.max,
                percentage = (element.value / element.max) * 100,
                color = element.color,
                visual = string.rep("█", math.floor((element.value / element.max) * 20)) .. 
                        string.rep("░", 20 - math.floor((element.value / element.max) * 20))
            }
        elseif name == "system_status" then
            elements_rendered.system_status = {
                cpu_usage = element.cpu .. "%",
                memory_usage = element.memory .. "%",
                network_signal = element.network .. "%",
                status_bars = {
                    cpu = string.rep("█", math.floor(element.cpu / 5)) .. string.rep("░", 20 - math.floor(element.cpu / 5)),
                    memory = string.rep("█", math.floor(element.memory / 5)) .. string.rep("░", 20 - math.floor(element.memory / 5)),
                    network = string.rep("█", math.floor(element.network / 5)) .. string.rep("░", 20 - math.floor(element.network / 5))
                }
            }
        end
    end
    
    return {
        component_type = "hud",
        elements = elements_rendered,
        theme = hud.theme,
        transparency = hud.transparency,
        timestamp = os.time()
    }
end

-- Interação com UI
function ui:interact(component_id, interaction_type, params)
    local component = self.active_components[component_id]
    if not component then
        return {error = "Component not found"}
    end
    
    self.metrics.interactions = self.metrics.interactions + 1
    
    if interaction_type == "click" then
        return self:handle_click(component, params)
    elseif interaction_type == "key_press" then
        return self:handle_key_press(component, params)
    elseif interaction_type == "hover" then
        return self:handle_hover(component, params)
    else
        return {error = "Unknown interaction type"}
    end
end

-- Manipulação de clique
function ui:handle_click(component, params)
    return {
        interaction_type = "click",
        component = component.type,
        position = params.position or {x = 0, y = 0},
        action = "click_processed",
        effect = "click_animation_triggered"
    }
end

-- Manipulação de teclado
function ui:handle_key_press(component, params)
    if component.type == "terminal" then
        local key = params.key or ""
        
        if key == "ENTER" then
            -- Processa comando
            table.insert(component.history, table.concat(component.text_buffer, ""))
            component.text_buffer = {}
            component.cursor.x = 1
            component.cursor.y = 1
        elseif key == "BACKSPACE" then
            -- Remove último caractere
            local current_line = component.text_buffer[component.cursor.y] or ""
            component.text_buffer[component.cursor.y] = string.sub(current_line, 1, -2)
            component.cursor.x = math.max(1, component.cursor.x - 1)
        else
            -- Adiciona caractere
            local current_line = component.text_buffer[component.cursor.y] or ""
            component.text_buffer[component.cursor.y] = current_line .. key
            component.cursor.x = component.cursor.x + 1
        end
        
        return {
            interaction_type = "key_press",
            key = key,
            cursor_position = component.cursor,
            buffer_updated = true
        }
    end
    
    return {
        interaction_type = "key_press",
        key = params.key,
        processed = false
    }
end

-- Manipulação de hover
function ui:handle_hover(component, params)
    return {
        interaction_type = "hover",
        position = params.position or {x = 0, y = 0},
        effect = "glow_enhanced",
        tooltip = "Cyber element detected"
    }
end

-- Processamento principal
function ui:process(params)
    local operation = params.operation or "render"
    
    if operation == "create_terminal" then
        return self:create_terminal(params.options)
    elseif operation == "create_hud" then
        return self:create_hud(params.options)
    elseif operation == "render" then
        return self:render_component(params.component_id)
    elseif operation == "animate" then
        return self:create_animation(params.type, params.duration, params.target)
    elseif operation == "interact" then
        return self:interact(params.component_id, params.interaction_type, params.params)
    elseif operation == "render_text" then
        return self:render_cyber_text(params.text, params.effect, params.component_id)
    else
        return {error = "UI operation not recognized: " .. operation}
    end
end

-- Estatísticas de renderização
function ui:get_render_stats()
    local active_animations = 0
    for _, anim in ipairs(self.animations) do
        if os.time() - anim.start_time < (anim.duration / 1000) then
            active_animations = active_animations + 1
        end
    end
    
    return {
        components_active = #self.active_components,
        frames_rendered = self.metrics.frames_rendered,
        effects_applied = self.metrics.effects_applied,
        interactions_count = self.metrics.interactions,
        active_animations = active_animations,
        current_theme = self.current_theme.primary,
        render_fps = 60  -- Simulado
    }
end

-- Cleanup do módulo
function ui:cleanup()
    print("🎨 Limpando LunarUI...")
    self.active_components = {}
    self.render_queue = {}
    self.animations = {}
    self.effects = {}
    print("✅ LunarUI limpa!")
end

return ui
