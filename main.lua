local ffi = require("ffi")

gameSettings = {
  WindowResolution = rl.new("Vector2", 1280,720),
  defaultWindowTitle = "Luacraft",
  targetFPS = 120*1,
  allowWorldGeneration = false, -- false only generates one chunk, at 0,0
  renderDistance = 8,
  runSplitscreen = true,
  localPlayerCount = 2,
  }

splitscreenWindowLocations = {
  Count1 = {
    Player1 = {
      StartX = 0,
      StartY = 0,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y,
      Width = gameSettings.WindowResolution.x,
      Height = gameSettings.WindowResolution.y,
      },
    },
  Count2 = {
    Player1 = {
      StartX = 0,
      StartY = 0,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y/2,
      Width = gameSettings.WindowResolution.x,
      Height = gameSettings.WindowResolution.y/2,
      },
      Player2 = {
      StartX = 0,
      StartY = gameSettings.WindowResolution.y/2,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y,
      Width = gameSettings.WindowResolution.x,
      Height = gameSettings.WindowResolution.y/2,
      },
    },
  Count3 = {
    Player1 = {
      StartX = 0,
      StartY = 0,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y/2,
      Width = gameSettings.WindowResolution.x,
      Height = gameSettings.WindowResolution.y/2,
      },
      Player2 = {
      StartX = 0,
      StartY = gameSettings.WindowResolution.y/2,
      EndX = gameSettings.WindowResolution.x/2,
      EndY = gameSettings.WindowResolution.y,
      Width = gameSettings.WindowResolution.x/2,
      Height = gameSettings.WindowResolution.y/2,
      },
      Player3 = {
      StartX = gameSettings.WindowResolution.x/2,
      StartY = gameSettings.WindowResolution.y/2,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y,
      Width = gameSettings.WindowResolution.x/2,
      Height = gameSettings.WindowResolution.y/2,
      },
    },
  Count4 = {
    Player1 = {
      StartX = 0,
      StartY = 0,
      EndX = gameSettings.WindowResolution.x/2,
      EndY = gameSettings.WindowResolution.y/2,
      Width = gameSettings.WindowResolution.x/2,
      Height = gameSettings.WindowResolution.y/2,
      },
      Player2 = {
      StartX = gameSettings.WindowResolution.x/2,
      StartY = 0,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y/2,
      Width = gameSettings.WindowResolution.x/2,
      Height = gameSettings.WindowResolution.y/2,
      },
      Player3 = {
      StartX = 0,
      StartY = gameSettings.WindowResolution.y/2,
      EndX = gameSettings.WindowResolution.x/2,
      EndY = gameSettings.WindowResolution.y,
      Width = gameSettings.WindowResolution.x/2,
      Height = gameSettings.WindowResolution.y/2,
      },
      Player4 = {
      StartX = gameSettings.WindowResolution.x/2,
      StartY = gameSettings.WindowResolution.y/2,
      EndX = gameSettings.WindowResolution.x,
      EndY = gameSettings.WindowResolution.y,
      Width = gameSettings.WindowResolution.x/2,
      Height = gameSettings.WindowResolution.y/2,
      },
    
    }, 
    
  
  }

chunkSettings = {
    maxHeight = 256,
    width = 16,
    depth = 16,
}

playerInfos = {
  Player1 = {
    Camera = rl.new("Camera", {
  position = rl.new("Vector3", 0, 66, 1),
  target = rl.new("Vector3", 0, 0, 0),
  up = rl.new("Vector3", 0, 1, 0),
  fovy = 45,
  type = rl.CAMERA_PERSPECTIVE
}),
    Position = rl.new("Vector3", 0,0,0),
    Rotation = rl.new("Vector3", 0,0,0),
    CurrentInputPressed = {
        Move = rl.new("Vector2", 0, 0),
        Rotate = rl.new("Vector2", 0, 0),

    },
    CurrentInputDefined = {
        Move = "",
        MoveForward = "W",
        MoveBackwards = "S",
        MoveLeft = "A",
        MoveRight = "D",
        Rotate = "Mouse",
    },
    theRenderTexture,
    theRenderTextureRect,
    
    },
  Player2 = {
    Camera = rl.new("Camera", {
  position = rl.new("Vector3", 0, 66, 1),
  target = rl.new("Vector3", 0, 0, 0),
  up = rl.new("Vector3", 0, 1, 0),
  fovy = 45,
  type = rl.CAMERA_PERSPECTIVE
}),
    Position = rl.new("Vector3", 0,0,0),
    Rotation = rl.new("Vector3", 0,0,0),
    CurrentInputPressed = {
        Move = rl.new("Vector2", 0, 0),
        Rotate = rl.new("Vector2", 0, 0),

    },
    CurrentInputDefined = {
        Move = "",
        MoveForward = "W",
        MoveBackwards = "S",
        MoveLeft = "A",
        MoveRight = "D",
        Rotate = "Mouse",
    },
    theRenderTexture,
    theRenderTextureRect,
    
  },
  Player3 = {
    Camera = rl.new("Camera", {
  position = rl.new("Vector3", 0, 66, 1),
  target = rl.new("Vector3", 0, 0, 0),
  up = rl.new("Vector3", 0, 1, 0),
  fovy = 45,
  type = rl.CAMERA_PERSPECTIVE
}),
    Position = rl.new("Vector3", 0,0,0),
    Rotation = rl.new("Vector3", 0,0,0),
    CurrentInputPressed = {
        Move = rl.new("Vector2", 0, 0),
        Rotate = rl.new("Vector2", 0, 0),

    },
    CurrentInputDefined = {
        Move = "",
        MoveForward = "W",
        MoveBackwards = "S",
        MoveLeft = "A",
        MoveRight = "D",
        Rotate = "Mouse",
    },
    theRenderTexture,
    theRenderTextureRect,
    
  },
  Player4 = {
    Camera = rl.new("Camera", {
  position = rl.new("Vector3", 0, 66, 1),
  target = rl.new("Vector3", 0, 0, 0),
  up = rl.new("Vector3", 0, 1, 0),
  fovy = 45,
  type = rl.CAMERA_PERSPECTIVE
}),
    Position = rl.new("Vector3", 0,0,0),
    Rotation = rl.new("Vector3", 0,0,0),
    CurrentInputPressed = {
        Move = rl.new("Vector2", 0, 0),
        Rotate = rl.new("Vector2", 0, 0),

    },
    CurrentInputDefined = {
        Move = "",
        MoveForward = "W",
        MoveBackwards = "S",
        MoveLeft = "A",
        MoveRight = "D",
        Rotate = "Mouse",
    },
    theRenderTexture,
    theRenderTextureRect,
    
    }
  
}

local heldItemMeshes = {}
local heldItemMaterials = {}

rl.SetWindowState(rl.FLAG_MSAA_4X_HINT)

rl.InitWindow(gameSettings.WindowResolution.x, gameSettings.WindowResolution.y, gameSettings.defaultWindowTitle)
rl.UpdateCamera(playerInfos.Player1.Camera, rl.CAMERA_FIRST_PERSON)


for playerNumber, player in pairs(playerInfos) do
  player.Inventory = {}
  player.Toolbar = {}
  player.SelectedSlot = 1
  for i = 1, 9, 1 do
    player.Toolbar[i] = {"Empty", 0, {}} -- itemName, Amount, ExtraInfo (enchantments durability etc)
  end
  for i = 1, 36, 1 do
    player.Inventory[i] = {"Empty", 0, {}} -- itemName, Amount, ExtraInfo (enchantments durability etc)
  end
  
  player.Toolbar[2] = {"Dirt", 64, {}}
  player.Toolbar[3] = {"Grass", 32, {}}
  player.Toolbar[4] = {"Log", 16, {}}
  player.Toolbar[5] = {"Planks", 8, {}}
  player.Toolbar[6] = {"Leaves", 4, {}}
  player.Toolbar[7] = {"Bricks", 2, {}}
  player.Toolbar[8] = {"Stone", 1, {}}
  player.Toolbar[9] = {"Bedrock", 1, {}}

  local playerCountLocalPlayers = 1
  if gameSettings.runSplitscreen then
    playerCountLocalPlayers = gameSettings.localPlayerCount
  end
  local localResInfo = splitscreenWindowLocations["Count" .. playerCountLocalPlayers][playerNumber]
  if localResInfo ~= nil then
    player.theRenderTexture = rl.LoadRenderTexture(localResInfo.Width, localResInfo.Height)
    player.theRenderTextureRect = rl.new("Rectangle", 0, 0, localResInfo.Width, -localResInfo.Height)
  end
end


local PI = 3.14159265358979323846



shapeInfos = {
    "Cube",
    
  
}

local appDirectory =  rl.GetApplicationDirectory()

images = { --Image, Texture, MegaX (DO NOT DEFINE), MegaY (DO NOT DEFINE)
    Dirt = {}, 
    GrassSide = {}, 
    GrassTop = {},
    Log = {},
    LogSide = {},
    Planks = {},
    Leaves = {},
    Bricks = {},
    Stone = {},
    Bedrock = {},

}

for i, imageTable in pairs(images) do  
  local fileName = "Assets/" .. i .. ".png"
  
  imageTable[1] = rl.LoadImage(fileName)
  imageTable[2] = rl.LoadTexture(fileName)
end


local bigImage
local tempBigImage

local bigImageSize = rl.new("Vector2", 1, 1)

function createBigImage()
  local xSize = 1
  local ySize = 1
  local imageWidth = 32
  local imageHeight = 32
  
  local amountOfImages = 0
  for _, imageTable in pairs(images) do
    amountOfImages = amountOfImages + 1
  end
  
  while xSize * ySize < amountOfImages do
    if xSize == ySize then
      xSize = xSize + 1
    else  
      ySize = ySize + 1
    end
  end
  
  xSize = xSize * 3 -- prevent bleed via stupid methods
  ySize = ySize * 3
  
  bigImage = rl.new("Texture")
  
  bigImage.width = xSize * imageWidth
  bigImage.height = ySize * imageHeight  
  
  --tempBigImage = rl.new("Image")
  tempBigImage = rl.GenImageColor(xSize * imageWidth, ySize * imageHeight, rl.RAYWHITE) 
 --tempBigImage = ffi.new("Image", {})
  --tempBigImage.data = nil
  tempBigImage.width = xSize * imageWidth
  tempBigImage.height = ySize * imageHeight
  tempBigImage.format = rl.PIXELFORMAT_UNCOMPRESSED_R8G8B8A8
  --tempBigImage.mipmaps = 1
  
  --print("here")
 -- print(tempBigImage)
  --print(tempBigImage.data)
  


  
  --= ffi.new("Image[" .. (1) .. "]", {})
  
  local currentCursorX = 0
  local currentCursorY = 0
  
  for _, imageTable in pairs(images) do
    imageTable[3] = currentCursorX + 2
    imageTable[4] = currentCursorY + 2
    
    local srcRes = rl.new("Rectangle", 0,0,imageWidth,imageHeight)
    local tint = rl.WHITE
    
    for i = 1, 3, 1 do
      for i2 = 1, 3, 1 do
      local destRes = rl.new("Rectangle", imageWidth*(currentCursorX+ i),imageHeight*(currentCursorY+ i2),imageWidth,imageHeight)
      rl.ImageDraw(tempBigImage, imageTable[1], srcRes, destRes, tint)
      end
    end
    
    
    currentCursorX = currentCursorX + 3
    if currentCursorX == xSize then
      currentCursorY = currentCursorY + 3
      currentCursorX = 0
    end

end
  
  bigImage = rl.LoadTextureFromImage(tempBigImage)

  rl.SetTextureWrap(bigImage, rl.TEXTURE_WRAP_CLAMP)
  rl.SetTextureFilter(bigImage, rl.TEXTURE_FILTER_POINT)
  
  bigImageSize.x = xSize
  bigImageSize.y = ySize

  --print("here2")
  --print(tempBigImage.data)
  
end

createBigImage()

-- create bigImage here

blockInfos = {
    {"Air", false, true, 0, "", "", "", "", "", ""}, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Dirt", true, false, 0, "Dirt", "Dirt", "Dirt", "Dirt", "Dirt", "Dirt"}, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Grass", true, false, 0, "GrassTop", "Dirt", "GrassSide", "GrassSide", "GrassSide", "GrassSide"}, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Log", true, false, 0 , "Log", "Log", "LogSide", "LogSide", "LogSide", "LogSide"}, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Planks", true, false, 0, "Planks", "Planks", "Planks", "Planks", "Planks", "Planks" }, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Leaves", true, true, 0, "Leaves", "Leaves", "Leaves", "Leaves", "Leaves", "Leaves" }, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Bricks", true, false, 0, "Bricks", "Bricks", "Bricks", "Bricks", "Bricks", "Bricks" }, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Stone", true, false, 0, "Stone", "Stone", "Stone", "Stone", "Stone", "Stone"}, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back
    {"Bedrock", true, false, 0, "Bedrock", "Bedrock", "Bedrock", "Bedrock", "Bedrock", "Bedrock"}, -- Name, Render?, DisableFaceCulling, Shape, Up, Down, Left, Right, Forward, Back

}

currentLoadedMap = {} -- children are chunks, which then has the info for individual blocks
currentLoadedMapMeshes = {} -- children are chunks, then its a mesh for the chunk
currentLoadedMapTransformations = {} -- children are chunks, then its the transformation for collision info

--rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)

--rl.InitWindow(gameSettings.WindowResolution.x, gameSettings.WindowResolution.y, gameSettings.defaultWindowTitle)


--function updateChunkMesh(needsCreating, X,Y)
  
--end

rl.SetTargetFPS(gameSettings.targetFPS)

function chunkMeshGenerator(X,Y)
  local triangleCount = 0
  local vertexTable = {}
  local normalTable = {}
  local textureCoordTable = {}

  local threadsMade = chunkSettings.maxHeight
  local threadsCompleted = 0
  
  for tempX = -1, 1, 1 do -- force load chunks
    for tempY = -1, 1, 1 do 
      if not currentLoadedMap[X + tempX] or not currentLoadedMap[X + tempX][Y + tempY] then
        chunkGeneration(X + tempX,Y + tempY, false)
      end
    end
  end

  local ChunkTable = currentLoadedMap[X][Y]
  --print("RAYLIB 5.5 CRASHES BELOW HERE")
  for localXi = 0, chunkSettings.width, 1 do -- cube
    for localZi = 0, chunkSettings.depth, 1 do 
      --local threadYAxis = coroutine.create(function() 
        for localYi = 0, chunkSettings.maxHeight, 1 do
          local cube = ChunkTable[localXi][localZi][localYi]  
          local cubePosition = rl.new("Vector3",localXi + ((chunkSettings.width + 1) * X) ,localYi,localZi + ((chunkSettings.depth + 1) * Y))
          local matrixTransformation = rl.new("Matrix",
            1,0,0,cubePosition.x,
            0,1,0,cubePosition.y,
            0,0,1,cubePosition.z,
            0,0,0,1)
                
          local cubeMaterial
          local meshToUse
          local shape = "Cube"
          local render = false
          local renderAsSides = false
          local sidesToRender = {false,false,false,false,false,false}
          local imageSides = {blockInfos[cube][10], blockInfos[cube][9], blockInfos[cube][5], blockInfos[cube][6], blockInfos[cube][8], blockInfos[cube][7]}
          
          --imageSides = {"Dirt","Dirt","GrassTop","Dirt","Dirt","Dirt",}

         --Up[5], Down[6], Left[7], Right[8], Forward[9], Back[10]
         --3         4        6        5         2          1
        

         -- imageSides[1] = blockInfos[cube][5]
         -- imageSides[2] = blockInfos[cube][6]
         -- imageSides[3] = blockInfos[cube][7]
         -- imageSides[4] = blockInfos[cube][8]
         -- imageSides[5] = blockInfos[cube][9]
         -- imageSides[6] = blockInfos[cube][10]

          -- XX YY ZZ
          -- +- +- +-
          
        local localblockInfo = blockInfos[cube]  
        if localblockInfo[2] then
          render = true
        end
        if localblockInfo[4] then
          renderAsSides = true
          meshToUse = cubeMesh
        end
          
    --      if cube == 1 then
            -- air
   --       elseif cube == 2 then  
            --dirt
   --         render = true
   --         meshToUse = cubeMesh
   --         renderAsSides = true
   --       elseif cube == 3 then 
   --         --grass
   --         render = true
   --         meshToUse = cubeMesh
   --         renderAsSides = true
  --        else
            --print(cube)
      
  --        end
                
          if render then
            --basic culling to determine if the block can be seen
            -- local sidesToRender = {false,false,false,false,false,false}
            -- XX YY ZZ
            -- +- +- +-    
            if localXi + 1 <= chunkSettings.width then
              local cubeXPos = ChunkTable[localXi+1][localZi][localYi] 
              if cubeXPos == 1 then
                sidesToRender[1] = true
              end
            else
              local cubeXPos2 = currentLoadedMap[X+1][Y][0][localZi][localYi]
                if cubeXPos2 == 1 then
                  sidesToRender[1] = true
                else  
                  sidesToRender[1] = false
                end
              --sidesToRender[1] = true --
            end
                
            if localXi - 1 >= 0 then
              local cubeXNeg = ChunkTable[localXi-1][localZi][localYi] 
              if cubeXNeg == 1 then
                sidesToRender[2] = true
              end
            else
                local cubeXPos2 = currentLoadedMap[X-1][Y][chunkSettings.width][localZi][localYi]
                if cubeXPos2 == 1 then
                  sidesToRender[2] = true
                else  
                  sidesToRender[2] = false
                end
              --sidesToRender[2] = true --
            end 
                
            if localYi + 1 <= chunkSettings.maxHeight then
              local cubeYPos = ChunkTable[localXi][localZi][localYi+1] 
              if cubeYPos == 1 then
                sidesToRender[3] = true
              end
            else
              sidesToRender[3] = true
            end
                  
            if localYi - 1 >= 0 then
              local cubeYNeg = ChunkTable[localXi][localZi][localYi-1] 
              if cubeYNeg == 1 then
                sidesToRender[4] = true
              end
            else
              sidesToRender[4] = true
            end 
                  
            if localZi + 1 <= chunkSettings.depth then
              local cubeZPos = ChunkTable[localXi][localZi+1][localYi] 
              if cubeZPos == 1 then
                sidesToRender[5] = true
              end
            else
                local cubeXPos2 = currentLoadedMap[X][Y+1][localXi][0][localYi]
                if cubeXPos2 == 1 then
                  sidesToRender[5] = true
                else  
                  sidesToRender[5] = false
                end
              --sidesToRender[5] = true --
            end
                  
            if localZi - 1 >= 0 then
              local cubeZNeg = ChunkTable[localXi][localZi-1][localYi] 
              if cubeZNeg == 1 then
                sidesToRender[6] = true
              end
            else
                local cubeXPos2 = currentLoadedMap[X][Y-1][localXi][chunkSettings.depth][localYi]
                if cubeXPos2 == 1 then
                  sidesToRender[6] = true
                else  
                  sidesToRender[6] = false
                end
                
              --sidesToRender[6] = true --rewrite
            end
            
            
            if sidesToRender[6] then -- X+
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              local image = imageSides[6] -- copy sidestorender number
              local imageXDivider = 1/bigImageSize.x
              local imageYDivider = 1/bigImageSize.y
              local imageXCoord = images[image][3]
              local imageYCoord = images[image][4]
              
              local imageStartNumberX = (imageXDivider) * (imageXCoord + 0) -- replaces 0 for x coord
              local imageStartNumberY = (imageYDivider) * (imageYCoord + 0) -- replaces 0 for y coord

              local imageEndNumberX = (imageXDivider) * (imageXCoord + 1)  -- replaces 1 for x coord
              local imageEndNumberY = (imageYDivider) * (imageYCoord + 1) -- replaces 1 for y coord

              
              --triangleCount = triangleCount + 2
              
              vertexTable[(triangleCount*9) + 0] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 1] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageEndNumberY
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageStartNumberY
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageEndNumberY
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageStartNumberY
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageEndNumberY
          
              -- Vertex at (0, 0, 1) 
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageStartNumberY
              
              
              triangleCount = triangleCount + 1 
              
              
            end
            if sidesToRender[5] then -- X-
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              local image = imageSides[5] -- copy sidestorender number
              local imageXDivider = 1/bigImageSize.x
              local imageYDivider = 1/bigImageSize.y
              local imageXCoord = images[image][3]
              local imageYCoord = images[image][4]
              
              local imageStartNumberX = (imageXDivider) * (imageXCoord + 0) -- replaces 0 for x coord
              local imageStartNumberY = (imageYDivider) * (imageYCoord + 0) -- replaces 0 for y coord

              local imageEndNumberX = (imageXDivider) * (imageXCoord + 1)  -- replaces 1 for x coord
              local imageEndNumberY = (imageYDivider) * (imageYCoord + 1) -- replaces 1 for y coord

              
              --triangleCount = triangleCount + 2      
              
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageStartNumberY
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageEndNumberY
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageEndNumberY
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 1] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageEndNumberY
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageStartNumberY
          
              -- Vertex at (0, 0, 1)
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageStartNumberY
              
              
              triangleCount = triangleCount + 1 
              
              
              
            end
            if sidesToRender[3] then -- Y+
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              --Tri1
              -- Vertex at (0, 0, 0)
             -- localXi = 0
             -- localZi = 0
              
              local image = imageSides[3] -- copy sidestorender number
              local imageXDivider = 1/bigImageSize.x
              local imageYDivider = 1/bigImageSize.y
              local imageXCoord = images[image][3]
              local imageYCoord = images[image][4]
              
              local imageStartNumberX = (imageXDivider) * (imageXCoord + 0) -- replaces 0 for x coord
              local imageStartNumberY = (imageYDivider) * (imageYCoord + 0) -- replaces 0 for y coord

              local imageEndNumberX = (imageXDivider) * (imageXCoord + 1)  -- replaces 1 for x coord
              local imageEndNumberY = (imageYDivider) * (imageYCoord + 1) -- replaces 1 for y coord


              vertexTable[(triangleCount*9) + 0] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageStartNumberY
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageEndNumberY
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageStartNumberY 
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageEndNumberY
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageStartNumberY
          
              -- Vertex at (0, 0, 1)
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageEndNumberY
              
              
              triangleCount = triangleCount + 1    
              
            end
            if sidesToRender[4] then -- Y-
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              local image = imageSides[4] -- copy sidestorender number
              local imageXDivider = 1/bigImageSize.x
              local imageYDivider = 1/bigImageSize.y
              local imageXCoord = images[image][3]
              local imageYCoord = images[image][4]
              
              local imageStartNumberX = (imageXDivider) * (imageXCoord + 0) -- replaces 0 for x coord
              local imageStartNumberY = (imageYDivider) * (imageYCoord + 0) -- replaces 0 for y coord

              local imageEndNumberX = (imageXDivider) * (imageXCoord + 1)  -- replaces 1 for x coord
              local imageEndNumberY = (imageYDivider) * (imageYCoord + 1) -- replaces 1 for y coord

              
               --Tri1
              -- Vertex at (0, 0, 0)
             -- localXi = 0
             -- localZi = 0
              
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageStartNumberY
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageEndNumberY
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageStartNumberY
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 0+ (localXi)
              vertexTable[(triangleCount*9) + 1] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageEndNumberY
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = -1  + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageStartNumberY
          
              -- Vertex at (0, 0, 1)
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageEndNumberY
              
              
              triangleCount = triangleCount + 1    
              
              --triangleCount = triangleCount + 2            
            end
            if sidesToRender[2] then -- Z+
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              local image = imageSides[2] -- copy sidestorender number
              local imageXDivider = 1/bigImageSize.x
              local imageYDivider = 1/bigImageSize.y
              local imageXCoord = images[image][3]
              local imageYCoord = images[image][4]
              
              local imageStartNumberX = (imageXDivider) * (imageXCoord + 0) -- replaces 0 for x coord
              local imageStartNumberY = (imageYDivider) * (imageYCoord + 0) -- replaces 0 for y coord

              local imageEndNumberX = (imageXDivider) * (imageXCoord + 1)  -- replaces 1 for x coord
              local imageEndNumberY = (imageYDivider) * (imageYCoord + 1) -- replaces 1 for y coord

              
              --triangleCount = triangleCount + 2 
              
                                          --Tri1
              -- Vertex at (0, 0, 0)
             -- localXi = 0
             -- localZi = 0
              
              vertexTable[(triangleCount*9) + 0] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 1] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageEndNumberY
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageStartNumberY
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageStartNumberY 
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageStartNumberY
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = -1  + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageEndNumberY
          
              -- Vertex at (0, 0, 1)
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageEndNumberY
              
              
              triangleCount = triangleCount + 1    
              
            end
            if sidesToRender[1] then -- Z-
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              local image = imageSides[1] -- copy sidestorender number
              local imageXDivider = 1/bigImageSize.x
              local imageYDivider = 1/bigImageSize.y
              local imageXCoord = images[image][3]
              local imageYCoord = images[image][4]
              
              local imageStartNumberX = (imageXDivider) * (imageXCoord + 0) -- replaces 0 for x coord
              local imageStartNumberY = (imageYDivider) * (imageYCoord + 0) -- replaces 0 for y coord

              local imageEndNumberX = (imageXDivider) * (imageXCoord + 1)  -- replaces 1 for x coord
              local imageEndNumberY = (imageYDivider) * (imageYCoord + 1) -- replaces 1 for y coord

              
                            --Tri1
              -- Vertex at (0, 0, 0)
             -- localXi = 0
             -- localZi = 0
              
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageStartNumberY
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageEndNumberY
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageStartNumberY 
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = imageEndNumberX
              textureCoordTable[(triangleCount*6) + 1] = imageEndNumberY
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0  + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 3] = imageStartNumberY
          
              -- Vertex at (0, 0, 1)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = -1 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = imageStartNumberX
              textureCoordTable[(triangleCount*6) + 5] = imageEndNumberY
              
              
              triangleCount = triangleCount + 1    
              
              --triangleCount = triangleCount + 2           
            end
          end
        end
        --threadsCompleted = threadsCompleted + 1
      --end)
      --coroutine.resume(threadYAxis)
    end
  end
  
 -- while threadsCompleted < threadsMade do
    
 -- end
  
-- We know triangle count now as 2 per plane
  --print("RAYLIB 5.5 CRASHES ABOVE HERE")

local generatedMesh = rl.new("Mesh")
generatedMesh.triangleCount = triangleCount
generatedMesh.vertexCount = triangleCount * 3

--local sizeOfFloat = 16 -- sizeof(float)

generatedMesh.vertices = ffi.new("float[" .. (triangleCount * 3 * 3) .. "]", {})
generatedMesh.normals = ffi.new("float[" .. (triangleCount * 3 * 3) .. "]", {})
generatedMesh.texcoords = ffi.new("float[" .. (triangleCount * 2 * 3) .. "]", {})

for i, vertex in pairs(vertexTable) do
  generatedMesh.vertices[i] = vertex
end

for i, normal in pairs(normalTable) do
  generatedMesh.normals[i] = normal
end

for i, texCoord in pairs(textureCoordTable) do
  generatedMesh.texcoords[i] = texCoord
end

if not currentLoadedMapMeshes then
  currentLoadedMapMeshes = {}
end

if not currentLoadedMapMeshes[X] then
  currentLoadedMapMeshes[X] = {}
end

if not currentLoadedMapMeshes[X][Y] then
  currentLoadedMapMeshes[X][Y] = {}
end

currentLoadedMapMeshes[X][Y] = generatedMesh

rl.UploadMesh(generatedMesh, false)
end

function chunkGeneration(X,Y, renderMesh)
  local localChunk = {}

  for localX = 0, chunkSettings.depth, 1 do
    if not localChunk[localX] then
      localChunk[localX] = {}
    end
    
    for localZ = 0, chunkSettings.width, 1 do
      if not localChunk[localX][localZ] then
        localChunk[localX][localZ] = {}
      end
      for localY = 0, chunkSettings.maxHeight, 1 do
        
        if localY == 0 then
          localChunk[localX][localZ][localY] = 9
        elseif localY < 60 then
          localChunk[localX][localZ][localY] = 8
        elseif localY < 64 then
          localChunk[localX][localZ][localY] = 2
        
        else
          
          if localY == 64 then
            localChunk[localX][localZ][localY] = 3
          else
            localChunk[localX][localZ][localY] = 1
          end
        

        end
    
      end
    end
  end


  if not currentLoadedMap[X] then
    currentLoadedMap[X] = {}
  end
  if not currentLoadedMap[X][Y] then
    currentLoadedMap[X][Y] = {}
  end
  
  currentLoadedMap[X][Y] = localChunk
  
  if renderMesh then
    chunkMeshGenerator(X,Y)
  end
  
end


local cubeMesh = rl.GenMeshCube(1,1,1)
local planeMesh = rl.GenMeshPlane(1,1,1,1)


local defaultMaterial = rl.LoadMaterialDefault()

rl.SetMaterialTexture(defaultMaterial, rl.MATERIAL_MAP_DIFFUSE, bigImage)

function renderMapMeshes()
  for chunkXi, chunkY in pairs(currentLoadedMapMeshes) do
    for chunkYi, generatedMesh in pairs(chunkY) do
      local meshPosition = rl.new("Vector3",(chunkXi-0.5) * (chunkSettings.width+1),0,(chunkYi-0.5) * (chunkSettings.depth+1) )

      local matrixTransformation = rl.new("Matrix",
        1,0,0,math.floor(meshPosition.x + 0.5),
        0,1,0,math.floor(meshPosition.y + 0.5),
        0,0,1,math.floor(meshPosition.z + 0.5),
        0,0,0,1)
      
      --rl.DrawModel(rl.LoadModelFromMesh(generatedMesh), meshPosition, 1, rl.new("Color",0,0,0))

      rl.DrawMesh(generatedMesh, defaultMaterial, matrixTransformation)
      
      
    end
  end
end

function renderMapBasic()
    --local cubePosition = rl.new("Vector3",0,4,0)
   -- local matrixTransformation = rl.new("Matrix",1,0,0,0,0,1,0,0,0,0,1,0,cubePosition.x,cubePosition.y,cubePosition.z,1)
   -- rl.DrawMesh(cubeMesh, defaultMaterial , matrixTransformation)
   
    local blockCounters = {
     Air = 0,
     Dirt = 0,
      }
 
   
   
       for chunkXi, chunkX in pairs(currentLoadedMap) do
        for chunkYi, chunkY in pairs(chunkX) do
          for localXi = 0, chunkSettings.width, 1 do -- cube
            for localZi = 0, chunkSettings.depth, 1 do 
              for localYi = 0, chunkSettings.maxHeight, 1 do
                local cube = chunkY[localXi][localZi][localYi]  

                if cube == 0 then
                   -- air
                  blockCounters.Air = blockCounters.Air + 1

                elseif cube == 1 then  
                  blockCounters.Dirt = blockCounters.Dirt + 1
                else
                  
                end
                
              end
            end
          end
        end
      end
      
    local blockMatricesOld = {
     Air = rl.new("Matrix", blockCounters.Air * 16 ),
     Dirt = rl.new("Matrix", blockCounters.Dirt * 16 ),
      }
          --Matrix *transforms = (Matrix *)RL_CALLOC(MAX_INSTANCES, sizeof(Matrix))

    local blockMatrices = {
     Air = ffi.new("Matrix[" .. (blockCounters.Air * 1) .. "]", {}),
     Dirt = ffi.new("Matrix[" .. (blockCounters.Dirt * 1) .. "]", {}),
    }
    local blockMatricesCounter = {
     Air = 0,
     Dirt = 0,
    }
    
    for chunkXi, chunkX in pairs(currentLoadedMap) do
      for chunkYi, chunkY in pairs(chunkX) do
        for localXi = 0, chunkSettings.width, 1 do -- cube
          for localZi = 0, chunkSettings.depth, 1 do 
              for localYi = 0, chunkSettings.maxHeight, 1 do
                
                --error(localXi)
                
                --print("Coordinates Gathered: " .. localXi .. localYi .. localZi )
                
               -- print(localXi .. "/" .. localYi .. "/" .. localZi)
                
                local cube = chunkY[localXi][localZi][localYi]  
                
                local cubePosition = rl.new("Vector3",localXi + ((chunkSettings.width + 1) * chunkXi) ,localYi,localZi + ((chunkSettings.depth + 1) * chunkYi))
                
              
                local matrixTransformation = rl.new("Matrix",
                  1,0,0,cubePosition.x,
                  0,1,0,cubePosition.y,
                  0,0,1,cubePosition.z,
                  0,0,0,1)
                
                local cubeMaterial
                local meshToUse
                local shape = "Cube"
                local render = false
                local renderAsSides = false
                local sidesToRender = {false,false,false,false,false,false}
                -- XX YY ZZ
                -- +- +- +-
                if cube == 0 then
                   -- air
                elseif cube == 1 then  
                    --dirt
                    render = true
                    cubeMaterial = defaultMaterial
                    meshToUse = cubeMesh
                    renderAsSides = true
                   -- blockMatrices.Dirt[blockCounters.Dirt] = matrixTransformation
                    --blockCounters.Dirt = blockCounters.Dirt + 1
                else
                  --print(cube)
                    
                end
                
                if render then
                  --basic culling to determine if the block can be seen
                  
             -- local sidesToRender = {false,false,false,false,false,false}
                -- XX YY ZZ
                -- +- +- +-    
                  if localXi + 1 <= chunkSettings.width then
                    local cubeXPos = chunkY[localXi+1][localZi][localYi] 
                    if cubeXPos == 0 then
                    sidesToRender[1] = true
                    end
                  else
                    sidesToRender[1] = true
                  end
                
                  if localXi - 1 >= 0 then
                    local cubeXNeg = chunkY[localXi-1][localZi][localYi] 
                    if cubeXNeg == 0 then
                    sidesToRender[2] = true
                    end
                  else
                    sidesToRender[2] = true
                  end 
                
                  if localYi + 1 <= chunkSettings.maxHeight then
                    local cubeYPos = chunkY[localXi][localZi][localYi+1] 
                    if cubeYPos == 0 then
                    sidesToRender[3] = true
                    end
                  else
                    sidesToRender[3] = true
                  end
                  
                  if localYi - 1 >= 0 then
                    local cubeYNeg = chunkY[localXi][localZi][localYi-1] 
                    if cubeYNeg == 0 then
                    sidesToRender[4] = true
                    end
                  else
                    sidesToRender[4] = true
                  end 
                  
               if localZi + 1 <= chunkSettings.depth then
                    local cubeZPos = chunkY[localXi][localZi+1][localYi] 
                    if cubeZPos == 0 then
                    sidesToRender[5] = true
                    end
                  else
                    sidesToRender[5] = true
                  end
                  
                  if localZi - 1 >= 0 then
                    local cubeZNeg = chunkY[localXi][localZi-1][localYi] 
                    if cubeZNeg == 0 then
                    sidesToRender[6] = true
                    end
                  else
                    sidesToRender[6] = true
                  end 
                  
                  
                  local notCulled = true
                  
                  if not sidesToRender[1] and not sidesToRender[2] and not sidesToRender[3] and not sidesToRender[4] and not sidesToRender[5] and not sidesToRender[6] then
                    notCulled = false
                  end

                  if notCulled then -- simple cube culling
                    --rl.DrawMesh(meshToUse, cubeMaterial , matrixTransformation)
                    --counter = counter + 1
                  end
                  
                  
                  
                  
                  if notCulled then -- go to plane culling here
                    
                     if sidesToRender[1] then -- X+
                      local actualMatrix
                      local matrixTransformationPlane = rl.new("Matrix",
                          0,0,0,cubePosition.x + 0.5,
                          0,0,0,cubePosition.y,
                          0,0,0,cubePosition.z,
                          0,0,0,0)
                      local matrixIdentity = rl.new("Matrix",
                          1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1)
                      local rotation = rl.MatrixRotate(rl.new("Vector3", 0, 0, -1),  PI/2  )
              
                      actualMatrix = rl.MatrixMultiply(matrixIdentity, rotation)
                      actualMatrix = rl.MatrixAdd(actualMatrix, matrixTransformationPlane)
                      
                      blockMatrices.Dirt[blockMatricesCounter.Dirt] = matrixTransformationPlane
                      blockMatricesCounter.Dirt = blockMatricesCounter.Dirt + 1
                      
                      rl.DrawMesh(planeMesh, cubeMaterial, actualMatrix)
                      counter = counter + 1
                    end
                    
                     if sidesToRender[2] then -- X-
                      local actualMatrix
                      local matrixTransformationPlane = rl.new("Matrix",
                          0,0,0,cubePosition.x -0.5,
                          0,0,0,cubePosition.y,
                          0,0,0,cubePosition.z,
                          0,0,0,0)
                      local matrixIdentity = rl.new("Matrix",
                          1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1)
                      local rotation = rl.MatrixRotate(rl.new("Vector3", 0, 0, 1),  PI/2  )
              
                      actualMatrix = rl.MatrixMultiply(matrixIdentity, rotation)
                      actualMatrix = rl.MatrixAdd(actualMatrix, matrixTransformationPlane)
                        
                      blockMatrices.Dirt[blockMatricesCounter.Dirt] = matrixTransformationPlane
                      blockMatricesCounter.Dirt = blockMatricesCounter.Dirt + 1  
                        
                     rl.DrawMesh(planeMesh, cubeMaterial, actualMatrix)
                      counter = counter + 1
                    end
                    
                    
                    if sidesToRender[3] then -- top
                      local matrixTransformationPlane = rl.new("Matrix",
                          1,0,0,cubePosition.x,
                          0,1,0,cubePosition.y +0.5,
                          0,0,1,cubePosition.z,
                          0,0,0,1)
                
                      rl.DrawMesh(planeMesh, cubeMaterial, matrixTransformationPlane)
                      counter = counter + 1
                      blockMatrices.Dirt[blockMatricesCounter.Dirt] = matrixTransformationPlane
                      blockMatricesCounter.Dirt = blockMatricesCounter.Dirt + 1
                    end
                    
                    if sidesToRender[4] then -- bottom
                      local actualMatrix
                      local matrixTransformationPlane = rl.new("Matrix",
                          0,0,0,cubePosition.x,
                          0,0,0,cubePosition.y -0.5,
                          0,0,0,cubePosition.z,
                          0,0,0,0)
                      local matrixIdentity = rl.new("Matrix",
                          1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1)
                      local rotation = rl.MatrixRotate(rl.new("Vector3",1,0,0),  PI  )
              
                      actualMatrix = rl.MatrixMultiply(matrixIdentity, rotation)
                      actualMatrix = rl.MatrixAdd(actualMatrix, matrixTransformationPlane)
                        
                      blockMatrices.Dirt[blockMatricesCounter.Dirt] = matrixTransformationPlane
                      blockMatricesCounter.Dirt = blockMatricesCounter.Dirt + 1  
                        
                      rl.DrawMesh(planeMesh, cubeMaterial, actualMatrix)
                      counter = counter + 1
                    end
                    
                    
                     if sidesToRender[5] then -- Z+
                      local actualMatrix
                      local matrixTransformationPlane = rl.new("Matrix",
                          0,0,0,cubePosition.x,
                          0,0,0,cubePosition.y,
                          0,0,0,cubePosition.z + 0.5,
                          0,0,0,0)
                      local matrixIdentity = rl.new("Matrix",
                          1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1)
                      local rotation = rl.MatrixRotate(rl.new("Vector3", 1, 0, 0),  PI/2  )
              
                      actualMatrix = rl.MatrixMultiply(matrixIdentity, rotation)
                      actualMatrix = rl.MatrixAdd(actualMatrix, matrixTransformationPlane)
                        
                      blockMatrices.Dirt[blockMatricesCounter.Dirt] = matrixTransformationPlane
                      blockMatricesCounter.Dirt = blockMatricesCounter.Dirt + 1 
                        
                     rl.DrawMesh(planeMesh, cubeMaterial, actualMatrix)
                      counter = counter + 1
                    end
                    
                     if sidesToRender[6] then -- Z-
                      local actualMatrix
                      local matrixTransformationPlane = rl.new("Matrix",
                          0,0,0,cubePosition.x,
                          0,0,0,cubePosition.y,
                          0,0,0,cubePosition.z -0.5,
                          0,0,0,0)
                      local matrixIdentity = rl.new("Matrix",
                          1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,0,0,1)
                      local rotation = rl.MatrixRotate(rl.new("Vector3", -1, 0, 0),  PI/2  )
              
                      actualMatrix = rl.MatrixMultiply(matrixIdentity, rotation)
                      actualMatrix = rl.MatrixAdd(actualMatrix, matrixTransformationPlane)
                        
                      blockMatrices.Dirt[blockMatricesCounter.Dirt] = matrixTransformationPlane
                      blockMatricesCounter.Dirt = blockMatricesCounter.Dirt + 1 
                        
                      rl.DrawMesh(planeMesh, cubeMaterial, actualMatrix)
                     counter = counter + 1
                    end
                    
                    
                    
                    
                  end
                  
                  
                end
            end
          end
        end
      end
    end
    
    


end

local mouseSensitivity = 100
local debugText = ""

local tempVar

function handlePlayerInput()
  local localPlayer = playerInfos.Player1
  local mouseDelta = rl.GetMouseDelta()
  local newXRotation = playerInfos.Player1.Rotation.x + (mouseDelta.x * mouseSensitivity/ gameSettings.WindowResolution.x)
  local newYRotation = playerInfos.Player1.Rotation.y + (mouseDelta.y * mouseSensitivity/ gameSettings.WindowResolution.y)

  --playerInfos.Player1.Rotation = rl.new("Vector2", newXRotation, newYRotation)
  --playerInfos.Player1.Camera.target = rl.new("Vector3", math.sin(newXRotation), -newYRotation, math.cos(newXRotation) )
  --debugText = tostring(playerInfos.Player1.Rotation)
    local deltaTime = rl.GetFrameTime()
    local flyMultiplier = 100
  
            if rl.IsKeyDown(rl.KEY_T) then
              playerInfos.Player1.Camera.position = playerInfos.Player1.Camera.position + rl.new("Vector3",0,flyMultiplier*deltaTime,0)
            end
            
            if rl.IsKeyDown(rl.KEY_G) then
               playerInfos.Player1.Camera.position = playerInfos.Player1.Camera.position + rl.new("Vector3",0,-flyMultiplier*deltaTime,0)
            end
            
            
  if rl.IsKeyDown(rl.KEY_ONE) then
    localPlayer.SelectedSlot = 1
  end
  if rl.IsKeyDown(rl.KEY_TWO) then
    localPlayer.SelectedSlot = 2
  end
  if rl.IsKeyDown(rl.KEY_THREE) then
    localPlayer.SelectedSlot = 3
  end
  if rl.IsKeyDown(rl.KEY_FOUR) then
    localPlayer.SelectedSlot = 4
  end
  if rl.IsKeyDown(rl.KEY_FIVE) then
    localPlayer.SelectedSlot = 5
  end
  if rl.IsKeyDown(rl.KEY_SIX) then
    localPlayer.SelectedSlot = 6
  end
  if rl.IsKeyDown(rl.KEY_SEVEN) then
    localPlayer.SelectedSlot = 7
  end
  if rl.IsKeyDown(rl.KEY_EIGHT) then
    localPlayer.SelectedSlot = 8
  end
  if rl.IsKeyDown(rl.KEY_NINE) then
    localPlayer.SelectedSlot = 9
  end

  if rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_LEFT) then    
    local centerScreen = rl.new("Vector2",gameSettings.WindowResolution.x/2, gameSettings.WindowResolution.y/2)
    local ray = rl.GetMouseRay(centerScreen, localPlayer.Camera)
    local maxRange = 10
    local currentDistance = maxRange
    local bestCollisionInfo 
    local chunkToEditX
    local chunkToEditY

    for chunkXi, chunkY in pairs(currentLoadedMapMeshes) do
      for chunkYi, generatedMesh in pairs(chunkY) do
       local meshPosition = rl.new("Vector3",(chunkXi-0.5) * (chunkSettings.width+1),0,(chunkYi-0.5) * (chunkSettings.depth+1) )

      local matrixTransformation = rl.new("Matrix",
        1,0,0,math.floor(meshPosition.x + 0.5),
        0,1,0,math.floor(meshPosition.y + 0.5),
        0,0,1,math.floor(meshPosition.z + 0.5),
        0,0,0,1)
      
        --rl.DrawMesh(generatedMesh, defaultMaterial, matrixTransformation)
        
      local meshHitInfo = rl.GetRayCollisionMesh(ray, generatedMesh, matrixTransformation)
      
      if meshHitInfo.hit and meshHitInfo.distance < currentDistance then
        currentDistance = meshHitInfo.distance
        bestCollisionInfo = meshHitInfo
        chunkToEditX = chunkXi
        chunkToEditY = chunkYi
      end
      
    end
  end
  tempVar = bestCollisionInfo

  
  if currentDistance ~= maxRange then
    print("Last Hit was: " .. currentDistance .. " units away.") -- use - below to go into the block
    local localXCoord = (math.floor( (bestCollisionInfo.point.x - (bestCollisionInfo.normal.x/2) ) + 0) + (chunkSettings.width/2)) % (chunkSettings.width + 1 )
    local localYCoord = math.floor( (bestCollisionInfo.point.y - (bestCollisionInfo.normal.y/2) ) + 1)
    local localZCoord = (math.floor( (bestCollisionInfo.point.z - (bestCollisionInfo.normal.z/2) ) + 0) + (chunkSettings.depth/2)) % (chunkSettings.depth + 1 )
    
    --localXCoord = chunkSettings.width - localXCoord -- flip em
    --localZCoord = chunkSettings.depth - localXCoord

    --print(chunkToEditX)
    --print(chunkToEditY)
    --print(localXCoord)
    --print(localYCoord)
    --print(localZCoord)
    --print("//")
    --print(bestCollisionInfo.normal.x)
    --print(bestCollisionInfo.normal.y)
    --print(bestCollisionInfo.normal.z)

    if not currentLoadedMap[chunkToEditX] then
      print("BAD1")    
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY] then
      print("BAD2")
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord] then
      print("BAD3") -- apparently this triggers
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord][localZCoord] then
      print("BAD4")
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord][localZCoord][localYCoord] then
      print("BAD5")
    else
      currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord][localZCoord][localYCoord] = 1
      chunkMeshGenerator(chunkToEditX,chunkToEditY)
  
    end


  else
    print("Last Hit didnt hit anything.")
  
  end
  
    --local meshHitInfo = rl.GetRayCollisionMesh(ray, tower.meshes[m], tower.transform)
    --.hit -- .distance
    
  end
  
  if rl.IsMouseButtonPressed(rl.MOUSE_BUTTON_RIGHT) then    
    local centerScreen = rl.new("Vector2",gameSettings.WindowResolution.x/2, gameSettings.WindowResolution.y/2)
    local ray = rl.GetMouseRay(centerScreen, localPlayer.Camera)
    local maxRange = 10
    local currentDistance = maxRange
    local bestCollisionInfo 
    local chunkToEditX
    local chunkToEditY

    
    for chunkXi, chunkY in pairs(currentLoadedMapMeshes) do
      for chunkYi, generatedMesh in pairs(chunkY) do
       local meshPosition = rl.new("Vector3",(chunkXi-0.5) * (chunkSettings.width+1),0,(chunkYi-0.5) * (chunkSettings.depth+1) )

      local matrixTransformation = rl.new("Matrix",
        1,0,0,math.floor(meshPosition.x + 0.5),
        0,1,0,math.floor(meshPosition.y + 0.5),
        0,0,1,math.floor(meshPosition.z + 0.5),
        0,0,0,1)
      
        --rl.DrawMesh(generatedMesh, defaultMaterial, matrixTransformation)
        
      local meshHitInfo = rl.GetRayCollisionMesh(ray, generatedMesh, matrixTransformation)
      
      if meshHitInfo.hit and meshHitInfo.distance < currentDistance then
        currentDistance = meshHitInfo.distance
        bestCollisionInfo = meshHitInfo
        chunkToEditX = chunkXi
        chunkToEditY = chunkYi
      end
      
    end
  end
  tempVar = bestCollisionInfo

  
  if currentDistance ~= maxRange then
    print("Last Hit was: " .. currentDistance .. " units away.") -- use - below to go into the block
    local localXCoord = (math.floor( (bestCollisionInfo.point.x + (bestCollisionInfo.normal.x/2) ) + 0) + (chunkSettings.width/2)) % (chunkSettings.width + 1 )
    local localYCoord = math.floor( (bestCollisionInfo.point.y + (bestCollisionInfo.normal.y/2) ) + 1)
    local localZCoord = (math.floor( (bestCollisionInfo.point.z + (bestCollisionInfo.normal.z/2) ) + 0) + (chunkSettings.depth/2)) % (chunkSettings.width + 1 )
    
    --localXCoord = chunkSettings.width - localXCoord -- flip em
    --localZCoord = chunkSettings.depth - localXCoord

    --print(chunkToEditX)
    --print(chunkToEditY)
    --print(localXCoord)
    --print(localYCoord)
    --print(localZCoord)
    --print("//")
    --print(bestCollisionInfo.normal.x)
    --print(bestCollisionInfo.normal.y)
    --print(bestCollisionInfo.normal.z)

    if not currentLoadedMap[chunkToEditX] then
      print("BAD1")    
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY] then
      print("BAD2")
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord] then
      print("BAD3") -- apparently this triggers
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord][localZCoord] then
      print("BAD4")
    elseif not currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord][localZCoord][localYCoord] then
      print("BAD5")
    else
      local placedItem 
      local placedItemNumber = 2
      
      local blockInfoFoundTable
      local blockInfoFoundTablei

    local localPlayer = playerInfos.Player1

    local slotUsed = localPlayer.SelectedSlot
    local currentItem = localPlayer.Toolbar[slotUsed]
    local itemName = currentItem[1]
    local itemAmount = currentItem[2]
      

      for i, blockInfoT in pairs(blockInfos) do
        if blockInfoT[1] == itemName then
          blockInfoFoundTable = blockInfoT
          blockInfoFoundTablei = i
        end
      end
      
      placedItemNumber = blockInfoFoundTablei
      
      if blockInfoFoundTable then
        currentLoadedMap[chunkToEditX][chunkToEditY][localXCoord][localZCoord][localYCoord] = placedItemNumber
        chunkMeshGenerator(chunkToEditX,chunkToEditY)
      end
      
    end


  else
    print("Last Hit didnt hit anything.")
  
  end
  
    --local meshHitInfo = rl.GetRayCollisionMesh(ray, tower.meshes[m], tower.transform)
    --.hit -- .distance
    
  end       
            
end 

rl.DisableCursor()

function singularCubeRender()
                 local cubePosition = rl.new("Vector3",0,0,0)

                  local matrixTransformation = rl.new("Matrix",1,0,0,0,0,1,0,0,0,0,1,0,cubePosition.x,cubePosition.y,cubePosition.z,1)

    rl.DrawMesh(cubeMesh, defaultMaterial , matrixTransformation)
end

local uiTextures = {
  ToolbarBox = rl.LoadTexture("Assets/ToolbarSlot.png"),
  ToolbarBoxSelected = rl.LoadTexture("Assets/ToolbarSlotSelected.png"),
  
  }

function drawHUD(playerNumber)
  --Draw crosshair
  
  local playerCountLocalPlayers = 1
  if gameSettings.runSplitscreen then
    playerCountLocalPlayers = gameSettings.localPlayerCount
  end
     
  local localResInfo = splitscreenWindowLocations["Count" .. playerCountLocalPlayers]["Player" .. playerNumber]
    
  
  local crosshairSize = 20
  local crosshairSize2 = 2
  local centerScreenX = localResInfo.EndX - (localResInfo.Width / 2)
  local centerScreenY = localResInfo.EndY - (localResInfo.Height / 2)
  local selectionIncreasePixels = 2

  rl.DrawLineEx(rl.new("Vector2",centerScreenX - crosshairSize2,centerScreenY), rl.new("Vector2",centerScreenX + crosshairSize2,centerScreenY), crosshairSize, rl.WHITE)
  rl.DrawLineEx(rl.new("Vector2",centerScreenX, centerScreenY - crosshairSize2), rl.new("Vector2",centerScreenX,centerScreenY + crosshairSize2), crosshairSize, rl.WHITE)

  --Toolbar
  local localPlayer = playerInfos["Player" .. playerNumber]

  local toolBarOGResX = 32
  local toolBarOGResY = 32
  local toolbarScale = 2
  local UIGap = 10
  
  local toolBarResX = toolBarOGResX * toolbarScale
  local toolBarResY = toolBarOGResY * toolbarScale
  local selectionIncreasePixelsScaled = selectionIncreasePixels * toolbarScale
  
  local toolBarXPos = (localResInfo.EndX/2) - (toolBarResX*4.5)
  local slotUsed = localPlayer.SelectedSlot

  local toolbarSelectedV2 
  
  for i = 1, 9, 1 do
    --localPlayer.Toolbar[i]
  
    rl.DrawTextureEx(uiTextures.ToolbarBox, rl.new("Vector2", toolBarXPos,localResInfo.EndY - (toolBarResY + UIGap)), 0, toolbarScale, rl.WHITE)

    local currentItem = localPlayer.Toolbar[i]
    local itemName = currentItem[1]
    local itemAmount = currentItem[2]
      
    if currentItem[1] ~= "Empty" then
      itemName = currentItem[1]
      itemAmount = currentItem[2]
      
      local blockInfoFoundTable
      
      for i, blockInfoT in pairs(blockInfos) do
        if blockInfoT[1] == itemName then
          blockInfoFoundTable = blockInfoT
        end
      end
      
      
      if blockInfoFoundTable then
        --Definitely a real block, time to render in the toolbar.
        rl.DrawTextureEx(images[blockInfoFoundTable[7]][2], rl.new("Vector2", toolBarXPos + 16,localResInfo.EndY - (toolBarResY + UIGap) + 16), 0, toolbarScale/2, rl.WHITE)
        
      else
        print("Oops! " .. itemName)
      end
      
      
    end
    

    if slotUsed == i then
      toolbarSelectedV2 = rl.new("Vector2", toolBarXPos - selectionIncreasePixelsScaled,localResInfo.EndY - (toolBarResY + UIGap + selectionIncreasePixelsScaled))
      rl.DrawTextureEx(uiTextures.ToolbarBoxSelected, toolbarSelectedV2, 0, toolbarScale, rl.WHITE)

    end

--           *text, posX,  posY,  fontSize, color
  local fontSize = 20
  local textLength = rl.MeasureText(tostring(itemAmount), fontSize)
  local borderSize = 1 -- attempt at text border to make it easier to see
  
  if itemAmount ~= 0 then
    
    rl.DrawText( tostring(itemAmount) , toolBarXPos + toolBarResX - textLength - borderSize,localResInfo.EndY - ( (fontSize * 1.2) + UIGap) - borderSize, fontSize + borderSize, rl.BLACK)
    
    --rl.DrawText( tostring(itemAmount) , toolBarXPos + toolBarResX - textLength,gameSettings.WindowResolution.y - ( (fontSize * 1.2) + UIGap), fontSize, rl.RAYWHITE)

  end
    toolBarXPos = toolBarXPos + toolBarResX
  end
  


  --Debug Info
  local localCam = playerInfos.Player1.Camera
  rl.DrawFPS(0,0)

  rl.DrawText("Camera Position: " .. string.format("%.2f",localCam.position.x) .. "/" .. string.format("%.2f",localCam.position.y) .. "/" .. string.format("%.2f",localCam.position.z) , localResInfo.StartX, localResInfo.StartY + 20, 20, rl.BLACK)
  rl.DrawText("Camera Target: " ..string.format("%.2f",localCam.target.x) .. "/" .. string.format("%.2f",localCam.target.y) .. "/" .. string.format("%.2f",localCam.target.z) , localResInfo.StartX, localResInfo.StartY +  40, 20, rl.BLACK)


end

function renderHeldItem()
  local localPlayer = playerInfos.Player1
  local slotSelected = localPlayer.SelectedSlot
  local selectedItem = localPlayer.Toolbar[slotSelected]

  local selectedItemName = localPlayer.Toolbar[slotSelected][1]



  if not heldItemMeshes[selectedItemName] then
    --generate it
    --Determine if its a block, item or empty
    if selectedItemName == "Empty" then
      --Hand
      heldItemMeshes[selectedItemName] = rl.GenMeshCube(0.1,0.4,0.1)
      
    end
    
    
  end
    
  if not heldItemMaterials[selectedItemName] then
    local materialHeld = rl.LoadMaterialDefault()
    rl.SetMaterialTexture(materialHeld, rl.MATERIAL_MAP_DIFFUSE, rl.LoadTextureFromImage(rl.GenImageColor(16,16, rl.BEIGE)) )
    heldItemMaterials[selectedItemName] = materialHeld
    

  end
    
  local meshToRender = heldItemMeshes[selectedItemName]
  local materialHeld =  heldItemMaterials[selectedItemName]
  --local heldMatrix = rl.GetCameraMatrix(localPlayer.Camera) -- update me

  

  --rl.DrawMesh(meshToRender, materialHeld, heldMatrix)


end

function windowDraw()
  --rl.UpdateCamera(playerInfos.Player1.Camera, rl.CAMERA_FIRST_PERSON)

  --rl.BeginDrawing()
  rl.ClearBackground(rl.SKYBLUE)
  --3D
  
  local playerCountLocalPlayers = 1
  if gameSettings.runSplitscreen then
    playerCountLocalPlayers = gameSettings.localPlayerCount
  end
  
      rl.UpdateCamera(playerInfos["Player1"].Camera, rl.CAMERA_FIRST_PERSON)

     
  for i = 1, playerCountLocalPlayers, 1 do
    rl.ClearBackground(rl.SKYBLUE)

    local localResInfo = splitscreenWindowLocations["Count" .. playerCountLocalPlayers]["Player" .. i]
    
    rl.BeginTextureMode(playerInfos["Player" .. i].theRenderTexture)
    rl.ClearBackground(rl.SKYBLUE)

    --print(playerInfos["Player" .. i].theRenderTexture)
    
    local localCam = playerInfos["Player" .. i].Camera
  
    rl.BeginMode3D(localCam)
  
    renderMapMeshes()
    --renderMapBasic()
  
    --rl.DrawGrid(1000, 1);
                
    --renderHeldItem()
          
  --rl.DrawCube(rl.new("Vector3",-1,64,-1), 1, 1, 1, rl.RED);
    
    for i = 1, playerCountLocalPlayers, 1 do
      local position = playerInfos["Player" .. i].Camera.position
      rl.DrawCube(position, 1, 1, 1, rl.RED)
    end
    
    
    if tempVar then
      --rl.DrawCube(tempVar.point, 1.2, 1.2, 1.2, rl.RED);
    end
                
    rl.EndMode3D()
        
    rl.EndTextureMode()
    
  end


  --SplitscreenViewports
  
  rl.BeginDrawing()
  for i = 1, playerCountLocalPlayers, 1 do
    --draw splitscreen players
    local localResInfo = splitscreenWindowLocations["Count" .. playerCountLocalPlayers]["Player" .. i]
    
    rl.DrawTextureRec(playerInfos["Player" .. i].theRenderTexture.texture, playerInfos["Player" .. i].theRenderTextureRect, rl.new("Vector2",localResInfo.StartX, localResInfo.StartY), rl.WHITE);
  end
  
  --2D
  for i = 1, playerCountLocalPlayers, 1 do
    drawHUD(i)
  end

	rl.EndDrawing()
  
  
end


while not rl.WindowShouldClose() do
    
  handlePlayerInput()
  
  if not gameSettings.allowWorldGeneration then
    if not currentLoadedMap[0] or not currentLoadedMap[0][0] then
        chunkGeneration(0,0, true) 
      end  
  else 
    local startTime = rl.GetTime()

    --renderDistance
    local playerXChunk = math.floor( ( (playerInfos.Player1.Camera.position.x + 0) / (chunkSettings.width + 1) ) + 0.5)
    local playerYChunk = math.floor( ( (playerInfos.Player1.Camera.position.z + 0) / (chunkSettings.depth + 1) ) + 0.5)
  
    --print("Current Player Chunk: " .. playerXChunk .. "." .. playerYChunk )
  
    local foundAChunkThisFrame = false
    local exceededRenderDistance = false
    
    local foundChunkX = {}
    local foundChunkY = {}
    local foundChunks = 0
    
    local currentRenderDistanceCheck = 0 
    local currentRenderDistanceTestValueX = 0
    local currentRenderDistanceTestValueY = 0

    while exceededRenderDistance == false and foundAChunkThisFrame == false do
      --print("player" .. playerXChunk .. "/" .. playerYChunk .. "chunk" .. currentRenderDistanceTestValueX .. "/" .. currentRenderDistanceTestValueY)
      
      if not currentLoadedMapMeshes[currentRenderDistanceTestValueX + playerXChunk] or not currentLoadedMapMeshes[currentRenderDistanceTestValueX + playerXChunk][currentRenderDistanceTestValueY + playerYChunk] then
        foundChunkX[foundChunks] = currentRenderDistanceTestValueX + playerXChunk
        foundChunkY[foundChunks] = currentRenderDistanceTestValueY + playerYChunk
        foundChunks = foundChunks + 1
        --foundAChunkThisFrame = true -- replaced for coroutines
      end
      
      if currentRenderDistanceTestValueX == currentRenderDistanceCheck then
        if currentRenderDistanceTestValueY == currentRenderDistanceCheck then
          currentRenderDistanceCheck = currentRenderDistanceCheck + 1
          currentRenderDistanceTestValueX = -currentRenderDistanceCheck
          currentRenderDistanceTestValueY = -currentRenderDistanceCheck

        else
        currentRenderDistanceTestValueY = currentRenderDistanceTestValueY + 1
        currentRenderDistanceTestValueX = -currentRenderDistanceCheck
        end
      
      else
        currentRenderDistanceTestValueX = currentRenderDistanceTestValueX + 1
        
      end
      
      if currentRenderDistanceCheck > gameSettings.renderDistance then
        exceededRenderDistance = true
      end
      
      
    end
    
    local function generateChunkLocalFunc(cX, cY)
      
      if cX == nil then return end
      if cY == nil then return end

      if not currentLoadedMap[cX] or not currentLoadedMap[cX][cY] then
        chunkGeneration(cX,cY, false)
      end
      
      if not currentLoadedMapMeshes[cX] or not currentLoadedMapMeshes[cX][cY] then
        chunkMeshGenerator(cX,cY) -- if unloaded
      end
    end
    
    local coroutineChunkGen = coroutine.create(function(cX, cY)
      generateChunkLocalFunc(cX, cY)
    end)
    
    for i = 0, foundChunks, 1 do
      --generateChunkLocalFunc(foundChunkX[i], foundChunkY[i])
      coroutine.resume(coroutineChunkGen, foundChunkX[i], foundChunkY[i])
    end
    
    --if foundAChunkThisFrame then
    --  if not currentLoadedMap[foundChunkX] or not currentLoadedMap[foundChunkX][foundChunkY] then
    --    chunkGeneration(foundChunkX,foundChunkY)
    --  end
    --end
    
    for xCoord, unusedvar in pairs(currentLoadedMapMeshes) do
      
      if playerXChunk > xCoord + gameSettings.renderDistance or playerXChunk < xCoord - gameSettings.renderDistance then
        for i, tempvar3 in pairs(currentLoadedMapMeshes[xCoord]) do
          --rl.UnloadMesh(currentLoadedMapMeshes[xCoord][i]) -- crashes?
        end
        
        currentLoadedMapMeshes[xCoord] = nil
      else
        for yCoord, unusedvar2 in pairs(currentLoadedMapMeshes[xCoord]) do
          if playerYChunk > yCoord + gameSettings.renderDistance or playerYChunk < yCoord - gameSettings.renderDistance then
            --add unload mesh code
            
            currentLoadedMapMeshes[xCoord][yCoord] = nil

          end
        end
      end
      
    end
    
    --add code to remove old chunks that are too far here
    
    --Now unload chunks that are too far, only unloading meshes for now
    
    
    
    local finalTime = rl.GetTime()
    local takenTime = finalTime - startTime
        
    if foundChunks ~= 0 then
      --print("Time taken to generate chunks: " .. takenTime)
    end
    
  end
  
	windowDraw()
end

rl.CloseWindow()