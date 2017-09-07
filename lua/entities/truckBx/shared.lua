ENT.Base = "sent_sakarias_scar_base"
ENT.Type = "anim"

ENT.PrintName = "Bolt Truck"
ENT.Author = "Def_Valerius"
ENT.Category = "Mafia SCars"
ENT.Information = ""
ENT.AdminOnly = false
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.AddSpawnHeight = 100
ENT.ViewDist = 200
ENT.ViewDistUp = 100

ENT.NrOfSeats = 2
ENT.NrOfWheels = 6
ENT.NrOfExhausts = 1
ENT.NrOfFrontLights = 2
ENT.NrOfRearLights = 1

ENT.SeatPos = {}
ENT.WheelInfo = {}
ENT.ExhaustPos = {}
ENT.FrontLightsPos = {}
ENT.RearLightsPos = {}

ENT.effectPos = NULL

ENT.DefaultSoftnesFront =35
ENT.DefaultSoftnesRear =40

ENT.CarMass =3000
ENT.StabiliserOffset = NULL
ENT.StabilisationMultiplier = 70

ENT.DefaultSound = "mafia/truck_X.wav"
ENT.EngineEffectName = "Mafia"
ENT.HornSound = "mafia/horn12.wav"

ENT.CarModel = "models/mafia/TruckBx.mdl"
ENT.TireModel = "models/mafia/TruckA_f_Wheel.mdl"
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
xPos = 28
yPos = -11
zPos = 10
ENT.SeatPos[1] = Vector(xPos, yPos, zPos)

--Seat Position 2
xPos = 28
yPos = 12
zPos = 10
ENT.SeatPos[2] = Vector(xPos, yPos, zPos)

//WHEEL POSITIONS
--Wheel Position 1
xPos = 105
yPos = 35
zPos = -10
ENT.WheelInfo[1].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[1].Side = true
ENT.WheelInfo[1].Torq = false
ENT.WheelInfo[1].Steer = 1

--Wheel Position 2
xPos = 105
yPos = -32
zPos = -10
ENT.WheelInfo[2].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[2].Side = false
ENT.WheelInfo[2].Torq = false
ENT.WheelInfo[2].Steer = 1

--Wheel Position 3
xPos = -60
yPos = -32
zPos = -10
ENT.WheelInfo[3].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[3].Side = false
ENT.WheelInfo[3].Torq = true
ENT.WheelInfo[3].Steer = 0

--Wheel Position 4
xPos = -60
yPos = -25
zPos = -10
ENT.WheelInfo[4].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[4].Side = false
ENT.WheelInfo[4].Torq = true
ENT.WheelInfo[4].Steer = 0

--Wheel Position 5
xPos = -60
yPos = 35
zPos = -10
ENT.WheelInfo[5].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[5].Side = true
ENT.WheelInfo[5].Torq = true
ENT.WheelInfo[5].Steer = 0

--Wheel Position 6
xPos = -60
yPos = 28
zPos = -10
ENT.WheelInfo[6].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[6].Side = true
ENT.WheelInfo[6].Torq = false
ENT.WheelInfo[6].Steer = 0

//FRONT LIGHT POSITIONS
--Front light 1
xPos = 113
yPos = 21
zPos = 21
ENT.FrontLightsPos[1] = Vector(xPos, yPos, zPos)

--Front light 2
xPos = 113
yPos = -18
zPos = 21
ENT.FrontLightsPos[2] = Vector(xPos, yPos, zPos)

//REAR LIGHT POSITIONS
--Rear light 1
xPos = -91.400001525879
yPos = 30.5
zPos = 7.5999999046326
ENT.RearLightsPos[1] = Vector(xPos, yPos, zPos)

//EXHAUST POSITIONS
--Exhaust 1
xPos = -22.89999961853
yPos = -31
zPos = -11.39999961853
ENT.ExhaustPos[1] = Vector(xPos, yPos, zPos)

//EFFECT POSITION
xPos = 76.199996948242
yPos = -0
zPos = 41.900001525879
ENT.effectPos = Vector(xPos, yPos, zPos)

//CAR CHARACTERISTICS
ENT.DefaultAcceleration = 7700
ENT.DefaultMaxSpeed = 1500
ENT.DefaultTurboEffect = 1
ENT.DefaultTurboDuration = 1
ENT.DefaultTurboDelay = 1
ENT.DefaultReverseForce = 1000
ENT.DefaultReverseMaxSpeed = 400
ENT.DefaultBreakForce = 3700
ENT.DefaultSteerForce = 5
ENT.DefautlSteerResponse = 0.1
ENT.DefaultStabilisation = 2000
ENT.DefaultNrOfGears = 3
ENT.DefaultAntiSlide = 50
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