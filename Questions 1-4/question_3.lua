-- Original code

function do_sth_with_PlayerParty(playerId, membername)
player = Player(playerId)
local party = player:getParty()

for k,v in pairs(party:getMembers()) do
if v == Player(membername) then
party:removeMember(Player(membername))
end
end
end

-- Modified code

-- Implemented indentation and spacing for readability
-- Implemented function description for comprehension

--[[

Get all of a player's party members excluding the player his/herself

]]--

-- Changed function name to fit description of code
function getPartyMembersOfPlayer(playerId, membername)
  -- Localized player object variable and set it with function new
  local player = Player.new(playerId, membername)
  local party = player:getParty()

  -- Changed k to _ since it is unused
  for _,v in pairs(party:getMembers()) do
    -- Make ID and name checks for a player match
    sameId = v:getId() == player:getId()
    sameName = v:getName() == player:getName()

    -- Change if-statement to check if both matches exist
    if sameId and sameName then
      -- Change Player call to player object variable
      party:removeMember(player)
     end
  end
end

-- Explanation

--[[

The function name was renamed to reflect the purpose of the function instead of
vaguely referencing it doing something with the player party. Because Lua is
not a true object-oriented language, complex tables are treated as "objects,"
meaning they cannot be called bare like in the original code. Therefore, the
player needs to be created with an explicit "new" function. The if-statement is
changed to a couple of booleans to see if the ID and name match, since you
cannot compare tables by using the "==" operator alone. For removeMember, the
Player call becomes the previously created player, assuming the removeMember
function is able to handle the list of players with just a player argument.
Also, the k in the loop is changed to an _ to reflect the fact that it goes
unused.

]]--
