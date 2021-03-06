ENT.Base = "sent_sakarias_scar_base"
ENT.Type = "anim"

ENT.PrintName = "Lassiter V16 Police"
ENT.Author = "Def_Valerius"
ENT.Category = "Mafia SCars"
ENT.Information = ""
ENT.AdminOnly = false
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.AddSpawnHeight = 100
ENT.ViewDist = 200
ENT.ViewDistUp = 50

ENT.SirenIsOn = false
ENT.SirenSound = NULL

ENT.NrOfSeats = 5
ENT.NrOfWheels = 4
ENT.NrOfExhausts = 1
ENT.NrOfFrontLights = 4
ENT.NrOfRearLights = 2

ENT.SeatPos = {}
ENT.WheelInfo = {}
ENT.ExhaustPos = {}
ENT.FrontLightsPos = {}
ENT.RearLightsPos = {}

ENT.effectPos = NULL

ENT.DefaultSoftnesFront =30
ENT.DefaultSoftnesRear =30

ENT.CarMass =2812
ENT.StabiliserOffset = NULL
ENT.StabilisationMultiplier = 70

ENT.DefaultSound = "mafia/cad_NPC2.wav"
ENT.EngineEffectName = "Mafia"
ENT.HornSound = "mafia/horn12.wav"

ENT.CarModel = "models/mafia/polCad.mdl"
ENT.TireModel = "models/mafia/cad_ford_wheel.mdl"
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
xPos = -16
yPos = -15
zPos = 19
ENT.SeatPos[1] = Vector(xPos, yPos, zPos)

--Seat Position 2
xPos = -16
yPos = 15
zPos = 19
ENT.SeatPos[2] = Vector(xPos, yPos, zPos)

--Seat Position 3
xPos = -55
yPos = -20
zPos = 19
ENT.SeatPos[3] = Vector(xPos, yPos, zPos)

--Seat Position 4
xPos = -55
yPos = -0
zPos = 19
ENT.SeatPos[4] = Vector(xPos, yPos, zPos)

--Seat Position 5
xPos = -55
yPos = 20
zPos = 19
ENT.SeatPos[5] = Vector(xPos, yPos, zPos)

//WHEEL POSITIONS
--Wheel Position 1
xPos = 102
yPos = 32
zPos = 0
ENT.WheelInfo[1].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[1].Side = true
ENT.WheelInfo[1].Torq = false
ENT.WheelInfo[1].Steer = 1

--Wheel Position 2
xPos = 102
yPos = -31
zPos = 0
ENT.WheelInfo[2].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[2].Side = false
ENT.WheelInfo[2].Torq = false
ENT.WheelInfo[2].Steer = 1

--Wheel Position 3
xPos = -76
yPos = -31
zPos = 0
ENT.WheelInfo[3].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[3].Side = false
ENT.WheelInfo[3].Torq = true
ENT.WheelInfo[3].Steer = 0

--Wheel Position 4
xPos = -76
yPos = 32
zPos = 0
ENT.WheelInfo[4].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[4].Side = true
ENT.WheelInfo[4].Torq = true
ENT.WheelInfo[4].Steer = 0

//FRONT LIGHT POSITIONS
--Front light 1
xPos = 111
yPos = -16
zPos = 30
ENT.FrontLightsPos[1] = Vector(xPos, yPos, zPos)

--Front light 2
xPos = 111
yPos = 17
zPos = 30
ENT.FrontLightsPos[2] = Vector(xPos, yPos, zPos)

--Front light 3
xPos = 120
yPos = 8
zPos = 14
ENT.FrontLightsPos[3] = Vector(xPos, yPos, zPos)

--Front light 4
xPos = 120
yPos = -8
zPos = 14
ENT.FrontLightsPos[4] = Vector(xPos, yPos, zPos)

//REAR LIGHT POSITIONS
--Rear light 1
xPos = -113
yPos = 31
zPos = 14
ENT.RearLightsPos[1] = Vector(xPos, yPos, zPos)

--Rear light 2
xPos = -113
yPos = -30
zPos = 14
ENT.RearLightsPos[2] = Vector(xPos, yPos, zPos)

//EXHAUST POSITIONS
--Exhaust 1
xPos = -110.5
yPos = 15
zPos = 0
ENT.ExhaustPos[1] = Vector(xPos, yPos, zPos)

//EFFECT POSITION
xPos = 84
yPos = -0
zPos = 35
ENT.effectPos = Vector(xPos, yPos, zPos)

//CAR CHARACTERISTICS
ENT.DefaultAcceleration = 15000
ENT.DefaultMaxSpeed = 2000
ENT.DefaultTurboEffect = 0
ENT.DefaultTurboDuration = 0
ENT.DefaultTurboDelay = 0
ENT.DefaultReverseForce = 1000
ENT.DefaultReverseMaxSpeed = 600
ENT.DefaultBreakForce = 4500
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
		self.SirenSound = CreateSound(self.Entity,"mafia/sirene1.wav")
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

ENT.IsBroken = false
function ENT:SpecialThink()

	if (SERVER) then
		local driver = self:GetDriver()
		if driver:IsPlayer() then

			if self.Horn:IsPlaying() and self.SirenSound:IsPlaying() then
				self.SirenSound:Stop()
			elseif self.SirenIsOn and !self.SirenSound:IsPlaying() and !self.Horn:IsPlaying() then
				self.SirenSound:Play()
			end
		
			if !self.Horn:IsPlaying() and self.SirenIsOn == false  and SCarKeys:KeyWasReleased(driver, "Special") then
				SCarKeys:KillKey(driver, "Special")
				self.SirenIsOn = true
				self:SetNetworkedBool("SirenIsOn", true)
				self.SirenSound:Play()
			elseif !self.Horn:IsPlaying() and self.SirenIsOn == true  and SCarKeys:KeyWasReleased(driver, "Special") then
				SCarKeys:KillKey(driver, "Special")
				self.SirenIsOn = false
				self:SetNetworkedBool("SirenIsOn", false)
				self.SirenSound:Stop()		
			end
		else
		
			if self.SirenSound:IsPlaying() then
				self.SirenSound:Stop()
			end
		end
		
		if self.CarHealth <= 0 and self.IsBroken == false then
			self.IsBroken = true
			self.SirenIsOn = false
			self:SetNetworkedBool("SirenIsOn", false)
			if self.SirenSound:IsPlaying() then
				self.SirenSound:Stop()
			end			
		else
			self.IsBroken = false
		end
	end		
end

function ENT:SpecialRemove()	
	if self.SirenSound != NULL then
		self.SirenSound:Stop()
	end
end

function ENT:SpecialRefreshSounds()
	self.SirenSound = CreateSound(self.Entity,"mafia/sirene1.wav")
	
	if self:HasDriver() and !self.Horn:IsPlaying() and self.SirenIsOn == true then
		SCarKeys:KillKey(driver, "Special")
		self.SirenIsOn = false
		self:SetNetworkedBool("SirenIsOn", false)
		self.SirenSound:Stop()
	end
end

function ENT:SpecialReposition()
end