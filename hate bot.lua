-- @hatetoseeyouleave src.

-- MSGS
local hate = {
  '.gg/insi st | i hate all of you | hate',
  '.gg/insi st | im really just hoping everything is bad for yall man | hate',
  '.gg/insi st | ngl hope yall break a leg or just have a bad day | hate',
  '.gg/insi st | praying everyone doin bad in life (hope it gets worse from here) | hate',
  '.gg/insi st | hope u fall and hit ur head | hate',
  '.gg/insi st | lol new botters botting they server reaching 50 and deleting the server or letting it rot | hate',
  '.gg/insi st | ur so irrelevant lol | hate',
  '.gg/insi st | Hi guys | hate',
  '.gg/insi st | @hatetoseeyouleave | hate',
  '.gg/insi st | me >> any botter you know | hate',
  '.gg/insi st | im better than all of you lol | hate',
  '.gg/insi st | best botted server | hate',
  '.gg/insi st | ur such a fan | hate',
  '.gg/insi st | fanned out zzz | hate',
  '.gg/insi st | too many clones | hate',
  '.gg/insi st | come cry in the server bout how the bot upset u | hate',
  '.gg/insi st | aw is the bot making you maddddd | hate',
  '.gg/insi st | im sooo much better than you | hate'}

-- ADMINS
local users = {
'52658123',
'463040794'
}


local function ServerHop()
      local queue_on_teleport = syn and syn.queue_on_teleport or queue_on_teleport
    	  if (queue_on_teleport) then
    		queue_on_teleport("loadstring(game.HttpGet(game, \"https://raw.githubusercontent.com/deathllyhallows/BotFlinger/main/Main.lua\"))()");
    	  end
      local AvailableServers = HTTPService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/".. game.PlaceId .."/servers/Public?sortOrder=Asc&limit=100"))
    
      while wait() do
    	  local RandomServer = AvailableServers.data[math.random(#AvailableServers.data)]
    	  if RandomServer.playing < RandomServer.maxPlayers - 2 and RandomServer.playing > 9 and RandomServer.id ~= game.JobId then
    		  TPService:TeleportToPlaceInstance(game.PlaceId, RandomServer.id)
    	  end
      end
    end
    
    local function hop()
      ServerHop()
      while wait(15) do
    	  pcall(ServerHop)
      end
    end

-- Function to check if a user ID is in the array
local function isUserInArray(userId)
    for _, id in ipairs(users) do
        if id == userId then
            return true
        end
    end
    return false
end


local function teleportAndSendMessage()
    local players = game.Players:GetPlayers()
    local randomPlayer = players[math.random(1, #players)]
    game.Players.LocalPlayer.Character:MoveTo(randomPlayer.Character.HumanoidRootPart.Position)
    for _, message in ipairs(hate) do
        game.Players.LocalPlayer.Chatted:FireServer(message)
        wait(4) 
    end
end

game.Players.PlayerAdded:Connect(function(player)
    local userId = tostring(player.UserId)
    if isUserInArray(userId) then
		game.Players:WaitForChild("LocalPlayer"):Kick("Serverhopping: ADMIN WAS IN GAME. ", userId)
        print("Server hopping for user with ID:", userId)
        hop()
    end
end)
