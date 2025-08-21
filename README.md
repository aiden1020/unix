# UNIX SYSTEM PROGRAMMING (CSE365) - NSYSU

This directory contains the assignments for the UNIX SYSTEM PROGRAMMING course (CSE365) at National Sun Yat-sen University (NSYSU).

## Assignments

### PA1: Flush Test (`flushtest`)

This assignment is an introduction to C-shell scripting. The goal is to create a script that determines if a 5-card poker hand is a "flush" (all cards of the same suit).

*   **Skills:** Basic shell scripting, command substitution, pipes, file redirection.
*   **Commands:** `cd`, `ls`, `xargs`, `fgrep`, `cut`, `echo`, `rm`.

### PA2: Poker Hand Analyzer (`PA2.csh`)

This assignment builds upon PA1. The script is extended to identify a wider variety of poker hands, including pairs, three of a kind, four of a kind, full house, and straights.

*   **Skills:** More advanced shell scripting, regular expressions, text manipulation.
*   **Commands:** `grep`, `tr`, `uniq`, `sort`, `expr`.

### PA3: Advanced Poker Hand Evaluator (`PA3.csh`)

This is a more advanced C-shell scripting assignment that introduces random hand generation and a more efficient hand evaluation logic using arrays and `switch` statements.

*   **Skills:** Advanced shell scripting concepts like arrays, loops, and conditional statements.
*   **Commands:** `seq`, `sort -R`, `head`, `switch`.

### PA5 & PA5a: `sed` Stream Editor

This is a two-part assignment focused on using the `sed` stream editor to score a poker hand.

*   **PA5a (`PA5a.sed`):** The first part of the assignment, where you use a limited set of `sed` commands to identify a "flush" or "four of a kind".
*   **PA5 (`PA5.sed` & `tester.csh`):** The full assignment, where you complete a `sed` script to identify all poker hands and a C-shell script to deal the cards.
*   **Skills:** Stream editing, pattern matching, text substitution.
*   **Commands:** `sed`.

### PA6: `awk` Data Cleaning (`PA6.awk`)

This assignment focuses on using the `awk` programming language to clean and format data from a large text file. The task is to extract database entries and captain's logs from a ChatGPT conversation.

*   **Skills:** `awk` programming, associative arrays, text processing, data extraction.
*   **Commands:** `awk`.
