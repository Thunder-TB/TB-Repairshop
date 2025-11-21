🔧 TB-Repairshop

A high-performance, immersive repair shop system for FiveM.

📖 Description

TB-Repairshop is a fully optimized and feature-rich mechanic script designed to enhance the roleplay experience on your server. Gone are the days of simple "fix" commands; this script introduces a realistic diagnostic, repair, and modification system.

Whether you are running a small roadside garage or a massive tuner shop, TB-Repairshop scales to your needs with extensive configuration options and a sleek, modern UI.

****✨ Key Features****

• 📍 Multi-Location Support: Easily configure multiple mechanic shops (Benny's, LS Customs, private garages) in the config.lua.

• 🔒 Secure: Server-side checks to prevent exploitation.

📦 Dependencies

Before installing TB-Repairshop, ensure you have the following resources installed:

• Framework: qb-core or es_extended

• Menu: qb-menu or ox_lib

🚀 Installation

1. Download the source code or release from the GitHub repository.

2. Extract the folder to your server's resources directory.

3. Rename the folder to tb-repairshop (remove -main if present).

4. Add to config: Open your server.cfg and add the following line:

```
ensure tb-repairshop
```

5. Restart your server.

****⚙️ Configuration****

All settings can be tweaked in ``config.lua.``

Config.Framework = "qb" -- Options: "qb", "esx"
Config.Debug = false -- Enable for debug prints

```
Config.repairCost = 7000
Config.RepairTime = 9000

Config.blipCoords = {

    vector3(537.0688, -178.9806, 54.0266),
    vector3(-2184.1836, -411.1646, 12.6622),
    vector3(-2956.2822, 442.4242, 14.8523),
    vector3(-217.3616, 6201.7061, 31.0780),
    vector3(1716.1000, 4805.1025, 41.3417),
    vector3(2005.8010, 3798.2480, 31.7696),
    vector3(256.7363, 2578.1790, 44.8096),
    vector3(-1374.0253, -332.3609, 38.6966),
    vector3(-211.3394, -1324.2593, 30.4787),
    vector3(-339.3240, -1465.4445, 30.1831),
    vector3(848.6296, -1054.1559, 27.6030),
}
```

****🎮 Usage****

• Billing: Use /bill [id] [amount] or access via the F6 Job Menu.

****🤝 Contributing****
Contributions, issues, and feature requests are welcome!

****📜 License****

Distributed under the MIT License. See LICENSE for more information.

Made with ❤️ by THUNDER
