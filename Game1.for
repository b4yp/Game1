C      /************************************************************/
C      /* Game 1 - The Game of Your Life                           */
C      /* Epic Text Adventure Game                                 */
C      /* (c)198x, KB and SB                                       */
C      /* -------------------------------------------------------- */
C      /* v1.0  - First Version - no sound                         */
C      /* v1.01 - Changed to have random number of doors rather    */
C      /*         than a hard-coded 50.                            */
C      /************************************************************/
C
C      /**************************************/
C      /* ToDo: Figure out if sound possible */
C      /**************************************/

       PROGRAM GAME1

C      /* Program Variables */

       INTEGER::        I           ! Loop Counter 
       INTEGER::        NUMDOOR     ! Number of Doors
       REAL::           RNDNBR      ! Random Number
       CHARACTER::      INPUT12     ! Door Selection

C      /* I/O Format Statements*/

80     FORMAT(A1)

100    FORMAT('** GAME 1 -- THE GAME OF YOUR LIFE **')
110    FORMAT('** (c)198x, KB and SB, v1.01f      **')

200    FORMAT('You see two doors in front of you.')
210    FORMAT('You must pick one to go through.')
220    FORMAT('There are ',I2.2,' doors of ',I2.2,' left to escape!')
230    FORMAT('Pick one (1 or 2): ')

300    FORMAT('YOU ARE DEAD!!!')
310    FORMAT('ON TO THE NEXT SET OF DOORS!!!')
320    FORMAT('You picked a door that does not exist.')
330    FORMAT('A piano falls from the ceiling, crushing you to death.')

400    FORMAT('YOU ESCAPED!!!')

C      /* Write Game Name, Initialize Random Number Seed */

       WRITE(*,80)
       WRITE(*,100)
       WRITE(*,110)

       CALL INIT_RANDOM_SEED

C      /* Determine Number of Doors */

       CALL RANDOM_NUMBER(RNDNBR)
       NUMDOOR = INT((RNDNBR*100))
       
C      /* Play game - Loop through Random Numbe of Doors */

       DO I = 0,(NUMDOOR-1)
       
C         /* Get Random Number, Write Game Text */ 
          CALL RANDOM_NUMBER(RNDNBR)
          WRITE(*,200)
          WRITE(*,210)
          WRITE(*,220) (NUMDOOR-I),NUMDOOR
          
C         /* Accept Door Input* /*          
          WRITE(*,230)
          READ 80,INPUT12
          
C         /* Validate Game Input ( Dead if <> 1 or 2 ) */ 
          IF (( INPUT12 .NE. '1' ) .AND.
     +        ( INPUT12 .NE. '2' )) THEN 
     
              WRITE(*,80) ' '
              WRITE(*,320)
              WRITE(*,330)
              WRITE(*,300)
              EXIT
              
          ENDIF

C         /* Check to See if Correct Door Picked */
C         /* -- Random Number btw 0 and 1        */
          IF (((INPUT12 .EQ. '1') .AND.
     +         (RNDNBR .LE. 0.5D0)) .OR.
     +        ((INPUT12 .EQ. '2') .AND.
     +         (RNDNBR .GT. 0.5D0))) THEN
     
             IF (I .LT. (NUMDOOR-1)) WRITE(*,310)
             WRITE(*,80)
             CYCLE
             
          ENDIF
     
C         /* If Incorrect Door (Implied), Exit Loop */
          EXIT

       ENDDO

C      /* If Loop Counter < Number of Doors, Player Dead, else Escape */
       IF ( I .LT. NUMDOOR ) THEN
       
          WRITE(*,300)
          
       ELSE
       
          WRITE(*,400)
          
       ENDIF
       
       WRITE(*,80)' '
       
       END


C      /* Random Number Seed Generation */

       SUBROUTINE INIT_RANDOM_SEED()
       
             INTEGER :: I,N,CLOCK
             INTEGER, DIMENSION(:), ALLOCATABLE :: SEED
             
             CALL RANDOM_SEED(SIZE=N)
             ALLOCATE(SEED(N))
             
             CALL SYSTEM_CLOCK(COUNT=CLOCK)
             
             SEED = CLOCK + 37 * (/ (I - 1, I = 1, N) /)
             CALL RANDOM_SEED(PUT = SEED)
             
             DEALLOCATE(SEED)
             
       END
