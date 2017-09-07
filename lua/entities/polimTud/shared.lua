ENT.Base = "sent_sakarias_scar_base"
ENT.Type = "anim"

ENT.PrintName = "Schubert Extra Six Police Tudor"
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

ENT.NrOfSeats = 4
ENT.NrOfWheels = 4
ENT.NrOfExhausts = 1
ENT.NrOfFrontLights = 2
ENT.NrOfRearLights = 2

ENT.SeatPos = {}
ENT.WheelInfo = {}
ENT.ExhaustPos = {}
ENT.FrontLightsPos = {}
ENT.RearLightsPos = {}

ENT.effectPos = NULL

ENT.DefaultSoftnesFront =25
ENT.DefaultSoftnesRear =25

ENT.CarMass =1350
ENT.StabiliserOffset = NULL
ENT.StabilisationMultiplier = 70

ENT.DefaultSound = "mafia/chev6_1.wav"
ENT.EngineEffectName = "Mafia"
ENT.HornSound = "mafia/horn12.wav"

ENT.CarModel = "models/mafia/polimTud.mdl"
ENT.TireModel = "models/mafia/chema_wheel.mdl"
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
xPos = -11
yPos = -11
zPos = 19
ENT.SeatPos[1] = Vector(xPos, yPos, zPos)

--Seat Position 2
xPos = -11
yPos = 11
zPos = 19
ENT.SeatPos[2] = Vector(xPos, yPos, zPos)

--Seat Position 3
xPos = -49
yPos = -11
zPos = 19
ENT.SeatPos[3] = Vector(xPos, yPos, zPos)

--Seat Position 4
xPos = -49
yPos = 11
zPos = 19
ENT.SeatPos[4] = Vector(xPos, yPos, zPos)

//WHEEL POSITIONS
--Wheel Position 1
xPos = 65
yPos = 30
zPos = 6
ENT.WheelInfo[1].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[1].Side = true
ENT.WheelInfo[1].Torq = false
ENT.WheelInfo[1].Steer = 1

--Wheel Position 2
xPos = 65
yPos = -29
zPos = 6
ENT.WheelInfo[2].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[2].Side = false
ENT.WheelInfo[2].Torq = false
ENT.WheelInfo[2].Steer = 1

--Wheel Position 3
xPos = -59
yPos = 30
zPos = 6
ENT.WheelInfo[3].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[3].Side = true
ENT.WheelInfo[3].Torq = true
ENT.WheelInfo[3].Steer = 0

--Wheel Position 4
xPos = -59
yPos = -29
zPos = 6
ENT.WheelInfo[4].Pos = Vector(xPos, yPos, zPos)
ENT.WheelInfo[4].Side = false
ENT.WheelInfo[4].Torq = true
ENT.WheelInfo[4].Steer = 0

//FRONT LIGHT POSITIONS
--Front light 1
xPos = 74
yPos = 21
zPos = 34
ENT.FrontLightsPos[1] = Vector(xPos, yPos, zPos)

--Front light 2
xPos = 74
yPos = -20
zPos = 34
ENT.FrontLightsPos[2] = Vector(xPos, yPos, zPos)

//REAR LIGHT POSITIONS
--Rear light 1
xPos = -96
yPos = 25
zPos = 16
ENT.RearLightsPos[1] = Vector(xPos, yPos, zPos)

--Rear light 2
xPos = -96
yPos = -25.200000762939
zPos = 16
ENT.RearLightsPos[2] = Vector(xPos, yPos, zPos)

//EXHAUST POSITIONS
--Exhaust 1
xPos = -95
yPos = -13
zPos = 4
ENT.ExhaustPos[1] = Vector(xPos, yPos, zPos)

//EFFECT POSITION
xPos = 72.400001525879
yPos = -0
zPos = 35
ENT.effectPos = Vector(xPos, yPos, zPos)

//CAR CHARACTERISTICS
ENT.DefaultAcceleration = 7900
ENT.DefaultMaxSpeed = 1700
ENT.DefaultTurboEffect = 0
ENT.DefaultTurboDuration = 0
ENT.DefaultTurboDelay = 0
ENT.DefaultReverseForce = 650
ENT.DefaultReverseMaxSpeed = 500
ENT.DefaultBreakForce = 3000
ENT.DefaultSteerForce = 5
ENT.DefautlSteerResponse = 0.1
ENT.DefaultStabilisation = 2000
ENT.DefaultNrOfGears = 3
ENT.DefaultAntiSlide = 70
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