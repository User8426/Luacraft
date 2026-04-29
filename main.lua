local ffi = require("ffi")

gameSettings = {
  WindowResolution = rl.new("Vector2", 1280,720),
  defaultWindowTitle = "Luacraft",
  targetFPS = 120*10,
  allowWorldGeneration = true, -- false only generates one chunk, at 0,0
  renderDistance = 8,
  }

chunkSettings = {
    maxHeight = 256,
    width = 32,
    depth = 32,
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
    
    
    }
  
  
}

local PI = 3.14159265358979323846

rl.UpdateCamera(playerInfos.Player1.Camera, rl.CAMERA_FIRST_PERSON)

shapeInfos = {
    "Cube",
    
  
}

local appDirectory =  rl.GetApplicationDirectory()

images = {
    Dirt = rl.LoadImage("Assets/Dirt.png")
}


blockInfos = {
    {"Air", false, 0, "", "", "", "", "", ""}, -- Name, Render?, Shape, Up, Down, Left, Right, Forward, Back
    {"Dirt", true, 0, "", "", "", "", "", ""}, -- Name, Render?, Shape, Up, Down, Left, Right, Forward, Back

}

currentLoadedMap = {} -- children are chunks, which then has the info for individual blocks
currentLoadedMapMeshes = {} -- children are chunks, then its a mesh for the chunk

--rl.SetConfigFlags(rl.FLAG_VSYNC_HINT)

rl.InitWindow(gameSettings.WindowResolution.x, gameSettings.WindowResolution.y, gameSettings.defaultWindowTitle)

textures = {
 -- Dirt = rl.LoadImage( appDirectory .. "/Assets/Dirt.png")
    Dirt = rl.LoadTextureFromImage(images.Dirt)
}


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
  
  local ChunkTable = currentLoadedMap[X][Y]
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
          -- XX YY ZZ
          -- +- +- +-
          if cube == 0 then
            -- air
          elseif cube == 1 then  
            --dirt
            render = true
            meshToUse = cubeMesh
            renderAsSides = true
          else
            --print(cube)
      
          end
                
          if render then
            --basic culling to determine if the block can be seen
            -- local sidesToRender = {false,false,false,false,false,false}
            -- XX YY ZZ
            -- +- +- +-    
            if localXi + 1 <= chunkSettings.width then
              local cubeXPos = ChunkTable[localXi+1][localZi][localYi] 
              if cubeXPos == 0 then
                sidesToRender[1] = true
              end
            else
              sidesToRender[1] = true
            end
                
            if localXi - 1 >= 0 then
              local cubeXNeg = ChunkTable[localXi-1][localZi][localYi] 
              if cubeXNeg == 0 then
                sidesToRender[2] = true
              end
            else
              sidesToRender[2] = true
            end 
                
            if localYi + 1 <= chunkSettings.maxHeight then
              local cubeYPos = ChunkTable[localXi][localZi][localYi+1] 
              if cubeYPos == 0 then
                sidesToRender[3] = true
              end
            else
              sidesToRender[3] = true
            end
                  
            if localYi - 1 >= 0 then
              local cubeYNeg = ChunkTable[localXi][localZi][localYi-1] 
              if cubeYNeg == 0 then
                sidesToRender[4] = true
              end
            else
              sidesToRender[4] = true
            end 
                  
            if localZi + 1 <= chunkSettings.depth then
              local cubeZPos = ChunkTable[localXi][localZi+1][localYi] 
              if cubeZPos == 0 then
                sidesToRender[5] = true
              end
            else
              sidesToRender[5] = true
            end
                  
            if localZi - 1 >= 0 then
              local cubeZNeg = ChunkTable[localXi][localZi-1][localYi] 
              if cubeZNeg == 0 then
                sidesToRender[6] = true
              end
            else
              sidesToRender[6] = true
            end
            
            
            if sidesToRender[1] then -- X+
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              --triangleCount = triangleCount + 2
            end
            if sidesToRender[2] then -- X-
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              --triangleCount = triangleCount + 2           
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
              
              vertexTable[(triangleCount*9) + 0] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 0 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = 0
              textureCoordTable[(triangleCount*6) + 1] = 0
          
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 3] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 1 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = 1
              textureCoordTable[(triangleCount*6) + 3] = 1
          
              -- Vertex at (1, 0, 0)
              vertexTable[(triangleCount*9) + 6] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 0 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = 1
              textureCoordTable[(triangleCount*6) + 5] = 0 
              
              triangleCount = triangleCount + 1    
              --Tri2
              -- Vertex at (1, 0, 1)
              vertexTable[(triangleCount*9) + 0] = 1 + (localXi)
              vertexTable[(triangleCount*9) + 1] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 2] = 1 + (localZi)
              normalTable[(triangleCount*9) + 0] = 0
              normalTable[(triangleCount*9) + 1] = 1
              normalTable[(triangleCount*9) + 2] = 0
              textureCoordTable[(triangleCount*6) + 0] = 1
              textureCoordTable[(triangleCount*6) + 1] = 1
          
              -- Vertex at (0, 0, 0)
              vertexTable[(triangleCount*9) + 3] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 4] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 5] = 0 + (localZi)
              normalTable[(triangleCount*9) + 3] = 0
              normalTable[(triangleCount*9) + 4] = 1
              normalTable[(triangleCount*9) + 5] = 0
              textureCoordTable[(triangleCount*6) + 2] = 0
              textureCoordTable[(triangleCount*6) + 3] = 0
          
              -- Vertex at (0, 0, 1)
              vertexTable[(triangleCount*9) + 6] = 0 + (localXi)
              vertexTable[(triangleCount*9) + 7] = 0 + (localYi)
              vertexTable[(triangleCount*9) + 8] = 1 + (localZi)
              normalTable[(triangleCount*9) + 6] = 0
              normalTable[(triangleCount*9) + 7] = 1
              normalTable[(triangleCount*9) + 8] = 0
              textureCoordTable[(triangleCount*6) + 4] = 0
              textureCoordTable[(triangleCount*6) + 5] = 1
              
              
              triangleCount = triangleCount + 1    
              
            end
            if sidesToRender[4] then -- Y-
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              --triangleCount = triangleCount + 2            
            end
            if sidesToRender[5] then -- Z+
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
              --triangleCount = triangleCount + 2            
            end
            if sidesToRender[6] then -- Z-
              --generate side and input in tables
              --vertexTable
              --normalTable
              --textureCoordTable
              
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

local generatedMesh = rl.new("Mesh")
generatedMesh.triangleCount = triangleCount
generatedMesh.vertexCount = triangleCount * 3

--local sizeOfFloat = 16 -- sizeof(float)

generatedMesh.vertices = ffi.new("float[" .. (triangleCount * 3 * 3) .. "]", {})
generatedMesh.normals = ffi.new("float[" .. (triangleCount * 3 * 3) .. "]", {})
generatedMesh.texcoords = ffi.new("float[" .. (triangleCount * 2 * 3) .. "]", {})

if not currentLoadedMapMeshes[X] then
  currentLoadedMapMeshes[X] = {}
end

if not currentLoadedMapMeshes[X][Y] then
  currentLoadedMapMeshes[X][Y] = {}
end

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

function chunkGeneration(X,Y)
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
        if localY < 64 then
          localChunk[localX][localZ][localY] = 1
        
        else
          localChunk[localX][localZ][localY] = 0

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
  chunkMeshGenerator(X,Y)
  
end


local cubeMesh = rl.GenMeshCube(1,1,1)
local planeMesh = rl.GenMeshPlane(1,1,1,1)


local defaultMaterial = rl.LoadMaterialDefault()

rl.SetMaterialTexture(defaultMaterial, rl.MATERIAL_MAP_DIFFUSE, textures.Dirt)

function renderMapMeshes()
  for chunkXi, chunkY in pairs(currentLoadedMapMeshes) do
    for chunkYi, generatedMesh in pairs(chunkY) do
      local meshPosition = rl.new("Vector3",(chunkXi+1) * (chunkSettings.width+1),0,(chunkYi) * (chunkSettings.depth+1) )

      local matrixTransformation = rl.new("Matrix",
        1,0,0,meshPosition.x,
        0,1,0,meshPosition.y,
        0,0,1,meshPosition.z,
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

function handlePlayerInput()
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
end 

rl.DisableCursor()

function singularCubeRender()
                 local cubePosition = rl.new("Vector3",0,0,0)

                  local matrixTransformation = rl.new("Matrix",1,0,0,0,0,1,0,0,0,0,1,0,cubePosition.x,cubePosition.y,cubePosition.z,1)

    rl.DrawMesh(cubeMesh, defaultMaterial , matrixTransformation)
end

function drawHUD()
  --Draw crosshair
  
  local crosshairSize = 20
  local crosshairSize2 = 2
  local centerScreenX = gameSettings.WindowResolution.x / 2
  local centerScreenY = gameSettings.WindowResolution.y / 2

  rl.DrawLineEx(rl.new("Vector2",centerScreenX - crosshairSize2,centerScreenY), rl.new("Vector2",centerScreenX + crosshairSize2,centerScreenY), crosshairSize, rl.WHITE)
  rl.DrawLineEx(rl.new("Vector2",centerScreenX, centerScreenY - crosshairSize2), rl.new("Vector2",centerScreenX,centerScreenY + crosshairSize2), crosshairSize, rl.WHITE)


  --Debug Info
  local localCam = playerInfos.Player1.Camera
  rl.DrawFPS(0,0)

  rl.DrawText("Camera Position: " .. string.format("%.2f",localCam.position.x) .. "/" .. string.format("%.2f",localCam.position.y) .. "/" .. string.format("%.2f",localCam.position.z) , 0, 20, 20, rl.BLACK)
  rl.DrawText("Camera Target: " ..string.format("%.2f",localCam.target.x) .. "/" .. string.format("%.2f",localCam.target.y) .. "/" .. string.format("%.2f",localCam.target.z) , 0, 40, 20, rl.BLACK)


end

function windowDraw()
  rl.UpdateCamera(playerInfos.Player1.Camera, rl.CAMERA_FIRST_PERSON)

  rl.BeginDrawing()
  rl.ClearBackground(rl.SKYBLUE)

  --3D
  local localCam = playerInfos.Player1.Camera
  
  rl.BeginMode3D(localCam)
  
  renderMapMeshes()
  --renderMapBasic()
  
  --rl.DrawGrid(1000, 1);
                
  rl.EndMode3D()

  --2D
  
  drawHUD()
  
	rl.EndDrawing()
  
  
end


while not rl.WindowShouldClose() do
    
  handlePlayerInput()
  
  if not gameSettings.allowWorldGeneration then
    if not currentLoadedMap[0] or not currentLoadedMap[0][0] then
        chunkGeneration(0,0) 
      end  
  else 
    
    --renderDistance
    local playerXChunk = math.floor( (playerInfos.Player1.Camera.position.x / chunkSettings.width) + 0.5)
    local playerYChunk = math.floor( (playerInfos.Player1.Camera.position.z / chunkSettings.depth) + 0.5)


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
    
    local coroutineChunkGen = coroutine.create(function(cX, cY)
      if not currentLoadedMap[cX] or not currentLoadedMap[cX][cY] then
        chunkGeneration(cX,cY)
      end
    end)
    
    for i = 0, foundChunks, 1 do
      coroutine.resume(coroutineChunkGen, foundChunkX[i], foundChunkY[i])
    end
    
    --if foundAChunkThisFrame then
    --  if not currentLoadedMap[foundChunkX] or not currentLoadedMap[foundChunkX][foundChunkY] then
    --    chunkGeneration(foundChunkX,foundChunkY)
    --  end
    --end
    
    --add code to remove old chunks that are too far here
    
  end
  
	windowDraw()
end

rl.CloseWindow()