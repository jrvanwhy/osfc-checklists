// Copyright 2024 Oregon State Flying Club
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// 73146.typ is more extensively commented, check there first for design notes.

#import "common.typ": checklist, checklist_group, palette

// -----------------------------------------------------------------------------
// Operating Checklists
// -----------------------------------------------------------------------------
#let operating_checklists = [
	#checklist("Start", palette.purple,
		checklist_group("Before Start"),
		([Preflight inspection], [COMPLETE]),
		([Passenger briefing], [COMPLETE]),
		([Brakes], [TEST, SET]),
		([Seats, belts, harnesses], [SECURE]),
		([Circuit breakers], [CHECK IN]),
		([Electrical equipment], [OFF]),
		([Avionics (BUS 1 and BUS 2)], [OFF]),
		([Beacon switch], [ON]),
		([Fuel selector], [BOTH]),
		([Fuel shutoff valve], [ON]),
		checklist_group("Engine Start (With Battery)"),
		([Throttle], [OPEN 1/4 INCH]),
		([Mixture], [CUT-OFF]),
		([Standby battery], [TEST], [Hold TEST position 20 seconds, verify TEST
			light stays on]),
		([Standby battery], [ARM], [Verify PFD turns on]),
		([Engine instruments], [CHECK], [Verify no red X on engine page]),
		([BUS E Volts], [VERIFY ≥ 24V]),
		([M BUS Volts], [VERIFY ≤ 1.5V]),
		([BATT S Amps], [VERIFY negative]),
		([STBY BATT Annunciator], [VERIFY SHOWN]),
		([Master], [ON]),
		([Prime], [IF ENGINE NOT WARM], [Fuel pump ON, mixture RICH until fuel
			flow stable (3-5 seconds), mixture CUT-OFF, fuel pump OFF]),
		([Propeller area], [CLEAR]),
		([Ignition switch], [START], [Release when engine starts]),
		([Mixture], [ADVANCE when engine starts], [If engine flooded, mixture
			CUT-OFF, open throttle 1/2 to full, engage starter. When engine
			starts, mixture FULL, retard throttle promptly]),
		([Oil pressure], [VERIFY GREEN WITHIN 60 SECONDS]),
		([Mixture], [GROUND LEAN]),
		checklist_group("Before Taxi"),
		([Amps (M BATT, BATT S)], [VERIFY POSITIVE]),
		([LOW VOLTS Annunciator], [VERIFY NOT SHOWN]),
		([Avionics], [ON]),
		([Headset], [ON]),
		([Navigation, strobe, taxi lights], [ON]),
		([Flaps], [RETRACT]),
		([Weather], [OBTAIN]),
		([Altimeters (PFD, standby, autopilot)], [SET]),
		([EFB Setup], [IF DESIRED]),
	)
]

// -----------------------------------------------------------------------------
// Engine Failures
// -----------------------------------------------------------------------------
#let engine_failures = [
	#checklist("Engine Failure During Takeoff Roll", palette.brown,
		emergency: true,
		([Throttle], [IDLE]),
		([Brakes], [APPLY]),
		([Flaps], [RETRACT]),
		([Mixture], [CUT-OFF]),
		([Magnetos], [OFF]),
		([Standby battery], [OFF]),
		([Master (ALT and BAT)], [OFF]),
	)
	#checklist("Engine Failure Immediately After Takeoff", palette.dark_blue,
		emergency: true,
		([Airspeed], [Flaps up: 70 KIAS\ Flaps 10°-FULL: 65 KIAS]),
		([Mixture], [CUT-OFF]),
		([Fuel shutoff valve], [OFF (pull full out)]),
		([Magnetos], [OFF]),
		([Flaps], [AS REQUIRED (FULL recommended)]),
		([Standby battery], [OFF]),
		([Master (ALT and BAT)], [OFF]),
		([Door], [UNLATCH]),
		([Land], [STRAIGHT AHEAD]),
	)
	#checklist("Engine Failure During Flight (Restart Procedures)",
		palette.purple, emergency: true,
		([Airspeed], [68 KIAS (best glide speed)]),
		([Fuel shutoff valve], [ON (push full in)]),
		([Fuel selector valve], [BOTH]),
		([Fuel pump], [ON]),
		([Mixture], [RICH (if restart has not occurred)]),
		([Magnetos], [BOTH], [If propeller stopped: START, advance throttle
			slowly, lean mixture as required]),
		([Fuel pump], [OFF], [If fuel flow drops to zero, turn fuel pump back on]),
	)
]

// -----------------------------------------------------------------------------
// Forced Landings
// -----------------------------------------------------------------------------
#let forced_landings = [
	#checklist("Emergency Landing Without Engine Power", palette.light_green,
		emergency: true,
		([Seats, seatbelts], [UPRIGHT, SECURE]),
		([Airspeed], [Flaps up: 70 KIAS\ Flaps 10°-FULL: 65 KIAS]),
		([Mixture], [CUT-OFF]),
		([Fuel shutoff valve], [OFF (pull)]),
		([Magnetos], [OFF]),
		([Flaps], [AS REQUIRED (FULL recommended)]),
		([Standby battery], [OFF]),
		([Master (ALT and BAT)], [OFF (when landing is assured)]),
		([Doors], [UNLATCH BEFORE TOUCHDOWN]),
		([Touchdown], [SLIGHTLY TAIL LOW]),
		([Brakes], [APPLY HEAVILY]),
	)
	#checklist("Precautionary Landing With Engine Power", palette.dark_green,
		emergency: true,
		([Seats, seatbelts], [UPRIGHT, SECURE]),
		([Airspeed], [65 KIAS]),
		([Flaps], [20°]),
		([Selected field], [FLY OVER, noting terrain and obstructions]),
		([Flaps], [FULL (on final approach)]),
		([Airspeed], [65 KIAS]),
		([Standby battery], [OFF]),
		([Master (ALT and BAT)], [OFF (when landing assured)]),
		([Doors], [UNLATCH BEFORE TOUCHDOWN]),
		([Touchdown], [SLIGHTLY TAIL LOW]),
		([Mixture], [CUT-OFF]),
		([Magnetos], [OFF]),
		([Brakes], [APPLY HEAVILY]),
	)
	#checklist("Ditching", palette.light_blue, emergency: true,
		([Radio], [MAYDAY on 121.5 MHz (Give location, intentions)]),
		([Transponder], [SQUAWK 7700]),
		([Heavy objects (in baggage area)], [SECURE or JETTISON (if possible)]),
		([Seats, seatbelts], [UPRIGHT, SECURE]),
		([Flaps], [20°-FULL]),
		([Power], [300 FT/MIN DESCENT\ AT 55 KIAS],
		 [If no power available, approach flaps up 70 KIAS or flaps 10° 65 KIAS]),
		([Strong wind, heavy seas: LAND INTO WIND\
		  Light wind, heavy swells: LAND PARALLEL TO SWELLS], []),
		([Doors], [UNLATCH]),
		([Touchdown], [LEVEL ATTITUDE at established rate of descent]),
		([Face], [CUSHION at touchdown with folded coat]),
		([ELT], [ACTIVATE]),
		([Airplane], [EVACUATE THROUGH CABIN DOORS], [If necessary, open window and flood cabin to equalize pressure so doors can be opened.]),
		([Life vests, raft], [INFLATE WHEN CLEAR OF AIRPLANE]),
	)
]

// -----------------------------------------------------------------------------
// Fires
// -----------------------------------------------------------------------------
#let fires = [
	#checklist("Fire During Start on Ground", palette.light_green,
		emergency: true,
		([Magnetos switch], [START (continue cranking to start the engine)]),
		([If engine starts:], []),
		([#h(1em)Power], [1800 RPM for a few minutes]),
		([#h(1em)Engine], [SHUTDOWN]),
		([If engine fails to start:], []),
		([#h(1em)Throttle], [FULL]),
		([#h(1em)Mixture], [CUT-OFF]),
		([#h(1em)Magnetos switch], [START (continue cranking)]),
		([#h(1em)Fuel shutoff valve], [OFF (pull)]),
		([#h(1em)Fuel pump], [OFF]),
		([#h(1em)Magnetos], [OFF]),
		([#h(1em)Standby battery], [OFF]),
		([#h(1em)Master (ALT and BAT)], [OFF]),
		([#h(1em)Engine], [SECURE]),
		([#h(1em)Parking brake], [RELEASE]),
		([#h(1em)Fire extinguisher], [OBTAIN]),
		([#h(1em)Airplane], [EVACUATE]),
		([#h(1em)Fire], [EXTINGUISH via fire extinguisher, wool blanket, or dirt]),
		([Both cases: inspect and repair damage before conducting another flight.], []),
	)
	#checklist("Engine Fire in Flight", palette.purple, emergency: true,
		([Mixture], [CUT-OFF]),
		([Fuel shutoff valve], [OFF (pull)]),
		([Fuel pump], [OFF]),
		([Master (ALT and BAT)], [OFF]),
		([Cabin heat and air], [OFF (except overhead vents)]),
		([Airspeed], [100 KIAS],
		 [If fire not extinguished, increase speed to find an airspeed, within
			airspeed limitations, which provides an incombustible mixture]),
		([Forced landing], [EXECUTE], [Refer to Emergency Landing Without Engine Power checklist]),
	)
	#checklist("Electrical Fire in Flight", palette.dark_blue, emergency: true,
		([Standby battery], [OFF]),
		([Master (ALT and BAT)], [OFF]),
		([Vents/cabin air/heat], [CLOSE]),
		([Fire extinguisher], [USE]),
		([Avionics (BUS 1 and BUS 2)], [OFF]),
		([All switches (except magnetos)], [OFF]),
		([Vents/cabin air/heat], [OPEN],
		 [When sure fire is completely extinguished]),
		([If fire extinguished and electrical power necessary to continue flight:], []),
		([#h(1em)Circuit breakers], [CHECK, do not reset]),
		([#h(1em)Master (ALT and BAT)], [ON]),
		([#h(1em)Standby battery], [ON]),
		([#h(1em)Avionics (BUS 1)], [ON]),
		([#h(1em)Avionics (BUS 2)], [ON]),
	)
	#checklist("Cabin Fire", palette.light_blue, emergency: true,
		([Standby battery], [OFF]),
		([Master (ALT and BAT)], [OFF]),
		([Vents/cabin air/heat], [CLOSE (to avoid drafts)]),
		([Fire extinguisher], [USE]),
		([Vents/cabin air/heat], [OPEN],
		 [When sure fire is completely extinguished]),
		([Land], [ASAP to inspect for damage]),
	)
	#checklist("Wing Fire", palette.brown, emergency: true,
		([Landing, taxi lights], [OFF]),
		([Nav, strobe lights], [OFF]),
		([Pitot heat], [OFF]),
		([NOTE: Sideslip to keep flames away from fuel tanks and cabin.
			Land ASAP using flaps only as required for final approach and
			touchdown.], []),
	)
]

// -----------------------------------------------------------------------------
// Icing, Excessive Fuel Vapor, and Abnormal Landings
// -----------------------------------------------------------------------------
#let icing_vapor_abnormal_landings = [
	#checklist("Inadvertent Icing Encounter During Flight", palette.light_blue,
		emergency: true,
		([Pitot heat], [ON]),
		([Turn or change altitude to obtain an OAT less conducive to icing.], []),
		([Cabin heat], [FULL ON]),
		([Defrosters], [OPEN]),
		([Cabin air], [ADJUST], [Maximize defroster heat and airflow]),
		([Induction icing], [MONITOR],
		 [Adjust throttle to hold RPM. Adjust mixture as needed for any change in power settings]),
		([Land], [NEAREST AIRPORT], [With an extremely rapid ice build-up,
			select suitable off-airport landing site]),
		([With ≥ 1/4 inch of ice on the leading edges, prepare for significantly
			higher stall speed], []),
		([Flaps], [LEAVE RETRACTED]),
		([Open left window and scrape ice from windshield, if necessary for visibility], []),
		([Forward slip if necessary for visibility], []),
		([Approach speed], [65-75 KIAS], [Depending on level of accumulation]),
		([Landing], [Perform in level attitude], [Avoid missed approaches if possible]),
		([Missed approaches should be avoided whenever possible], []),
	)
	#checklist(
		"Static Source Blockage (Erroneous Instrument Reading Suspected)",
		palette.dark_green, emergency: true,
		([Alternate static], [PULL ON]),
		([Cabin heat/air], [PULL ON]),
		([Vents], [CLOSED]),
		// TODO: Update this if we put the calibration table onto the checklist.
		([Airspeed], [Consult calibration table], [Section 5, Figure 5-1 of POH]),
	)
	#checklist("Excessive Fuel Vapor (Fuel Flow Stabilization Procedures)",
		palette.dark_blue, emergency: true,
		([If flow fluctuates ≥ 1 GPH or power surges occur], []),
		([Fuel pump], [ON]),
		([Mixture], [ADJUST], [as necessary for smooth operation]),
		([Fuel selector valve], [SELECT OTHER TANK (if symptoms continue)]),
		([Fuel pump], [OFF (after fuel flow stabilized)]),
	)
	#checklist("Landing With a Flat Main Tire", palette.brown, emergency: true,
		([Approach], [NORMAL]),
		([Flaps], [FULL]),
		([Touchdown], [GOOD MAIN TIRE FIRST], [Keep flat tire in air as long as possible with aileron control]),
		([Directional control], [MAINTAIN using brake on good wheel as required]),
	)
	#checklist("Landing With a Flat Nose Tire", palette.purple, emergency: true,
		([Approach], [NORMAL]),
		([Flaps], [AS REQUIRED]),
		([Touchdown], [ON MAINS], [Hold nosewheel off ground as long as
			possible, maintain full up elevator as airplane slows to stop]),
	)
]

// -----------------------------------------------------------------------------
// Electrical Power Supply System Malfunctions
// -----------------------------------------------------------------------------
#let electrical_malfunctions = [
	#checklist("HIGH VOLTS or M Bat Amps > 40", palette.light_green,
		emergency: true,
		([Master (ALT only)], [OFF]),
		([Avionics (BUS 1)], [OFF]),
		([Pitot heat], [OFF]),
		([Beacon, taxi, nav, strobe lights], [OFF]),
		([Landing light], [OFF (use as req'd for landing)]),
		([Cabin power 12V], [OFF]),
		([Note: When M bus volts drops below 20V, the standby battery will
			supply power to the essential bus for at least 30 minutes], []),
		([COM1, NAV1], [TUNE]),
		([COM1 MIC and NAV1], [SELECT], [If COM2 MIC and NAV2 are selected when
			avionics bus 2 is off, the radios cannot be tuned]),
		([Avionics (BUS 2)], [OFF if clear of clouds], [The following items will
			not operate: autopilot, COM2, transponder, audio panel, NAV2, MFD]),
		([Land], [AS SOON AS PRACTICAL], [Make sure a successful landing is
			possible before extending flaps. Flap motor is a large electrical
			load.]),
	)
	#checklist("LOW VOLTS Annunciator Comes On < 1000 RPM", palette.dark_blue,
		emergency: true,
		([Throttle], [1000 RPM]),
		([Low voltage annunciator], [VERIFY OFF],
			// It is not immediately obvious from the POH that a pilot running
			// this checklist should also run the LOW VOLTS ANNUNCIATOR COMES ON
			// OR DOES NOT GO OFF AT HIGHER RPM checklist if this checklist does
			// not make the LOW VOLTS annunciator extinguish. I added a
			// reference to that checklist to this item so pilots don't miss the
			// need to run it.
			[If annunciator remains on, run "LOW VOLTS Annunciator On ≥ 1000
			RPM" checklist, and have electrical system inspected before next
			flight]),
	)
	// POH name: LOW VOLTS ANNUNCIATOR COMES ON OR DOES NOT GO OFF AT HIGHER
	// RPM. Simplified "COMES ON OR DOES NOT GO OFF AT HIGHER RPM" to just "On ≥
	// 1000 RPM".
	#checklist("LOW VOLTS Annunciator On ≥ 1000 RPM", palette.black,
		emergency: true,
		([Master (ALT only)], [OFF]),
		([ALT FIELD breaker], [CHECK IN]),
		([Master (ALT and BAT)], [ON]),
		([LOW VOLTS annunciator)], [VERIFY OFF]),
		([M Bus volts], [VERIFY 27.5V minimum]),
		([M Bat amps], [VERIFY POSITIVE]),
		([If LOW VOLTS annunciator remains on:], []),
		([#h(1em)Avionics (BUS 1)], [OFF]),
		([#h(1em)Pitot heat], [OFF]),
		([#h(1em)Beacon, taxi, nav, strobe lights], [OFF]),
		([#h(1em)Landing light], [OFF (use as req'd for landing)]),
		([#h(1em)Cabin power 12V], [OFF]),
		([#h(1em)Note: When M bus volts drops below 20V, the standby battery
			will supply power to the essential bus for at least 30 minutes],
			[]),
		([#h(1em)COM1, NAV1], [TUNE]),
		([#h(1em)COM1 MIC and NAV1], [SELECT], [If COM2 MIC and NAV2 are
			selected when avionics bus 2 is off, the radios cannot be tuned]),
		([#h(1em)Avionics (BUS 2)], [OFF if clear of clouds], [The following
			items will not operate: autopilot, COM2, transponder, audio panel,
			NAV2, MFD]),
		([#h(1em)Land], [AS SOON AS PRACTICAL], [Make sure a successful landing
			is possible before extending flaps. Flap motor is a large electrical
			load.]),
	)
]

// -----------------------------------------------------------------------------
// Instrument Failures, High Carbon Monoxide
// -----------------------------------------------------------------------------
#let instrument_failures_high_co = [
	#checklist("Red X - PFD Airspeed Indicator", palette.light_green,
		emergency: true,
		([ADC/AHRS circuit breakers (ESS BUS and AVN BUS 1)], [CHECK IN], [If
			open, reset circuit breaker. If circuit breaker opens again, do not
			reset]),
		([Standby airspeed indicator], [USE for airspeed information]),
	)
	#checklist("Red X - PFD Altitude Indicator", palette.dark_green,
		emergency: true,
		([ADC/AHRS circuit breakers (ESS BUS and AVN BUS 1)], [CHECK IN], [If
			open, reset circuit breaker. If circuit breaker opens again, do not
			reset]),
		([Standby altimeter], [CHECK current barometric pressure SET. USE for
			altitude information]),
	)
	#checklist("Red X - PFD Attitude Indicator", palette.light_blue,
		emergency: true,
		([ADC/AHRS circuit breakers (ESS BUS and AVN BUS 1)], [CHECK IN], [If
			open, reset circuit breaker. If circuit breaker opens again, do not
			reset]),
		([Standby attitude indicator], [USE for attitude information]),
	)
	#checklist("Red X - Horizontal Situation Indicator", palette.purple,
		emergency: true,
		([ADC/AHRS circuit breakers (ESS BUS and AVN BUS 1)], [CHECK IN], [If
			open, reset circuit breaker. If circuit breaker opens again, do not
			reset]),
		([Magnetic compass], [USE for heading information]),
	)
	#checklist("PFD1 COOLING or MFD1 COOLING Annunciator(s)", palette.dark_blue,
		emergency: true,
		([Cabin heat], [REDUCE (minimum preferred)]),
		([Forward avionics fan], [CHECK (feel for airflow from screen on
			glareshield)]),
		([If forward avionics fan failed:], []),
		([#h(1em)Standby battery], [OFF unless needed for emergency power]),
		([If PFD1 COOLING or MFD1 COOLING annunciator does not go off within 3
			minutes or if both annunciators come on:], []),
		([#h(1em)Standby battery], [OFF (land as soon as practical)]),
	)
	#checklist("LOW VACUUM Annunciator Comes On", palette.black,
		emergency: true,
		([Vacuum indicator], [CHECK EIS ENGINE page to make sure vacuum pointer
			is within green arc], [If vacuum pointer not in green arc or gyro
			flag shows on standby attitude indicator, do not use standby
			attitude indicator]),
	)
	// POH: HIGH CARBON MONOXIDE (CO) LEVEL ANNUNCIATOR (if installed)
	// We do not have a CO detector installed, but some members carry CO
	// detectors with them so this checklist may still be useful. Removed
	// "annunciator" from the title as their personal detectors will not cause
	// G1000 annunciations.
	#checklist("High Carbon Monoxide (CO) Level", palette.brown,
		emergency: true,
		([Cabin heat], [OFF (push full in)]),
		([Cabin air], [ON (pull full out)]),
		([Cabin vents], [OPEN]),
		([Windows], [OPEN (163 KIAS maximum windows open speed)]),
		([If high CO level remains:], []),
		([#h(1em)Land], [AS SOON AS PRACTICAL]),
	)
]

// -----------------------------------------------------------------------------
// Ground Checklists and Information page
// -----------------------------------------------------------------------------
#let ground_checklists_and_info = [
	#checklist("Preflight", palette.brown,
		checklist_group("Fuel"),
		([Brakes], [AS NEEDED]),
		([Magnetos], [OFF]),
		([Fuel quantity], [CHECK VISUALLY]),
		([Fuel sumps], [DRAIN], [5 on each wing, 3 on bottom. Inspect for
			contamination.]),
		([Fuel filler caps], [SECURE]),
		checklist_group("Cabin"),
		([Pitot cover], [REMOVE]),
		([ARROW Documents], [VERIFY]),
		([G1000 reference], [ACCESSIBLE]),
		([Avionics (BUS 1 and BUS 2)], [OFF]),
		([Master], [ON], [When the master switch is on,\ treat propeller as if
			magnetos are on. Do not stand in propeller arc.]),
		([PFD], [VERIFY ON]),
		([Fuel gauges], [CHECK QUANTITY]),
		([LOW FUEL], [VERIFY NOT SHOWN]),
		([OIL PRESSURE], [VERIFY SHOWN]),
		([LOW VACUUM], [VERIFY SHOWN]),
		([Avionics fans], [CHECK], [Avionics bus 1 ON, verify fan heard,
			bus 1 OFF. Avionics bus 2 ON, verify fan heard, bus 2 OFF.]),
		([Lights], [CHECK]),
		([Flaps], [EXTEND]),
		([Tach time], [RECORD]),
		([Pitot heat], [ON], [Verify warm within 30 seconds]),
		([Pitot heat], [OFF]),
		([LOW VOLTS], [VERIFY SHOWN]),
		([Master], [OFF]),
		([Elevator trim], [TAKEOFF]),
		([Fuel selector], [BOTH]),
		([Alt static air], [OFF]),
		([Fire extinguisher], [CHECK]),
		([Control lock ], [REMOVE]),
		checklist_group("Empennage"),
		([Autopilot static], [VERIFY CLEAR]),
		([Rudder gust lock], [REMOVE]),
		([Control surfaces], [CHECK], [Freedom of movement, security]),
		([Trim tab], [CHECK SECURE]),
		([Antennas], [CHECK CONDITION]),
	)
	#checklist("Preflight (continued)", palette.brown,
		checklist_group("Right"),
		([Flap], [CHECK SECURE, CONDITION]),
		([Aileron], [CHECK FREE, SECURE]),
		([Main wheel tire], [CHECK INFLATION]),
		checklist_group("Nose"),
		([Engine oil level], [CHECK], [Minimum 5 quarts]),
		([Dipstick], [SECURE]),
		([Cooling inlets], [VERIFY CLEAR]),
		([Propeller], [CHECK FOR NICKS]),
		([Spinner], [VERIFY SECURE]),
		([Air filter], [CHECK CLEAR]),
		([Nosewheel strut, tire], [CHECK]),
		([Static source], [CHECK CLEAR]),
		checklist_group("Left"),
		([Main wheel tire], [CHECK INFLATION]),
		([Fuel vent], [VERIFY CLEAR]),
		([Pitot tube], [VERIFY CLEAR]),
		([Stall warning], [TEST]),
		([Landing, taxi lights], [CHECK CLEAN]),
		([Aileron], [CHECK FREE, SECURE]),
		([Flap], [CHECK SECURE, CONDITION]),
		checklist_group("Final"),
		([Weight and balance], [CHECKED]),
		([Flight Circle], [DISPATCH]),
		([Tach, Hobbs times], [RECORD]),
		([Baggage door], [LOCK]),
		([Chocks], [REMOVE]),
		([Tie-downs], [REMOVE]),
	)
	#checklist("Securing", palette.black,
		([Control lock], [INSTALL]),
		([Tie-downs, chocks], [APPLY]),
		([Vents, windows], [CLOSE]),
		([Pitot cover], [APPLY]),
		([Fuel selector], [LEFT or RIGHT]),
		([Tach, Hobbs times], [RECORD]),
		([Flight Circle], [CHECK IN]),
		([Doors], [LOCK]),
	)
]

// -----------------------------------------------------------------------------
// Page definitions and formatting
// -----------------------------------------------------------------------------

#set text(fallback: false, font: "DejaVu Sans")

#let heading_base_size = 8pt
#let margins = 5mm
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		= Ground Checklists #h(1fr) N66083
		#columns(2)[
			#set text(9.3pt)
			#ground_checklists_and_info
		]
		#v(1fr)
		= Version 1 #h(1fr) #include "signature.typ"
		#colbreak()
		= Operating Checklists #h(1fr) N66083
		#columns(2)[
			#set text(8.2pt)
			#operating_checklists
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Engine Failures]))
		#v(-.5em)
		#columns(2)[
			#set text(9pt)
			#engine_failures
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Instrument Failures, High CO Level]))
		#v(-.5em)
		#columns(2)[
			#set text(9pt)
			#instrument_failures_high_co
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Electrical Malfunctions]))
		#v(-.5em)
		#columns(2)[
			#set text(9pt)
			#electrical_malfunctions
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Forced Landings]))
		#v(-.5em)
		#columns(2)[
			#set text(9pt)
			#forced_landings
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#set text(heading_base_size)
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Fires]))
		#v(-.5em)
		#columns(2)[
			#set text(9pt)
			#fires
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Icing, Fuel Vapor, Abnormal Landings]))
		#v(-.5em)
		#columns(2)[
			#set text(9pt)
			#icing_vapor_abnormal_landings
		]
	]
]
