      ******************************************************************
      *Author: David Nguyen
      *Date: September 24, 2021
      *Purpose: lab2
      *Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID. lab2.
           AUTHOR. David Nguyen.
      *LAB EXERCISE 2.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO 'DA-S-INPUT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT PRNT-FILE ASSIGN TO 'UR-S-PRNT'.
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE
           BLOCK CONTAINS 0 RECORDS
               LABEL RECORDS ARE STANDARD.
       01  INPUT-REC PIC X(80).
       FD  PRNT-FILE
               LABEL RECORDS ARE OMITTED.
       01  PRNT-REC PIC X(80).
       WORKING-STORAGE SECTION.
       01  INPUT-DATA.
           03 I-NAME PIC X(20).
           03 I-MAJOR PIC X(4).
           03 I-YEAR PIC X(4).
       01  PRNT-DATA1.
           03 L-NAME1 PIC X(20).
           03 L-MAJOR1 PIC X(10).
           03 L-YEAR1 PIC X(10).
       01  PRNT-HEADING1.
           03 FILLER PIC X(20) VALUES 'NAME'.
           03 FILLER PIC X(10) VALUES 'MAJOR'.
           03 FILLER PIC X(10) VALUES 'YEAR'.
       01  MISC.
           03 EOF-I PIC 9 VALUE 0.
       PROCEDURE DIVISION.
       000-MAINLINE.
           OPEN INPUT INPUT-FILE
               OUTPUT PRNT-FILE
           PERFORM 2000-READ-INPUT.
           PERFORM 1400-PRINT-HEAD.
           PERFORM 1500-LOOP
               UNTIL EOF-I = 1;
           CLOSE INPUT-FILE
               PRNT-FILE.
           STOP RUN.
       1400-PRINT-HEAD.
           WRITE PRNT-REC FROM PRNT-HEADING1.
           MOVE SPACES TO PRNT-REC.
           WRITE PRNT-REC
               AFTER ADVANCING 1 LINE.
       1500-LOOP.
           PERFORM 1600-PRINT-NAMES.
           PERFORM 2000-READ-INPUT.
       1600-PRINT-NAMES.
           MOVE I-NAME TO L-NAME1.
           MOVE I-MAJOR TO L-MAJOR1.
           MOVE I-YEAR TO L-YEAR1.
           WRITE PRNT-REC FROM PRNT-DATA1
               AFTER ADVANCING 1 LINE.
       2000-READ-INPUT.
           READ INPUT-FILE INTO INPUT-DATA
               AT END MOVE 1 TO EOF-I.
       END PROGRAM lab2.
