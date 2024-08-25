--[[
# mo-foodmenu

`mo-foodmenu` is a script designed for FiveM servers that adds interactive food menus for various restaurants and food trucks in the game. This script uses the `qtarget` resource to create target zones where players can view food menus through simple interactions.

## Features

- **Target Zones for Restaurants:** Define various restaurants with specific locations, sizes, and custom interaction icons.
- **Additional Model Integration:** Support for specific models, like food trucks, to trigger menu interactions.
- **UI Integration:** Display an in-game menu via NUI when a player interacts with a defined zone or model.

## Setup and Configuration

1. **Restaurant Zones:** 
   - Define restaurant locations, sizes, and interaction settings in the `Config.Restaurants` table.
   - Each restaurant includes attributes like coordinates, zone size, heading, interaction icon, label, and the URL for the menu.

2. **Additional Models:**
   - Optionally, you can define additional models (e.g., food trucks) that trigger the menu display by specifying the model, event, icon, label, and URL in the `Config.AdditionalModels` table.

## How It Works

- When a player approaches a defined restaurant or model, they can interact with it to view the food menu.
- The script utilizes NUI to show the menu as an overlay in the game.
- Custom animations and props are used to enhance the interaction experience.

## Requirements

- **qtarget**: Ensure that the `qtarget` resource is installed and properly configured on your server.

## Installation

1. Clone or download the `mo-foodmenu` repository to your server's resources directory.
2. Add the resource to your server configuration file (`server.cfg`):

```lua
ensure mo-foodmenu
