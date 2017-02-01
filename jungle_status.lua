local Jungle = {}
----------------------------------------------------------------------------------------------------

local utils = require(GetScriptDirectory() .. "/util")
local isJungleFresh = true
local jungle = utils.deepcopy(utils.tableNeutralCamps)
----------------------------------------------------------------------------------------------------

--reset the jungle camps
function Jungle.NewJungle ()
	if not isJungleFresh then
		jungle = utils.deepcopy(utils.tableNeutralCamps)
		isJungleFresh = true
	end
end


----------------------------------------------------------------------------------------------------

--get currently known alive / unknown camps
function Jungle.GetJungle ( nTeam )
	if jungle[nTeam] == nil or #jungle[nTeam] == 0 then
		return nil
	end
	return jungle[nTeam]
end

----------------------------------------------------------------------------------------------------

--announce a camp dead
function Jungle.JungleCampClear ( nTeam, vector )
  	for i=#jungle[nTeam],1,-1 do

	    if jungle[nTeam][i][VECTOR] == vector then
	        table.remove(jungle[nTeam], i)
	    end
	end
  isJungleFresh = false
end

----------------------------------------------------------------------------------------------------

return Jungle