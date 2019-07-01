dofile("KLib/KLib.lua")

Address =
{
    Level = 0x0C0E0A,
    EXP = 0x0C0E00,
    HP = 0x0B8A2C,
    MaxHP = 0x0B8A3C,
    PE = 0x0B8A2A,
    MaxPE = 0x0B8A4A,
    Offense = 0x0C0E2A,
    Defense = 0x0C0E2C,
    PEnergy = 0x0C0E2E,
    StatusRecover = 0x0C0E30,
    ActiveTime = 0x0C0E32,
    ItemCapacity = 0x0C0E34,
    ItemSlots = 0x0C0E0C,
    BonusPoints = 0x0C0E10,
    
    AT = 0x0B8A30,
    
    Items = 0x0C0E48,
    Equipment = 0x0C0EB0,
    ItemStorage = 0x0C1EB8,
    EquipmentStorage = 0x0C1F80,
    
    Junk = 0x0A78B0,
    
    MenuFlags = 0x09CEF0,
    PEFlags = 0x0C0E24,
    
    PETimer = 0x0B8A28,
    
    CurrentRoom = 0x09D280
}

MaxItems = 50
MaxEquipment = 128
MaxItemStorage = 100
MaxEquipmentStorage = 80
MaxAbilitySlots = 10
MaxEquipStructSize = 32

ItemTypes =
{
    [0x00] = "Item",
    [0x01] = "Equipment",
    [0x02] = "Crate"
}

EquipmentTypes =
{
    [0x00] = "None",
    [0x01] = "Pistol",
    [0x02] = "Shotgun",
    [0x03] = "SMG",
    [0x04] = "Rifle",
    [0x05] = "Grenade Launcher",
    [0x06] = "Rocket Launcher",
    [0x07] = "DNA",
    [0x08] = "Melee",
    [0x09] = "Armor"
}

Items =
{
    [0x00] = "Nothing",
    [0x01] = "Ammo +6",
    [0x02] = "Ammo +15",
    [0x03] = "Ammo +30",
    [0x04] = "DNA Bullets",
    [0x05] = "Rocket",
    [0x06] = "Medicine 1",
    [0x07] = "Medicine 2",
    [0x08] = "Medicine 3",
    [0x09] = "Medicine 4",
    [0x0A] = "Full Recovery",
    [0x0B] = "Super Junk",
    [0x0C] = "Duper Junk",
    [0x0D] = "Cure-P",
    [0x0E] = "Cure-D",
    [0x0F] = "Cure-C",
    [0x10] = "Cure-M",
    [0x11] = "Full Cure",
    [0x12] = "Revive",
    [0x13] = "Defense +1",
    [0x14] = "Junk",
    [0x15] = "Trading Card",
    [0x16] = "Tool",
    [0x17] = "Super Tool",
    [0x18] = "Dummy",
    [0x19] = "Dummy",
    [0x1A] = "Ammo Crate",
    [0x1B] = "Rocket Crate",
    [0x1C] = "Maeda Crate",
    [0x1D] = "Offense +1",
    [0x1E] = "Offense +2",
    [0x1F] = "Offense +3",
    [0x20] = "Offense +4",
    [0x21] = "Range +1",
    [0x22] = "Range +2",
    [0x23] = "Range +3",
    [0x24] = "Range +4",
    [0x25] = "Bullet Cap +1",
    [0x26] = "Bullet Cap +2",
    [0x27] = "Bullet Cap +3",
    [0x28] = "Bullet Cap +4",
    [0x29] = "Defense +1",
    [0x2A] = "Defense +2",
    [0x2B] = "Defense +3",
    [0x2C] = "Defense +4",
    [0x2D] = "CR Evade +1",
    [0x2E] = "CR Evade +2",
    [0x2F] = "CR Evade +3",
    [0x30] = "CR Evade +4",
    [0x31] = "PE +1",
    [0x32] = "PE +2",
    [0x33] = "PE +3",
    [0x34] = "PE +4",
    [0x35] = "Tool Kit",
    [0x36] = "Super Tool Kit",
    [0x37] = "Mod Permit",
    [0x38] = "Chrysler Key 1",
    [0x39] = "Chrysler Key 2",
    [0x3A] = "Chrysler Key 3",
    [0x3B] = "Chrysler Key 4",
    [0x3C] = "Chrysler Key 5",
    [0x3D] = "Chrysler Key 6",
    [0x3E] = "Chrysler Key 7",
    [0x3F] = "Club 1",
    [0x40] = "Club 2",
    [0x41] = "Club 3",
    [0x42] = "Club 4",
    [0x43] = "Club 5",
    [0x44] = "M84F",
    [0x45] = "M9",
    [0x46] = "M9-2",
    [0x47] = "M9-3",
    [0x48] = "M8000",
    [0x49] = "M96",
    [0x4A] = "M96R",
    [0x4B] = "P220",
    [0x4C] = "P220-2",
    [0x4D] = "P228",
    [0x4E] = "P226",
    [0x4F] = "P229",
    [0x50] = "M1911A1",
    [0x51] = "M1911A2",
    [0x52] = "M1911A3",
    [0x53] = "M1911A4",
    [0x54] = "M1911A5",
    [0x55] = "P8",
    [0x56] = "USP",
    [0x57] = "USP-2",
    [0x58] = "USP-3",
    [0x59] = "Mark 23",
    [0x5A] = "G19",
    [0x5B] = "G23",
    [0x5C] = "G22",
    [0x5D] = "G20",
    [0x5E] = "M712",
    [0x5F] = "PPK",
    [0x60] = "AM44",
    [0x61] = "Maeda's Gun",
    [0x62] = "PPSh41",
    [0x63] = "SP1C",
    [0x64] = "USP-TU",
    [0x65] = "AK-47",
    [0x66] = "DE50AE7",
    [0x67] = "Debug SMG",
    [0x68] = "M870",
    [0x69] = "M870-2",
    [0x6A] = "M500",
    [0x6B] = "M500-2",
    [0x6C] = "Maverick",
    [0x6D] = "S12",
    [0x6E] = "M10B",
    [0x6F] = "M11",
    [0x70] = "M10",
    [0x71] = "MP5K",
    [0x72] = "MP5PDW",
    [0x73] = "MP5A5",
    [0x74] = "MP5SD6",
    [0x75] = "Micro UZ",
    [0x76] = "Mini UZ",
    [0x77] = "Full UZ",
    [0x78] = "P90",
    [0x79] = "M16A1",
    [0x7A] = "M16A2",
    [0x7B] = "SG550",
    [0x7C] = "SAR",
    [0x7D] = "G3A3",
    [0x7E] = "Type 64",
    [0x7F] = "XM177E2",
    [0x80] = "PSG-1",
    [0x81] = "FA-MAS",
    [0x82] = "MAG",
    [0x83] = "M203",
    [0x84] = "M203-2",
    [0x85] = "M203-3",
    [0x86] = "M203-4",
    [0x87] = "M203-5",
    [0x88] = "M203-6",
    [0x89] = "M79",
    [0x8A] = "M79-2",
    [0x8B] = "M79-3",
    [0x8C] = "M79-4",
    [0x8D] = "M79-5",
    [0x8E] = "M79-6",
    [0x8F] = "HK40",
    [0x90] = "AT4",
    [0x91] = "AT4-1",
    [0x92] = "LAW80",
    [0x93] = "Maeda's Gun w/Bullets",
    [0x94] = "M92F",
    [0x95] = "Dress",
    [0x96] = "N Vest",
    [0x97] = "N Protector",
    [0x98] = "N Jacket",
    [0x99] = "N Suit",
    [0x9A] = "N Armor",
    [0x9B] = "Kv Vest 1",
    [0x9C] = "Kv Protector",
    [0x9D] = "Kv Jacket",
    [0x9E] = "Kv Suit 1",
    [0x9F] = "Kv Armor 1",
    [0xA0] = "Sp Vest 1",
    [0xA1] = "Sp Vest 2",
    [0xA2] = "Sp Protector",
    [0xA3] = "Sp Jacket",
    [0xA4] = "Sp Suit 1",
    [0xA5] = "Sp Suit 2",
    [0xA6] = "Sp Armor 1",
    [0xA7] = "Sp Armor 2",
    [0xA8] = "Sv Vest 1",
    [0xA9] = "Sv Vest 2",
    [0xAA] = "Sv Protector",
    [0xAB] = "Sv Jacket",
    [0xAC] = "Sv Suit 1",
    [0xAD] = "Sv Suit 2",
    [0xAE] = "Sv Armor 1",
    [0xAF] = "Sv Armor 2",
    [0xB0] = "Cr Vest 1",
    [0xB1] = "Cr Vest 2",
    [0xB2] = "Cr Protector",
    [0xB3] = "Cr Jacket",
    [0xB4] = "Cr Suit 1",
    [0xB5] = "Cr Suit 2",
    [0xB6] = "Cr Armor 1",
    [0xB7] = "Cr Armor 2",
    [0xB8] = "B Vest 1",
    [0xB9] = "B Vest 2",
    [0xBA] = "B Protector",
    [0xBB] = "B Jacket 1",
    [0xBC] = "B Jacket 2",
    [0xBD] = "B Suit 1",
    [0xBE] = "B Suit 2",
    [0xBF] = "B Armor",
    [0xC0] = "Cm Vest 1",
    [0xC1] = "Cm Vest 2",
    [0xC2] = "Cm Protector",
    [0xC3] = "Cm Jacket",
    [0xC4] = "Cm Suit 1",
    [0xC5] = "Cm Armor 1",
    [0xC6] = "Cm Armor 2",
    [0xC7] = "Cm Suit 2",
    [0xC8] = "Theater Key",
    [0xC9] = "Rehearse Key",
    [0xCA] = "Zoo Key",
    [0xCB] = "Narita",
    [0xCC] = "Mayoke",
    [0xCD] = "Hamaya",
    [0xCE] = "Fuse 1",
    [0xCF] = "Fuse 2",
    [0xD0] = "Fuse 3",
    [0xD1] = "Autopsy Key",
    [0xD2] = "Blue Cardkey",
    [0xD3] = "Green Cardkey",
    [0xD4] = "Pump Key",
    [0xD5] = "Klamp Key",
    [0xD6] = "Storage Key",
    [0xD7] = "Locker Key",
    [0xD8] = "Weapon Memo",
    [0xD9] = "Medal",
    [0xDA] = "Elevator Key",
    [0xDB] = "Gate Key",
    [0xDC] = "Warehouse Key",
    [0xDD] = "GSP T Card",
    [0xDE] = "P38 T Card",
    [0xDF] = "Bhawk T Card",
    [0xE0] = "Kasul T Card",
    [0xE1] = "PPKS T Card",
    [0xE2] = "M1 T Card",
    [0xE3] = "MK5 T Card",
    [0xE4] = "MP44 T Card",
    [0xE5] = "BAR T Card",
    [0xE6] = "MG42 T Card",
    [0xE7] = "M29 T Card",
    [0xE8] = "M73 T Card",
    [0xE9] = "Type38 T Card",
    [0xEA] = "Type3 T Card",
    [0xEB] = "Eagle T Card"
}

Crates =
{
    [0x00] = "Ammo Crate",
    [0x01] = "Rocket Crate",
    [0x02] = "Maeda Crate",
    [0x03] = "Ammo Crate (Storage)",
    [0x04] = "Rocket Crate (Storage)",
    [0x05] = "Maeda Crate (Storage)"
}

WeaponAbilities =
{
    wrap = 32,
    
    [0x00] = "None",
    [0x01] = "Rate of Fire: 2",
    [0x02] = "Rate of Fire: 3",
    [0x03] = "Rate of Fire: 5",
    [0x04] = "Rate of Fire: 7",
    [0x05] = "Rate of Fire: 10",
    [0x06] = "Random Rate of Fire: 1.5",
    [0x07] = "Burst: Spray Multiple Targets",
    [0x08] = "Attack All Enemies w/Rate of Fire",
    [0x09] = "Add Heat Effect to Bullets",
    [0x0A] = "Add Frost Effect to Bullets",
    [0x0B] = "Add Cyanide to Bullets",
    [0x0C] = "Add Acid Effect to Bullets",
    [0x0D] = "Add Tranquizler to Bullets",
    [0x0E] = "Counterattack Enemy",
    [0x0F] = "Quickdraw: First Attack",
    [0x10] = "Steal Items, but Halves Attack Power",
    [0x11] = "Steal During Attack",
    [0x12] = "Critical Percentage Increases",
    [0x13] = "Enter 2 Commands",
    [0x14] = "Enter 3 Commands",
    [0x15] = "Resist Poison",
    [0x16] = "Resist Stiffness",
    [0x17] = "Resist Darkness",
    [0x18] = "Decreases Items Stolen",
    [0x19] = "Resist Confusion",
    [0x1A] = "Uses Medicine When HP is Low",
    [0x1B] = "Use Cures to Remove Status",
    [0x1C] = "Increases Item Capacity by 1",
    [0x1D] = "Increases Item Capacity by 2",
    [0x1E] = "Increases Item Capacity by 4",
    [0x1F] = "Increases Max HP"
}

ArmorAbilities =
{
    wrap = 32,
    
    [0x00] = "None",
    [0x01] = "Resist Poison",
    [0x02] = "Resist Stiffness",
    [0x03] = "Resist Darkness",
    [0x04] = "Decreases Items Stolen",
    [0x05] = "Resist Confusion",
    [0x06] = "Uses Medicine When HP is Low",
    [0x07] = "Use Cures to Remove Status",
    [0x08] = "Increases Item Capacity by 1",
    [0x09] = "Increases Item Capacity by 2",
    [0x0A] = "Increases Item Capacity by 4",
    [0x0B] = "Increases Max HP",
    [0x0C] = "Increases Attack Power",
    [0x0D] = "Active Time Recharges Slower",
    [0x0E] = "PE Light: PE Burden Decreases",
    [0x0F] = "Decreases Attack Power"
}

PEs =
{
    "Heal 1",
    "Heal 2",
    "Heal 3",
    "Detox",
    "Medic",
    "Barrier",
    "Energy Shot",
    "Scan",
    "Slow",
    "Haste",
    "Confuse",
    "Gene Heal",
    "Preraise",
    "Dummy",
    "Dummy",
    "Dummy",
    "Dummy",
    "Dummy",
    "Full Recover",
    "Liberate"
}

--[[
KLib.Monitor.Variable("AT", Address.AT, "s16_le")
KLib.Monitor.Variable("PE", Address.PE, "s16_le")
KLib.Monitor.Variable("Max PE", Address.MaxPE, "s16_le")
KLib.Monitor.Variable("PE Timer", Address.PETimer, "u16_le")
KLib.Monitor.Variable("PE Flags", Address.PEFlags, "u16_le")
KLib.Monitor.Variable("Junk", Address.Junk, "u16_le")
--]]

function CreateMenu()
    KLib.Menu.Color(KLib.Color.White, KLib.Color.Make(0, 0, 0, 192))
    
    KLib.Menu.Page("Parasite Eve\r")
    
    KLib.Menu.SubPage("Stats", CreateStatsPage)
    KLib.Menu.SubPage("Items", CreateItemsPage, UpdateItemsPage, { type = "inventory", address = Address.Items, max = MaxItems })
    KLib.Menu.SubPage("Equipment", CreateEquipmentPage, UpdateEquipmentPage)
    KLib.Menu.SubPage("Item Storage", CreateItemsPage, UpdateItemsPage, { type = "item_storage", address = Address.ItemStorage, max = MaxItemStorage })
    KLib.Menu.SubPage("Equipment Storage", CreateItemsPage, UpdateItemsPage, { type = "equipment_storage", address = Address.EquipmentStorage, max = MaxEquipmentStorage })
    KLib.Menu.SubPage("Battle", CreateBattlePage)
    KLib.Menu.SubPage("World", CreateWorldPage)
    
    KLib.Menu.Separator()
    
end

function CreateStatsPage()
    KLib.Menu.Field("Level", Address.Level, "byte", 1, 99)
    KLib.Menu.Field("EXP", Address.EXP, "s32_le", 0, 999999)
    KLib.Menu.Field("HP", Address.HP, "s16_le", 0, 999)
    KLib.Menu.Field("Max HP", Address.MaxHP, "s16_le", 0, 999)
    KLib.Menu.Field("PE", Address.PE, "s16_le")
    KLib.Menu.Field("Max PE", Address.MaxPE, "s16_le")
    KLib.Menu.Field("Offense", Address.Offense, "s16_le", 1, 999)
    KLib.Menu.Field("Defense", Address.Defense, "s16_le", 1, 999)
    KLib.Menu.Field("P.Energy", Address.PEnergy, "s16_le", 1, 999)
    KLib.Menu.Field("Status Recover", Address.StatusRecover, "s16_le", 1, 999)
    KLib.Menu.Field("Active Time", Address.ActiveTime, "s16_le", 1, 999)
    KLib.Menu.Field("Item Capacity", Address.ItemCapacity, "s16_le", 1, 999)
    KLib.Menu.Field("Item Slots", Address.ItemSlots, "byte", 1, 50)
    KLib.Menu.Field("Bonus Points", Address.BonusPoints, "s32_le", 0, 99999)
    KLib.Menu.Bitfield("Known PE", Address.PEFlags, "s32_le", PEs)
end

function CreateItemsPage(data)
    for i = 0, data.max - 1 do
        KLib.Menu.Enum("Type " .. i + 1, data.address + (i * 2) + 1, "byte", ItemTypes)
        KLib.Menu.Field("Item " .. i + 1, data.address + (i * 2), "byte").onUse = function(self)
            if data.type == "inventory" then
                TransferItem("inventory", self.address)
            else
                TransferItem("storage", self.address)
            end
        end
    end
end

function UpdateItemsPage(page)
    for i = 2, #page.items, 2 do
        local item = page.items[i]
        local id = KLib.Memory.ReadByte(page.items[i].address)
        local type = KLib.Memory.ReadByte(page.items[i - 1].address)
        
        if type == 0 then
            item.type = "enum"
            item.suffix = ""
            item.values = Items
        elseif type == 1 then
            local address = Address.Equipment + (KLib.Memory.ReadByte(page.items[i].address) * MaxEquipStructSize)
            local params = 
            {
                KLib.Memory.ReadByte(address + 3),
                KLib.Memory.ReadByte(address + 4),
                KLib.Memory.ReadByte(address + 5),
                KLib.Memory.ReadShort(address + 10),
                KLib.Memory.ReadShort(address + 12),
                KLib.Memory.ReadShort(address + 14)
            }
            
            item.type = "field"
            
            item.suffix = " (" .. GetItemName(id, type) .. ") ["
            for i = 1, #params do
                item.suffix = item.suffix .. params[i] .. "/"
            end
            item.suffix = item.suffix:sub(1, -2) .. "]"
            
            item.values = {}
        elseif type == 2 then
            item.type = "enum"
            item.suffix = ""
            item.values = Crates
        end
    end
end

function CreateEquipmentPage()
    KLib.Menu.Offset(nil, MaxEquipment, MaxEquipStructSize)
    
    KLib.Menu.Enum("ID", Address.Equipment, "byte", Items)
    KLib.Menu.Enum("Type", Address.Equipment + 2, "byte", EquipmentTypes)
    KLib.Menu.Field("Flags", Address.Equipment + 1, "byte")
    KLib.Menu.Field("Clip", Address.Equipment + 6, "s16_le")
    KLib.Menu.Field("Unknown", Address.Equipment + 8, "s16_le")
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Parameters", KLib.Color.Red, true)
    KLib.Menu.Field("Base 1", Address.Equipment + 3, "byte")
    KLib.Menu.Field("Base 2", Address.Equipment + 4, "byte")
    KLib.Menu.Field("Base 3", Address.Equipment + 5, "byte")
    KLib.Menu.Field("Plus 1", Address.Equipment + 10, "s16_le", 0, 999)
    KLib.Menu.Field("Plus 2", Address.Equipment + 12, "s16_le", 0, 999)
    KLib.Menu.Field("Plus 3", Address.Equipment + 14, "s16_le", 0, 999)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Abilities", KLib.Color.Green, true)
    KLib.Menu.Field("Slots", Address.Equipment + 16, "byte")
    KLib.Menu.EnumGroup(MaxAbilitySlots, "Slot", Address.Equipment + 17, "byte", WeaponAbilities)
    
    KLib.Menu.Separator()
    KLib.Menu.Text("Unknown", KLib.Color.Yellow, true)
    KLib.Menu.FieldGroup(5, "Unknown", Address.Equipment + 27, "byte")
end

function UpdateEquipmentPage(page)
    local id = KLib.Memory.ReadByte(Address.Equipment + ((KLib.Menu.OffsetIndex - 1) * MaxEquipStructSize))
    
    for i = #page.items, #page.items - MaxAbilitySlots, -1 do
        local item = page.items[i]
        
        if IsWeapon(id) then
            item.values = WeaponAbilities
        elseif IsArmor(id) then
            item.values = ArmorAbilities
        end
    end
end

function CreateBattlePage()
    KLib.Menu.Field("AT", Address.AT, "s16_le", 0, 9000)
end

function CreateWorldPage()
    KLib.Menu.Field("Junk", Address.Junk, "s16_le")
end

function IsItemSlotEmpty(address)
    return KLib.Memory.ReadByte(address) == 0 and KLib.Memory.ReadByte(address + 1) == 0
end

function GetFreeItemSlot(address, max)
    for i = 0, max - 1 do
        if IsItemSlotEmpty(address + (i * 2)) then
            return i
        end
    end
    
    return nil
end

function IsWeapon(id)
    return id >= 0x3F and id <= 0x94
end

function IsArmor(id)
    return id >= 0x95 and id <= 0xC7
end

function IsJunk(id, type)
    return id == 0x14 and type == 0
end

function GetItemName(id, type)
    if type == 0 then
        return Items[id]
    elseif type == 1 then
        return Items[KLib.Memory.ReadByte(Address.Equipment + (id * MaxEquipStructSize))]
    end
end

function TransferItem(location, address)
    local function Send(sourceAddress, destAddress, slot, id, type)
        KLib.Memory.WriteByte(sourceAddress, 0)
        KLib.Memory.WriteByte(sourceAddress + 1, 0)
        KLib.Memory.WriteByte(destAddress + (slot * 2), id)
        KLib.Memory.WriteByte(destAddress + (slot * 2) + 1, type)
        
        if location == "inventory" then
            KLib.Message.Add("Sent " .. GetItemName(id, type) .. " to storage")
        elseif location == "storage" then
            KLib.Message.Add("Sent " .. GetItemName(id, type) .. " to inventory")
        end
    end
    
    local id = KLib.Memory.ReadByte(address)
    local type = KLib.Memory.ReadByte(address + 1)
    
    if id == 0 and type == 0 then return end
    
    if location == "inventory" then
        if type == 0 then
            local slot = GetFreeItemSlot(Address.ItemStorage, MaxItemStorage)
            
            if slot ~= nil then
                Send(address, Address.ItemStorage, slot, id, type)
            else
                KLib.Message.Add("No space available!")
            end
        elseif type == 1 then
            local slot = GetFreeItemSlot(Address.EquipmentStorage, MaxEquipmentStorage)
            
            if slot ~= nil then
                Send(address, Address.EquipmentStorage, slot, id, type)
            else
                KLib.Message.Add("No space available!")
            end
        end
    elseif location == "storage" then
        local slot = GetFreeItemSlot(Address.Items, MaxItems)
        
        if slot ~= nil then
            Send(address, Address.Items, slot, id, type)
        else
            KLib.Message.Add("No space available!")
        end
    end
end

function Mods()
    local function DiscardJunk()
        local junk = KLib.Memory.ReadShort(Address.Junk)
        local total = 0
        
        for i = 0, MaxItems - 1 do
            local address = Address.Items + (i * 2)
            local id = KLib.Memory.ReadByte(address)
            local type = KLib.Memory.ReadByte(address + 1)
            
            if IsJunk(id, type) then
                KLib.Memory.WriteByte(address, 0)
                KLib.Memory.WriteByte(address + 1, 0)
                
                total = total + 1
            end
        end
        
        for i = 0, MaxItemStorage - 1 do
            local address = Address.ItemStorage + (i * 2)
            local id = KLib.Memory.ReadByte(address)
            local type = KLib.Memory.ReadByte(address + 1)
            
            if IsJunk(id, type) then
                KLib.Memory.WriteByte(address, 0)
                KLib.Memory.WriteByte(address + 1, 0)
                
                total = total + 1
            end
        end
        
        KLib.Memory.WriteShort(Address.Junk, junk + total)
        KLib.Message.Add("Discarded " .. total .. " Junk (" .. junk + total .. " Total)")
    end
    
    -- Activate all menus
    KLib.Memory.WriteShort(Address.MenuFlags, 0xFFFF)
    
    if KLib.Input.Joypad["P1 Select"] then
        -- Enter the Debug Room
        if KLib.Input.ButtonPressed("P1 Circle") then
            KLib.Memory.WriteInt(Address.CurrentRoom, 0x00066048)
        end
        
        -- Discard Junk
        if KLib.Input.ButtonPressed("P1 Square") then
            DiscardJunk()
        end
    end
end

CreateMenu()

while true do
    KLib.Update()

    Mods()
    
    emu.frameadvance()

    KLib.PostUpdate()
end
