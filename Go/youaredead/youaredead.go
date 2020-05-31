/*************************************/
/* YOU ARE DEAD! v1.0                */
/*************************************/
/* This was just a practice package  */
/* that was written to make sure     */
/* I understood how importing custom */
/* packages worked.                  */
/*************************************/

package youaredead

import (
	"fmt"
	"time"
)

// YouAreDead tells people that they're dead. In case they don't know.
//   This comment is added so the IDE doesn't compliain that there isn't
//   a comment explaining what this function does. Probably best practices
//   to have it here anyhow so it's nice as a reference reminder.
func YouAreDead() {
	// Only job of this function is to alert someone of their living status.
	// It is important enough to deserve its own function.

	fmt.Println("YOU ARE DEAD!")
	time.Sleep(5 * time.Second)
	// Added a 5-second pause to allow for Windows clients to view the message.
}
