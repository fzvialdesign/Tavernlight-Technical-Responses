// Original code

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
Player* player = g_game.getPlayerByName(recipient);
if (!player) {
player = new Player(nullptr);
if (!IOLoginData::loadPlayerByName(player, recipient)) {
return;
}
}

Item* item = Item::CreateItem(itemId);
if (!item) {
return;
}

g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

if (player->isOffline()) {
IOLoginData::savePlayer(player);
}
}

// Modified code

// Implemented indentation and spacing for readability
// Implemented function description for comprehension

// Adds an item to a player's inventory according to its ID

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId) {
  Player* player = g_game.getPlayerByName(recipient); // Memory used

  if (!player) {
    // Added pointer delete to prevent leak
    delete player
    player = new Player(nullptr); // Memory used
    
    if (!IOLoginData::loadPlayerByName(player, recipient)) {
      // Added pointer delete to prevent leak
      delete player

      return;
    }
  }

  Item* item = Item::CreateItem(itemId); // Memory used

  if (!item) {
    // Added pointer deletes to prevent leak
    delete player
    delete item

    return;
  }

  g_game.internalAddItem(player -> getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

  if (player -> isOffline()) {
    IOLoginData::savePlayer(player);
  }

  // Added pointer deletes to prevent leak
  delete player
  delete item
}

// Explanation

/*

Over the course of the original program, memory allocation occurs at three
different points. The first is the initial player creation, which needs to be
deleted before the reassignment in the first if-statement, in the second if-
statement (not the one nested in the first) before the return, and at the end
very end of the program. The second occurs in the first if-statement's player
reassignment, which needs to be deleted in the following nested if-statement, 
in the second if-statement (not the one nested in the first) before the return,
and at the end very end of the program. The third occurs after the first if-
statement with the creation of the item, which needs to be deleted in the 
second if-statement (not the one nested in the first) before the return and at 
the end very end of the program.

*/
