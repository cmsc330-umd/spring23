# Discussion 8 - Friday, March 31<sup>st</sup>

## Reminders
1. Project 3 is due on April 5th
2. Quiz 3 regrade requests open until April 7th

## Context Free Grammars

<img width="500" alt="image" src="https://github.com/umd-cmsc330/spring23-ta/blob/main/discussions/d8_cfg/cfg.png?raw=true">

### Practicing Derivations
Grammar: S -> S + S | 1 | 2 | 3

Leftmost derivation of 1 + 2 + 3
* Start with S and use the production rules on the LEFTMOST nonterminal ONE AT A TIME. (For a rightmost derivation, use the productions on the RIGHTMOST nonterminal.)
* ONE NONTERMINAL AT A TIME!!!! DON'T COMBINE STEPS!!!!
* S -> S + S -> S + S + S -> 1 + S + S -> 1 + 2 + S -> 1 + 2 + 3
* S -> S + S -> 1 + S -> 1 + S + S -> 1 + 2 + S -> 1 + 2 + 3 works too

Note: If there are 2 leftmost derivations or 2 rightmost for the same string, what does that mean? The grammar is ambiguous.
  * To show that a grammar is ambiguous, show 2 different leftmost or rightmost derivations for the same string.
  * You must give 2 leftmost or 2 rightmost derevations, not one leftmost and one rightmost
  * It's hard to know whether a grammar is ambiguous or not, but be suspicious if you see something along the lines of S -> SS, S -> SSS, S -> S+S, etc.
  
### More CFG Practice
Given the following grammar:

S -> aS | T </br>
T -> bT | U </br>
U -> cU | ε </br>

Provide derivations for:
* b
* ac
* bbc

What language is accepted by this grammar?

Create another grammar that accepts the same language.

### Parsing Practice (Drawing ASTs)
Given the string "(4 + (5 * (6 + 7)))" and the grammar below, draw the corresponding AST.

S -> M + S | M

M -> N * M | N

N -> n | (S)

where n is any integer
