

-- add:
-- me interface
-- void chest (for making singularities)

-- local meChest = 

data:extend({
    {
        type = "container",
        name = "me-interface",

        icon = "__me-system__/graphics/me-interface-icon.png",
        icon_size = 64, icon_mipmaps = 4,

        flags = {"placeable-neutral", "player-creation"},
        minable = {mining_time = 0.2, result = "me-interface"},
        max_health = 200,
        corpse = "iron-chest-remnants",
        dying_explosion = "iron-chest-explosion",
        open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume = 0.43 },
        close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
        resistances = {
            {type = "fire", percent = 80},
            {type = "impact", percent = 30}
        },
        collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        -- damaged_trigger_effect = hit_effects.entity(),
        inventory_size = 10,
        -- vehicle_impact_sound = sounds.generic_impact,
        picture = {
            layers = {
                {
                    filename = "__me-system__/graphics/me-interface.png",
                    priority = "extra-high",
                    width = 34,
                    height = 38,
                    shift = util.by_pixel(0, -0.5),
                    hr_version =
                    {
                        filename = "__me-system__/graphics/hr-me-interface.png",
                        priority = "extra-high",
                        width = 66,
                        height = 76,
                        shift = util.by_pixel(-0.5, -0.5),
                        scale = 0.5
                    }
                },
                {
                    filename = "__me-system__/graphics/me-interface-shadow.png",
                    priority = "extra-high",
                    width = 56,
                    height = 26,
                    shift = util.by_pixel(10, 6.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__me-system__/graphics/hr-me-interface-shadow.png",
                        priority = "extra-high",
                        width = 110,
                        height = 50,
                        shift = util.by_pixel(10.5, 6),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        },
        -- circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
        -- circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
        -- circuit_wire_max_distance = default_circuit_wire_max_distance

        inventory_type="with_filters_and_bar",
        enable_inventory_bar=false
        -- command right click to toggle filter
        -- press 'toggle-filter' to toggle filter
    },
    {
        type = "item",
        name = "me-interface",

        icon = "__me-system__/graphics/me-interface-icon.png",
        icon_size = 64, icon_mipmaps = 4,

        subgroup = "storage",
        order = "a[items]-b[me-interface]",
        place_result = "me-interface",
        stack_size = 50
    },
    {
        type = "recipe",
        name = "me-interface",
        enabled = true,
        ingredients = {},
        result = "me-interface"
    },
})