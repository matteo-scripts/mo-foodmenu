Config = {}

-- List of restaurants with their coordinates, URL, and other attributes
Config.Restaurants = {
    {
        name = "Pizzeria",
        coords = vector3(810.5308, -752.6091, 25.2345), -- location
        size = vector3(2.0, 2.0, 2.0), -- Size of the zone (length, width, height)
        heading = 0, -- Heading direction of the zone
        url = 'https://cdn.discordapp.com/attachments/1261830609039392869/1277276909625016441/pizza.png?ex=66cc9451&is=66cb42d1&hm=d426cbf7a8ff656d9fe195a8560f027765cbc827e5b10317ea61ef2e0ebf3067&', -- url u can use discord
        icon = "fas fa-pizza-slice", -- icon
        label = "View the menu - Pizzeria", -- label for target
        distance = 3.5
    },
    {
        name = "Kebab",
        coords = vector3(223.45, 778.90, 21.32), -- location
        size = vector3(2.0, 2.0, 2.0), -- Size of the zone
        heading = 0, -- Heading direction of the zone
        url = 'https://example.com/kebab_menu.png', -- url u can use discord
        icon = "fas fa-drumstick-bite", -- icon
        label = "View the menu - Kebab", -- label for target
        distance = 3.5
    },
    -- You can add more restaurants
}

-- Additional option to add a model
Config.AdditionalModels = {
    {
        model = `yourcarmodel`, -- car model
        event = "mo_camera:client:use-photo", -- leave this
        icon = "fas fa-car", -- icon
        label = "View the FoodTruck Menu",
        url = 'https://example.com/foodtruck_menu.png',
        distance = 3.5
    }
}
