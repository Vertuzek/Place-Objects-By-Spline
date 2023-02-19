-- Author: Ziuta
-- Name: Place Objects Along 
-- Description: Place the object along the spline
-- Icon:
-- Hide: no
-- Added the possibility to choose what you want to place along the spline - Vertuzek

-- ### configuration ###
local splinePiece = 1 -- in meters
-- ### ------------- ###

source("editorUtils.lua")

local splineID = getSelection(0)
if splineID == 0 or getName(splineID) ~= "splinePlacement" then
    print("ERROR: Please select 'splinePlacement' transform group!")
    
    return
end

local placedObjects = getChild(splineID,"placedObjects")
if placedObjects == 0 then
    print("ERROR: 'objectsToPlace' not present!")
    return
end

local objectsToPlace = getChild(splineID,"objectsToPlace")
if objectsToPlace == 0 then
    print("ERROR: 'objectsToPlace' not present!")
    return
end

local splineLength = getSplineLength(splineID) 
local reqOTP = math.floor(splineLength/splinePiece)

local placedObjects = createTransformGroup("placedObjects")
link(splineID, placedObjects)
local objectToPlaceTG = clone(getChildAt(objectsToPlace,iObject), false, true)
link(placedObjects, objectToPlaceTG)
for i=0,reqOTP-2,1 do
    local objectToPlace = clone(getChildAt(placedObjects, i), false, false, false)
    link(placedObjects, objectToPlace)
end

local splinePiecePoint = splinePiece/splineLength
local splinePosition = 0.0
local i = 0

while splinePosition <= 1.0 do
	local positionX, positionY, positionZ = getSplinePosition(splineID, splinePosition)
	local directionX, directionY, directionZ = getSplineDirection(splineID, splinePosition)
	local vectorDirectionX, vectorDirectionY, vectorDirectionZ = EditorUtils.crossProduct(directionX, directionY, directionZ, 0, 0, 1)
    if i < reqOTP then
        local objectsToPlace = getChildAt(placedObjects,i)
        --print("i: "..i.." objectsToPlace: "..objectsToPlace)
        setTranslation(objectsToPlace, positionX, positionY, positionZ)
        setDirection(objectsToPlace, directionX, directionY, directionZ, 0, 1, 0)
        local radiansX,radiansY,radiansZ = getRotation(objectsToPlace)
        local degreesX,degreesY,degreesZ = math.deg(radiansX),math.deg(radiansY),math.deg(radiansZ)
        local fixY = 0
        --print("ID: "..objectsToPlace.." radiany: "..radiansX..", "..radiansY..", "..radiansZ.."  stopnie: "..degreesX..", "..degreesY..", "..degreesZ.." wektor: "..vectorDirectionX..", "..vectorDirectionY..", "..vectorDirectionZ)
        if degreesX ~= 0 and degreesZ ~= 0 then
           fixY = (180+degreesY)*(-1)
            setRotation(objectsToPlace,0,math.rad(fixY),0)
        elseif degreesX ~= 0 or degreesZ ~= 0 then
            fixY = math.abs(degreesY)
            setRotation(objectsToPlace,0,radiansY,0)
        end
        --print("fixedY: "..fixY)
        local fixYDeg = 0
        local _,y,_ = getRotation(objectsToPlace)
        if math.deg(y) < 0 then
            fixYDeg = 360+math.deg(y)
            setRotation(objectsToPlace,0,math.rad(fixYDeg),0)
        end
    --print("fixedYDeg: "..fixYDeg)
    end
    -- goto next point
    splinePosition = splinePosition + splinePiecePoint
    i = i + 1
end

print("Done!")
print("Ready for SplineConstructor!")
