ENT.Base = "sent_sakarias_scar_base"
ENT.Type = "anim"

ENT.PrintName = "Bolt Ace Coupe"
ENT.Author = "Def_Valerius"
ENT.Category = "Mafia SCars"
ENT.Information = ""
ENT.AdminOnly = false
ENT.Spawnable = true
ENT.AdminSpawnable = true

ENT.AddSpawnHeight = 50
ENT.ViewDist = 200
ENT.ViewDistUp = 80

ENT.NrOfSeats = 2
ENT.NrOfWheels = 4
ENT.NrOfExhausts = 1
ENT.NrOfFrontLights = 2
ENT.NrOfRearLights = 1

ENT.SeatPos = {}
ENT.WheelInfo = {}
ENT.ExhaustPos = {}
ENT.FrontLightsPos = {}
ENT.RearLightsPos = {}

ENT.effectPos = NULL

ENT.DefaultSoftnesFront =25
ENT.DefaultSoftnesRear =25

ENT.CarMass =800
ENT.StabiliserOffset = NULL
ENT.StabilisationMultiplier = 70

ENT.DefaultSound = "mafia/fordT1_NPC.wav"
ENT.EngineEffectName = "Mafia"
ENT.HornSound = "mafia/horn1.wav"

ENT.CarModel = "models/mafia/fordtco.mdl"
ENT.TireModel = "models/mafia/fordt_wheel.mdl"
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
xPos = -6
yPos = -10
zPos = 18
ENT.SeatPos[1] = Vector(xPos, yPos, zPos)

--Seat Position 2
xPos = -6
yPos = 10
zPos = 18
ENT.SeatPos[2] = Vector(xPos, yPos, zPos)

//WHEEL POSITIONS
--Wheel Position 1
xPos = -38
yPos = 26
zPos = 3
ENT.WheelInfo[1].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[1].Side = true
ENT.WheelInfo[1].Torq = true
ENT.WheelInfo[1].Steer = 0

--Wheel Position 2
xPos = -38
yPos = -26
zPos = 3
ENT.WheelInfo[2].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[2].Side = false
ENT.WheelInfo[2].Torq = true
ENT.WheelInfo[2].Steer = 0

--Wheel Position 3
xPos = 60
yPos = 26
zPos = 3
ENT.WheelInfo[3].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[3].Side = true
ENT.WheelInfo[3].Torq = false
ENT.WheelInfo[3].Steer = 1

--Wheel Position 4
xPos = 60
yPos = -26
zPos = 3
ENT.WheelInfo[4].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[4].Side = false
ENT.WheelInfo[4].Torq = false
ENT.WheelInfo[4].Steer = 1

//FRONT LIGHT POSITIONS
--Front light 1
xPos = 59
yPos = -13.5
zPos = 22
ENT.FrontLightsPos[1] = Vector(xPos, yPos, zPos)

--Front light 2
xPos = 59
yPos = 13.5
zPos = 22
ENT.FrontLightsPos[2] = Vector(xPos, yPos, zPos)

//REAR LIGHT POSITIONS
--Rear light 1
xPos = -60
yPos = -20
zPos = 22
ENT.RearLightsPos[1] = Vector(xPos, yPos, zPos)

//EXHAUST POSITIONS
--Exhaust 1
xPos = -35.400001525879
yPos = -10.60000038147
zPos = 7.0796461105347
ENT.ExhaustPos[1] = Vector(xPos, yPos, zPos)

//EFFECT POSITION
xPos = 46
yPos = -0
zPos = 28.299999237061
ENT.effectPos = Vector(xPos, yPos, zPos)

//CAR CHARACTERISTICS
ENT.DefaultAcceleration = 1900
ENT.DefaultMaxSpeed = 1000
ENT.DefaultTurboEffect = 0
ENT.DefaultTurboDuration = 0
ENT.DefaultTurboDelay = 0
ENT.DefaultReverseForce = 600
ENT.DefaultReverseMaxSpeed = 150
ENT.DefaultBreakForce = 1250
ENT.DefaultSteerForce = 5
ENT.DefautlSteerResponse = 0.1
ENT.DefaultStabilisation = 2000
ENT.DefaultNrOfGears = 2
ENT.DefaultAntiSlide = 20
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