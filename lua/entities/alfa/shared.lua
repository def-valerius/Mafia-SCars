ENT.Base = "sent_sakarias_scar_base"
ENT.Type = "anim"

ENT.PrintName = "Caesar 8C 2300 Racing"
ENT.Author = "Def_Valerius"
ENT.Category = "Mafia SCars"
ENT.Information = ""
ENT.AdminOnly = false
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.AddSpawnHeight = 50
ENT.ViewDist = 200
ENT.ViewDistUp = 50

ENT.NrOfSeats = 1
ENT.NrOfWheels = 4
ENT.NrOfExhausts = 1
ENT.NrOfFrontLights = 0
ENT.NrOfRearLights = 0

ENT.SeatPos = {}
ENT.WheelInfo = {}
ENT.ExhaustPos = {}
ENT.FrontLightsPos = {}
ENT.RearLightsPos = {}

ENT.effectPos = NULL

ENT.DefaultSoftnesFront =30
ENT.DefaultSoftnesRear =30

ENT.CarMass =920
ENT.StabiliserOffset = NULL
ENT.StabilisationMultiplier = 70

ENT.DefaultSound = "mafia/alfa_2.wav"
ENT.EngineEffectName = "Mafia"
ENT.HornSound = "mafia/horn12.wav"

ENT.CarModel = "models/mafia/alfa.mdl"
ENT.TireModel = "models/mafia/alfa_wheel.mdl"
ENT.AnimType = 1

ENT.FrontLightColor = "220 220 160"
------------------------------------VARIABLES END

for i = 1, ENT.NrOfWheels do
	ENT.WheelInfo[i] = {}
end

local xPos = 0
local yPos = 0
local zPos = 0

//SEAT POSITIONS
--Seat Position 1
xPos = -24
yPos = 4
zPos = 20
ENT.SeatPos[1] = Vector(xPos, yPos, zPos)

//WHEEL POSITIONS
--Wheel Position 1
xPos = 60
yPos = 29
zPos = 17
ENT.WheelInfo[1].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[1].Side = true
ENT.WheelInfo[1].Torq = false
ENT.WheelInfo[1].Steer = 1

--Wheel Position 2
xPos = 60
yPos = -27.5
zPos = 17
ENT.WheelInfo[2].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[2].Side = false
ENT.WheelInfo[2].Torq = false
ENT.WheelInfo[2].Steer = 1

--Wheel Position 3
xPos = -50
yPos = -27.5
zPos = 17
ENT.WheelInfo[3].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[3].Side = false
ENT.WheelInfo[3].Torq = true
ENT.WheelInfo[3].Steer = 0

--Wheel Position 4
xPos = -50
yPos = 28
zPos = 17
ENT.WheelInfo[4].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[4].Side = true
ENT.WheelInfo[4].Torq = true
ENT.WheelInfo[4].Steer = 0

//FRONT LIGHT POSITIONS
//REAR LIGHT POSITIONS
//EXHAUST POSITIONS
--Exhaust 1
xPos = -63
yPos = -12
zPos = 27
ENT.ExhaustPos[1] = Vector(xPos, yPos, zPos)

//EFFECT POSITION
xPos = 40
yPos = -0
zPos = 30
ENT.effectPos = Vector(xPos, yPos, zPos)

//CAR CHARACTERISTICS
ENT.DefaultAcceleration = 6800
ENT.DefaultMaxSpeed = 2700
ENT.DefaultTurboEffect = 0
ENT.DefaultTurboDuration = 0
ENT.DefaultTurboDelay = 0
ENT.DefaultReverseForce = 700
ENT.DefaultReverseMaxSpeed = 300
ENT.DefaultBreakForce = 3200
ENT.DefaultSteerForce = 5
ENT.DefautlSteerResponse = 0.1
ENT.DefaultStabilisation = 2000
ENT.DefaultNrOfGears = 3
ENT.DefaultAntiSlide = 75
ENT.DefaultAutoStraighten = 5
ENT.DeafultSuspensionAddHeight = 10
ENT.DefaultHydraulicActive = 0

list.Set( "SCarsList", ENT.PrintName, ENT )

function ENT:Initialize()
		
	self:Setup()

	if (SERVER) then
		--Setting up the car characteristics
		self:SetAcceleration( self.DefaultAcceleration )
		self:SetMaxSpeed( self.DefaultMaxSpeed )
		
		self:SetTurboEffect( self.DefaultTurboEffect )
		self:SetTurboDuration( self.DefaultTurboDuration )
		self:SetTurboDelay( self.DefaultTurboDelay )
		
		self:SetReverseForce( self.DefaultReverseForce )
		self:SetReverseMaxSpeed( self.DefaultReverseMaxSpeed )
		self:SetBreakForce( self.DefaultBreakForce )
		
		self:SetSteerForce( self.DefaultSteerForce )
		self:SetSteerResponse( self.DefautlSteerResponse )
		
		self:SetStabilisation( self.DefaultStabilisation )
		self:SetNrOfGears( self.DefaultNrOfGears )
		self:SetAntiSlide( self.DefaultAntiSlide )
		self:SetAutoStraighten( self.DefaultAutoStraighten )	
		
		self:SetSuspensionAddHeight( self.DeafultSuspensionAddHeight )
		self:SetHydraulicActive( self.DefaultHydraulicActive )
	end
end

function ENT:SpecialThink()
end

function ENT:SpecialRemove()	
end

function ENT:SpecialReposition()
end