/************************************/
/* Game 1 -- The Game of Your Life  */
/* Epic Text Adventure Game         */
/* Coded by @b4yp                   */
/* (c) 198x, KB and SB              */
/* -------------------------------- */
/* v1.0 - First Version (no sound)  */
/************************************/

package main

import ( // Import various standard Go packages.
	"fmt"       // Text formatting and basic i/o.
	"math/rand" // Random number features.
	"time"      // Time stuff (for random number seeding).
)

func main() {
	// Print Game Title
	titleprint()

	// Print and Process Input from Main Menu
	gamesel := mainmenu()

	// Process Menu Selection and Play Game or Exit
	switch {
	case gamesel == 1: // Case 1. Play the game.
		doors := getrandom(50) // Get random number of door sets.
		doorsleft := doors     // Initialize "doors left" to total doors.
		for doorsleft > 0 {    // Loop while there are non-zero amount of doors.
			doorsleft = opendoors(doorsleft, doors) // Call routine to open doors.
		}
	case gamesel == 2: // Case 2. "Quit the game." -- Bad end.
		fmt.Println()
		fmt.Println("You are a cowardly fool!")
		fmt.Println("Why else would you chicken out of such a noble challenge?")
		fmt.Println("Quitting is NOT an option which will keep you alive.")
		fmt.Println("Therefore...")
		youaredead()
		fmt.Println("Have a nice day. :)")
	case gamesel < 1 || gamesel > 2: // Case 3. "Invalid selection" -- Bad end.
		fmt.Println()
		fmt.Println("You have chosen an invalid selection.")
		fmt.Println("A piano falls from the sky, crushing you to death.")
		fmt.Println("Your adventure has completed before it began.")
		youaredead()
		fmt.Println("Maybe follow directions next time. :)")
	}
}

func youaredead() {
	// Only job of this function is to alert someone of their living status.
	// It is important enough to deserve its own function.

	fmt.Println("YOU ARE DEAD!")
	time.Sleep(5 * time.Second)
	// Added a 5-second pause to allow for Windows clients to view the message.
}

func titleprint() {
	// Function that exists exclusively to print the title.

	fmt.Println()
	fmt.Println("Game 1 -- The Game of Your Life")
	fmt.Println("(c)198x, KB and SB, v1.0g")
	fmt.Println()
}

func mainmenu() int {
	// Prints the main menu and returns selection.
	var selection int

	fmt.Println("Main Menu")
	fmt.Println("1. Walk Through Doors")
	fmt.Println("2. Quit")
	fmt.Printf("Selection (1 or 2): ")
	fmt.Scan(&selection) // Scan for integer selection.

	return selection // Return selection to main to process menu choice.
}

func opendoors(doorcount int, totaldoors int) int { // Let's go through some doors!
	var selection int

	fmt.Println()
	fmt.Println("You see two omnious-looking doors in front of you.")
	fmt.Println("You must pick one to go through.")
	fmt.Println("There are", doorcount, "door sets of", totaldoors, "left to escape.")
	fmt.Printf("Pick one (1 or 2): ")
	fmt.Scan(&selection) // Scan for integer selection.

	deathdoor := getrandom(2) // Pick which door will dead-ify you.

	switch {
	case selection < 1 || selection > 2: // Case 1. Invalid selection. Bad end.
		fmt.Println()
		fmt.Println("You have selected a door that doesn't exist.")
		fmt.Println("Do you know what that means?")
		fmt.Println("Yup..")
		youaredead()
		fmt.Println("Maybe you need new glasses..")
		doorcount = 1 // Reset door count to "1" so program exits.
	case deathdoor == selection: // Case 2. Ya chose wrong, bud. Bad end.
		fmt.Println()
		youaredead()
		doorcount = 1 // Reset door count to "1" so program exits.
	case deathdoor != selection: // Case 3. Chose right! e,x05! Good jeorb.
		fmt.Println()
		if doorcount == 1 { // If this is the last door, then yay! You win!
			fmt.Println("Congratulations! You escaped!")
			fmt.Println("You get a cookie! Or a beer. Or whatever.")
			fmt.Println("But most importantly...")
			time.Sleep(5 * time.Second)
			fmt.Println("YOU ARE NOT DEAD!!!")
			time.Sleep(5 * time.Second)
		} else { // If this isn't the last door then keep going!
			fmt.Println("ON TO THE NEXT SET OF DOORS!")
		}
	}

	return doorcount - 1 // Subtract 1 to get remaining door sets to pass back.
}

func getrandom(rollamt int) int {
	// General purpose, reusable, integer random number generator.
	// rand.Intn(int) returns a value between 0 and n, so add 1 to return.
	var randnum int
	rand.Seed(time.Now().UnixNano()) // Use Unix-formatted time for random seed.

	randnum = rand.Intn(rollamt) // Get random number (integer).
	randnum = randnum + 1        // Add "1" to random number, since it starts at "0".

	return randnum // Here's your random number. Enjoy that!
}
