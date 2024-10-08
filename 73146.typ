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

// General design note: The checklists are defined in variables, then the pages
// are created and formatted at the bottom of the file. This puts all the
// formatting details in one place in the file, making it easier to perform
// formatting revisions.

#import "common.typ": checklist, checklist_group

// -----------------------------------------------------------------------------
// Ground Checklists and Information page
// -----------------------------------------------------------------------------
#let ground_checklists_and_info = [
	#checklist("Preflight", black,
		checklist_group("Fluids"),
		([Magnetos], [OFF]),
		([Fuel quantity], [CHECK VISUALLY]),
		([Fuel sumps], [DRAIN],
		 [Left wing, right wing, fuel strainer. Inspect for contamination.]),
		([Fuel filler caps], [SECURE]),
		([Engine oil level], [CHECK], [Minimum 6 quarts]),
		checklist_group("Cabin"),
		([Pitot cover], [REMOVE]),
		([POH], [VERIFY PRESENT]),
		([Master], [ON]),
		([Flaps], [EXTEND]),
		([Fuel gauges], [CHECK QUANTITY]),
		([Lights], [CHECK]),
		([Tach time], [RECORD]),
		([Pitot heat], [TEST]),
		([Master], [OFF]),
		([Control lock], [REMOVE]),
		checklist_group("Empennage"),
		([Rudder gust lock], [REMOVE]),
		([Control surfaces], [CHECK], [Freedom of movement and security]),
		checklist_group("Right"),
		([Main wheel tire], [CHECK INFLATION]),
		([Aileron], [CHECK], [Freedom of movement and security]),
		checklist_group("Nose"),
		([Propeller, spinner], [CHECK], [For nicks and security]),
		([Landing light], [CHECK CLEAR]),
		([Air filter], [CHECK CLEAR]),
		([Nosewheel & strut], [CHECK INFLATED]),
		([Static source], [CHECK CLEAR]),
		checklist_group("Left"),
		([Main wheel tire], [CHECK INFLATION]),
		([Fuel tank vent], [CHECK CLEAR]),
		([Pitot tube], [CHECK CLEAR]),
		([Stall warning], [TEST]),
		([Aileron], [CHECK], [Freedom of movement and security]),
		checklist_group("Final"),
		([FlightCircle], [DISPATCH]),
		([Baggage door], [LOCK]),
		([Chocks], [REMOVE]),
		([Tie-downs], [REMOVE]),
	)
	#checklist("Securing", black,
		([Control lock], [INSTALL]),
		([Tie-downs, chocks], [APPLY]),
		([Vents, windows], [CLOSE]),
		([Pitot cover], [APPLY]),
		([Tach, Hobbs times], [RECORD]),
		([FlightCircle], [CHECK IN]),
		([Doors], [LOCK]),
	)
]

// -----------------------------------------------------------------------------
// Operating Checklists
// -----------------------------------------------------------------------------
#let operating_checklists = [
	#checklist("Start", black,
		checklist_group("Before Start"),
		([Preflight inspection], [COMPLETE]),
		([Passenger briefing], [COMPLETE]),
		([Brakes], [TEST and SET]),
		([Seats, belts, harnesses], [SECURE]),
		([Fuel valve], [BOTH]),
		([Radios, electrical equipment], [OFF]),
		([Circuit breakers], [CHECK IN]),
		([Beacon switch], [ON]),
		checklist_group("Engine Start"),
		([Mixture], [RICH]),
		([Carburetor heat], [COLD]),
		([Prime], [AS REQUIRED]),
		([Throttle], [OPEN 1/8 INCH]),
		([Master], [ON]),
		([Propeller area], [CLEAR]),
		([Ignition switch], [START], [Release when engine starts]),
		([Oil pressure], [CHECK], [If no pressure in 30 seconds, shutdown]),
		([Mixture], [GROUND LEAN]),
		checklist_group("Before Taxi"),
		([Avionics], [ON]),
		([Headset], [ON]),
		([Flaps], [RETRACT]),
		([Weather], [OBTAIN]),
		([Altimeter], [SET]),
		([EFB Setup], [AS DESIRED]),
		([Navigation, landing lights], [ON]),
	)
	#checklist("Run-up", black,
		([Instruments], [CHECK and SET]),
		([VOR Check], [IF NEEDED]),
		([Brakes], [SET]),
		([Doors and windows], [CLOSED, LOCKED]),
		([Flight controls], [FREE and CORRECT]),
		([Fuel valve], [BOTH]),
		([Mixture], [RICH], [Below 3000 feet]),
		([Throttle], [1700 RPM]),
		([Magnetos], [CHECK], [Max drop 125 RPM, max diff. 50 RPM]),
		([Engine gauges, ammeter], [CHECK]),
		([Vacuum gauge], [CHECK]),
		([Carburetor heat], [TEST]),
		([Idle], [TEST]),
		([Mixture], [GROUND LEAN]),
		([Throttle friction], [ADJUST]),
	)
	#checklist("Before Takeoff", black,
		([Radios], [SET]),
		([Instruments], [SET]),
		([Takeoff briefing], [COMPLETE]),
		([Beacon, navigation, landing lights], [ON]),
		([Carburetor heat], [AS REQUIRED]),
		([Flaps], [0-10°]),
		([Trim], [TAKEOFF]),
		([Fuel valve], [BOTH]),
		([Fuel quantity], [CHECK]),
		([Mixture], [RICH], [Below 3000 feet]),
	)
]

// -----------------------------------------------------------------------------
// Emergency Checklists (left side)
// -----------------------------------------------------------------------------
#let left_emergency_checklists = [
	#checklist("Engine Failure During Takeoff Run", black, emergency: true,
		([Throttle], [IDLE]),
		([Brakes], [APPLY]),
		([Flaps], [RETRACT]),
		([Mixture], [CUT-OFF]),
		([Magnetos], [OFF]),
	)
	// The title in the POH is "ENGINE FAILURE IMMEDIATELY AFTER TAKEOFF" but
	// that didn't fit on one line so immediately was replaced with shortly.
	#checklist("Engine Failure Shortly After Takeoff", black, emergency: true,
		([Airspeed], align(right)[Flaps up: 65 KIAS\ Flaps down: 60 KIAS]),
		([Mixture], [CUT-OFF]),
		([Fuel valve], [OFF]),
		([Magnetos], [OFF]),
		([Flaps], [AS REQUIRED]),
		([Master], [OFF]),
	)
	// POH title: EMERGENCY LANDING WITHOUT ENGINE POWER, emergency replaced
	// with forced to fit on one line.
	#checklist("Forced Landing Without Engine Power", black, emergency: true,
		([Airspeed], align(right)[Flaps up: 65 KIAS\ Flaps down: 60 KIAS]),
		([Mixture], [CUT-OFF]),
		([Fuel valve], [OFF]),
		([Magnetos], [OFF]),
		([Flaps], [AS REQUIRED], [40° recommended]),
		([Master], [OFF]),
		([Doors], [UNLATCH BEFORE TOUCHDOWN]), // "prior to" -> "before" for space
		([Touchdown], [SLIGHTLY TAIL LOW]),
		([Brakes], [APPLY HEAVILY]),
	)
	// POH title: PRECAUTIONARY LANDING WITH ENGINE POWER. Removed "with engine
	// power" to fit on one line.
	#checklist("Precautionary Landing", black, emergency: true,
		([Flaps], [20°]),
		([Airspeed], [60 KIAS]),
		([Selected field], [FLY OVER], [Note terrain/obstructions.
		 Retract flaps\ upon reaching a safe altitude and airspeed.]),
		([Radios, electrical switches], [OFF]),
		([Flaps], [40° (on final approach)]),
		([Airspeed], [60 KIAS]),
		([Master], [OFF]),
		([Doors], [UNLATCH BEFORE TOUCHDOWN]), // "prior to" -> "before" for space
		([Touchdown], [SLIGHTLY TAIL LOW]),
		([Magnetos], [OFF]),
		([Brakes], [APPLY HEAVILY]),
	)
	#checklist("Ditching", black, emergency: true,
		([Radio], [MAYDAY on 121.5 MHz], [Give location, intentions]),
		([Heavy objects], [SECURE or JETTISON]),
		([Flaps], [20°-40°]),
		([Power], [300 FT/MIN DESCENT AT 55 KIAS],
		 [If no power available, approach flaps up 65 KIAS or flaps 10° 60 KIAS]),
		([Strong wind, heavy seas:\ #h(1em)LAND INTO WIND\
		  Light wind, heavy swells:\ #h(1em)LAND PARALLEL TO SWELLS], []),
		([Doors], [UNLATCH]),
		([Touchdown], [LEVEL ATTITUDE], [at established rate of descent]),
		([Face], [CUSHION at touchdown with coat]),
		([Airplane], [EVACUATE]),
		([Life vests/raft], [INFLATE]),
	)
]

// -----------------------------------------------------------------------------
// Emergency Checklists (right side)
// -----------------------------------------------------------------------------
#let right_emergency_checklists = [
]

// -----------------------------------------------------------------------------
// Page definitions and formatting
// -----------------------------------------------------------------------------

// This is set to the minimum margin size that Ryan V's printer can support
// (experimentally-determined).
#let margins = 6mm
#page(flipped: true, margin: margins, paper: "us-letter")[
	// page() supports multiple columns, but does not support setting the gutter
	// width for multiple columns, so we call columns() ourselves instead.
	#columns(2, gutter: 2*margins)[
		= Ground Checklists and Information #h(1fr) N73146
		#columns(2)[
			#set text(9.6pt)
			#ground_checklists_and_info
		]
		#v(1fr)
		= Version 1 #h(1fr) #include "signature.typ"
		#colbreak()
		= Operating Checklists #h(1fr) N73146
		#columns(2)[
			#set text(9pt)
			#operating_checklists
		]
	]
]
#page(flipped: true, margin: margins, paper: "us-letter")[
	#columns(2, gutter: 2*margins)[
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Emergency Checklists]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(9pt)
			#left_emergency_checklists
		]
		#colbreak()
		#box(fill: red, width: 100%,
		     align(center, box(fill: white, outset: 1em)[= Emergency Checklists]))
		#v(-.5em)
		#columns(2, gutter: 2mm)[
			#set text(9pt)
			#right_emergency_checklists
		]
	]
]
