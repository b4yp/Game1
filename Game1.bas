_TITLE "Game 1 - The Game of Your Life"
' **********************************
' * GAME1 -- THE GAME OF YOUR LIFE *
' **********************************
' Epic Text Adventure Game
' (c) 198x KB and SB
' ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'
' *************************************
' v1.0 - QB64 Version, First Draft, KEC
' *************************************
'
' ToDo: Figure out sound, for Game1 Classic Sont
'
' * Output Text *
Title1$ = "** GAME 1 -- THE GAME OF YOUR LIFE **"
Title2$ = "** (c) 198x KB and SB, v1.0        **"

Game1$ = "You see two doors in front of you."
Game2$ = "You must pick one to go through."
Game3$ = "Total Doors: "
Game4$ = "Doors Left to Escape: "

Result1$ = "YOU ARE DEAD!!!"
Result2$ = "ON TO THE NEXT SET OF DOORS!!!"
Result3$ = "You picked a door that does not exist."
Result4$ = "A piano falls from the ceiling, crushing you to death."

Winner$ = "YOU ESCAPED!!!"

' ************
' Main Program
' ************

' * Write Game Name *

CLS
PRINT " "
PRINT Title1$
PRINT Title2$

' * Determine Number of Doors *
' * Random Number from 0 to 100 *
' * Print Doors Required to Excape *

RANDOMIZE TIMER
TotalDoors% = INT(RND * 101)

' * Play Game *

Loops% = 0

PRINT " "
PRINT Game3$, (TotalDoors% + 1)

DO WHILE Loops% < TotalDoors%

    ' * Get Door Number (1/2), Write Game Text *'

    NumDoor% = INT(RND * 2)
    NumDoor% = NumDoor% + 1

    PRINT " "
    PRINT Game1$
    PRINT Game2$
    PRINT Game4$, ((TotalDoors% + 1) - Loops%)

    ' * Accept Door Input *

    INPUT "Pick one (1 or 2): ", Input12%

    ' * Validate Input *

    IF Input12% < 1 OR Input12% > 2 THEN

        PRINT " "
        PRINT Result3$
        PRINT Result4$
        PRINT Result1$
        END

    END IF

    ' * Check for Correct Door *

    IF NumDoor% = Input12% THEN

        ' * Correct Door *
        PRINT " "
        PRINT Result2$
        Loops% = Loops% + 1

    ELSE

        ' * Incorrect Door *
        PRINT " "
        PRINT Result1$
        END

    END IF

LOOP

' * That's All Folks *
END
