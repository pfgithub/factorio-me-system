if global["me-system"] == nil then
    global["me-system"] = {
        items = {},
    }
end
local me_system = global["me-system"]

function tick_mod(debug_log)
    for _, surface in pairs(game.surfaces) do
        local interfaces = surface.find_entities_filtered{name = "me-interface"}
        for _, interface in pairs(interfaces) do
            local inventory = interface.get_inventory(defines.inventory.chest)
            local inventory_size = 10;
            if inventory ~= nil then
                if not inventory.is_empty() then
                    local contents = inventory.get_contents()

                    for key, value in pairs(contents) do
                        if me_system.items[key] == nil then
                            me_system.items[key] = 0
                        end
                        me_system.items[key] = me_system.items[key] + value
                    end

                    inventory.clear()
                end

                for i = 1, 10 do
                    local filter = inventory.get_filter(i)
                    if debug_log then game.print(serpent.block({"Filter at index", i, filter})) end
                    if filter ~= nil then
                        local item_count = me_system.items[filter]
                        if item_count ~= nil and item_count > 0 then
                            if item_count > 1 then item_count = 1 end
                            local inserted_count = inventory.insert({name=filter, count=item_count})
                            if inserted_count > 0 then
                                me_system.items[filter] = me_system.items[filter] - inserted_count
                            end
                        end
                    end
                end
            end
        end
    end

    if debug_log then game.print(serpent.block({"ME System Contains:", me_system})) end
end

script.on_event(defines.events.on_tick, function(event)
    tick_mod(false)
end)

commands.add_command("tick_me_system", nil, function(command)
    -- tick_mod(true)
end)

-- TODO:
-- add a combinator to list the counts of the entire system
-- consider switching to provider and requester chests for the ui

-- more:
-- storage drives
-- -- limits the number of bytes in the system
-- terminal
-- -- allows you to view all the items in the system and take them out
-- channel limits (number of things on one system)
-- -- from a core you get 8 channels on each side, or 32 channels with a dense cable
-- metiorite needed for crafting
-- -- that would be funny if we're just copying applied energistics
-- ...

-- /c game.reload_mods()