KLib.String = {}

function KLib.String.Key(key)
    if type(key) == "string" and string.match(key, "^[_%a][_%a%d]*$") then
        return key
    else
        return "[" .. KLib.String.Value(key) .. "]"
    end
end

function KLib.String.Value(value)
    if type(value) == "string" then
        value = string.gsub(value, "\n", "\\n")
        
        if string.match(string.gsub(value, "[^'\"]", ""), '^"+$') then
            return "'" .. value .. "'"
        end
        
        return '"' .. string.gsub(value, '"', '\\"') .. '"'
    else
        return type(value) == "table" and KLib.String.Table(value) or tostring(value)
    end
end

function KLib.String.Table(t)
    local result, done = {}, {}
    
    for k, v in ipairs(t) do
        table.insert(result, KLib.String.Value(v))
        done[k] = true
    end
    
    for k, v in pairs(t) do
        if not done[k] then
            table.insert(result, KLib.String.Key(k) .. " = " .. KLib.String.Value(v))
        end
    end
    
    return "{\n" .. table.concat(result, ",\n") .. "\n}"
end

function KLib.String.OnOff(bool)
    if bool then
        return "On"
    elseif not b then
        return "Off"
    else
        return "Unknown"
    end
end

function KLib.String.ShortenNumber(amount, places)
    local suffix = ""
    
    if amount >= 1000000000000 then
        amount = amount / 1000000000000
        suffix = "T"
    elseif amount >= 1000000000 then
        amount = amount / 1000000000
        suffix = "B"
    elseif amount >= 1000000 then
        amount = amount / 1000000
        suffix = "M"
    elseif amount >= 1000 then
        amount = amount / 1000
        suffix = "K"
    end
    
    return string.format("%.2f", amount) .. suffix
end

function KLib.String.CommaNumber(amount)
    local formatted = amount

    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        
        if k == 0 then
            break
        end
    end
    
    return formatted
end
