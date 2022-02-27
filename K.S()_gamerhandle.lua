require("natives-1640181023")

util.keep_running()

local menuroot = menu.my_root()
local menuAction = menu.action
local menuToggle = menu.toggle
local menuToggleLoop = menu.toggle_loop
local joaat = util.joaat
local wait = util.yield

local createPed = PED.CREATE_PED
local getEntityCoords = ENTITY.GET_ENTITY_COORDS
local getPlayerPed = PLAYER.GET_PLAYER_PED
local requestModel = STREAMING.REQUEST_MODEL
local hasModelLoaded = STREAMING.HAS_MODEL_LOADED
local noNeedModel = STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED
local setPedCombatAttr = PED.SET_PED_COMBAT_ATTRIBUTES
local giveWeaponToPed = WEAPON.GIVE_WEAPON_TO_PED

local function runGamerHandles()
    util.toast("----------GAMERHANDLES----------", TOAST_LOGGER)
    for i = 0, 31, 1 do
        if NETWORK.NETWORK_IS_PLAYER_CONNECTED(i) then
            local handlepoint = memory.alloc()
            NETWORK.NETWORK_HANDLE_FROM_PLAYER(i, handlepoint, 13)
            local handle = memory.read_int(handlepoint)
            local playername = NETWORK.NETWORK_PLAYER_GET_NAME(i)
            util.toast(tostring(playername) .. "'s gamerHandle is " .. tostring(handle), TOAST_LOGGER)
            menu.action(menuroot, tostring(playername) .. "'s gH: " .. tostring(handle), {}, "", function()
                util.toast(tostring(playername) .. "'s gamerHandle is " .. tostring(handle))
            end)
            memory.free(handlepoint)
        end
    end
end

runGamerHandles()