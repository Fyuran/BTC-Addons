Version 1.17D
-Bugfixes to database_player debug logging
-Bugfixes to nil variables in getVariable in remove_EH.sqf

Version 1.17C
-Added GAIA intel drops to spot antennas locations
-Attempt at fixing intro infinite loop bug

Version 1.17B
-Revert of Btc-Intro
-Added HQ mission defuse IED
-Slowed down Flybies

Version 1.17A
-Aesthetic change to BTC-Intro
-Updated btc_fnc_logDebug to use CBA debug logging function
-Added ForceSay3D function
-Fixed VCOM setSkill bug
-Added first draft of HQMISSIONS (Eliminate HVT, Rescue Journalist)

Version 1.17
-Updated BTC-Intro

Version 1.16Ca
-PERSISTENCE: Blacklisted "btc_money_stack" from shop
-PERSISTENCE: Inventory loadout from database is delayed by 5 seconds (from local variable time) to allow init to finish
-PERSISTENCE: TFAR radios are removed from loadout as they require an unique ID

Version 1.16c
-Bugfixes to PERSISTENCE

Version 1.16b
-PERSISTENCE: Modified shop currency to be "btc_money_stack" of btc_money.pbo from a global variable
-AMBIENT: Added air ambient Flybies

Version 1.16
-PERSISTENCE: Added Shop
-PERSISTENCE: Added Recycle for shop currency
-PERSISTENCE: Added Price table from server to client
-Engima Traffic: Update from 1.6.1 to 1.7

Version 1.15a
-PERSISTENCE: Crate is allowdamage false, ACE_Cargo logic updated
-PERSISTENCE: Updated sector logic to ignore EOS spawning when a player position is inside sector
-PERSISTENCE: Fixed bug with player database and editor loadout priority mismatching (ghost items)
-PERSISTENCE: Changed add_to_database behaviour by implementing M-HQs to persistence database and removing old persist_%side% logic
-PERSISTENCE: Updated periodic check logic to generic function

Version 1.15
-PERSISTENCE: Added GAIA support
-PERSISTENCE: Updated Database sectors script
-PERSISTENCE: Added debug markers to vehicles and crates database
-Fixed bug with lockpick script not working due to deprecated code
-Added EOS check for non-existant markers

Version 1.1