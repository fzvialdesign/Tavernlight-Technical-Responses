-- Original code

local function releaseStorage(player)
player:setStorageValue(1000, -1)
end

function onLogout(player)
if player:getStorageValue(1000) == 1 then
addEvent(releaseStorage, 1000, player)
end
return true
end

-- Modified code

-- Implemented indentation and spacing for readability
-- Remove releaseStorage function

function onLogout(player)
  if player:getStorageValue(1000) == 1 then
    -- Remove addEvent call
    -- Added player:setStorageValue call otherwise found in removed releaseStorage function
    player:setStorageValue(1000, -1)
  end

  return true
end

--[[ Explanation

The original code checks the storage value at the point '1000' and then 
proceeds to release the storage value 1000 milliseconds from the initial check 
through addEvent. This would make the program unnecessarily slow for modifying 
the storage value at the same place it was originally being checked, given that
there does not seem to be other code that would require that delay. For that, 
it makes sense to just remove the releaseStorage function entirely and directly
call setStorageValue instead of waiting through addEvent, considering the 
player object is already available over the course of onLogout.

]]--
