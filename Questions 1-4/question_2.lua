-- Original code

function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
local guildName = result.getString("name")
print(guildName)
end

-- Modified code

-- Move method description to before the function definition
-- Removed "this method is supposed to" from the method description

-- Print names of all guilds that have less than memberCount max members
function printSmallGuildNames(memberCount)
  local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
  local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))

  -- Added if statement for resetting the storeQuery after usage
  if resultId then
	local guildName = result.getString("name")
	-- Added free call for result for resetting the storeQuery after usage
	result.free(resultId)

	print(guildName)
end

--[[ Explanation

Though the resultId is local, that does not prevent the result global variable
related to storeQuery from being reset properly. This means that the original
code will produce the wrong result value for each time that the function is
called. This means that modified code would require a reset to the result,
which should only be called if there actually is a valid resultId.

]]--
