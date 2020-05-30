// Game1 in C, written sometime in 2017. Coded by @astrosteve.
// Compiles in both Windows and Linux.
// I should probably just use an integer from the start and eliminate atoi() entirely
// But I wrote this three years ago and don't feel like modifying it right now, so it stays.

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int door, choice;
char response[1];

int main()
{
    srand (time(NULL)); // Woo, yeah! Seed that random number generator!
    door = (rand()%2)+1; // This is potentially biased for a range so small.


    // printf("Door: %i\n", door); // Debug statement from when numbers weren't generating randomly for some reason.
    printf("Welcome to the game of your life!\n");
    printf("There are two ominous doors in front of you, Door 1 and Door 2. \nWhich do you open? ");
    scanf(" %[^\n]", response);
    choice = atoi(response); // response is a string and that is bad. This will make it a number!
    if (choice == door) {
    printf("You have escaped!\n");
    } else {
    printf("You are dead!\n");
    }

    return 0;
}
