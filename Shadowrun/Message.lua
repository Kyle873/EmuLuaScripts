Message =
{
    FadeTime = 60,
    
    Text = "",
    Timer = 0,
    Color = 0,
    BackgroundColor = 0,
    
    X = 0,
    Y = 0
}

function Help()
    local help =
    {
        "Welcome to ShadowEdit!",
        "",
        "Menu Keys:",
        Input.MenuKey .. ": Open/Close Menu",
        Input.UpKey .. "/" .. Input.DownKey .. "/" .. Input.LeftKey .. "/" .. Input.RightKey .. ": Move Cursor",
        Input.UseKey .. ": Enter Sub-menu/Activate Menu Option",
        Input.MenuKey .. ": Open/Close Menu",
        Input.BackKey .. ": Return to Main Menu",
        Input.SwitchCharKey .. ": Switch Active Character",
        Input.FreezeKey .. ": Freeze Selected Option",
        "",
        "Special Keys:",
        Input.SellFilesKey .. ": Sell All Datafiles",
    }
    
    local message = ""
    
    for i, v in ipairs(help) do
        message = message .. v .. "\n"
    end
    
    message = bizstring.remove(message, #message - 1, 1)
    
    if ReadValue(0, DataType.Byte) ~= 0xFF then
        NewMessage(message, 1000, Color.White, Color.Black, 0, 0)
        WriteValue(0, DataType.Byte, 0xFF)
    end
end

function NewMessage(text, time, color, backgroundColor, x, y)
    Message.Text = text
    Message.Timer = time
    Message.Color = color
    Message.BackgroundColor = backgroundColor or Color.Background
    Message.X = x or 0
    Message.Y = y or 213
end

function UpdateMessage()
    local function ModAlpha(color)
        return bit.band(color, 0x00FFFFFF) + bit.lshift((bit.rshift(color, 24) / Message.FadeTime) * (Message.FadeTime - math.abs(Message.Timer)), 24)
    end
    
    if Message.Timer > -Message.FadeTime then
        local width = 0
        local height = 2
        local messages = bizstring.split(Message.Text, "\n")
        local outlineColor = Color.Outline
        local backgroundColor = Message.BackgroundColor
        local messageColor = Message.Color
        
        for i, v in ipairs(messages) do
            if string.len(v) > width then
                width = string.len(v)
            end
            
            height = height + 8.4
        end
        
        if Message.Timer <= 0 then
            outlineColor = ModAlpha(Color.Outline)
            backgroundColor = ModAlpha(Message.BackgroundColor)
            messageColor = ModAlpha(Message.Color)
        end
        
        gui.drawRectangle(Message.X, Message.Y, 4 + width * 4, height, outlineColor, backgroundColor)
        gui.pixelText(Message.X + 2, Message.Y + 2, Message.Text, messageColor, 0)
        
        Message.Timer = Message.Timer - 1
    end
end
