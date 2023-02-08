# Project 1b: Translator

Due: February 19, 2023 at 11:59 PM (late February 20, *10% penalty*). 

**Test Weightage:**
 - Public: 50%
 - Semipublic: 40%
 - Secret: 10%

**This is an individual assignment. You must work on this project alone.**

## Introduction

In this project, you will be making a simple translator for very simple sentences.
To begin, we have a few things to mention.
Languages have these things called grammars. They define the structure of 
a sentence. We will talk more about grammars later in the course but for now
just consider the following:
```text
Adjective Adjective Noun Verb Adverb
```
Choose any two adjective, any noun, verb and adverb and mad-lib (substitute it)
in. You will get a grammatically correct sentence.
```text
large green trucks stop instantly
poisonous feral moose age rapidly
colourless green ideas sleep furiously
```
Notice that grammatically correct does not mean makes sense.

Adjectives, nouns, verbs, adverbs, etc are referred to as parts of speech.

For part 1 of this project, you will read in some files that describe various
languages' grammar and lexicon (the words that exist in that language).

### **File Inputs**

You will read in two files. 

#### Language File
First, a file that has a list of words, their part of speech, and their counterpart in other languages. 

The file would have the structure below:
```
word, POS, <L1>:<word1>, <L2>:<word2>, ...
```
* Each starting `word` will be considered part of the `English` language. 
    * `word` will be at least one character long
    * valid characters in `word` are lowercase alphabetic characters and the hyphen character ("-")
* `POS` is the part of speech
    * a valid `POS` will be any capitalized 3 letter code: ADJ, NOU, ADV, etc.
* `LX` is a language name (not including `English`)
    * A language `LX` starts with a capital letter, and is followed by any number of lowercase alphanumeric characters.
* `wordX` represents `word`'s equivalent in language `LX`
    * `wordX` will be a string consisting of lowercase alphabetic characters and the hyphen character ("-")
    * `wordX` will be at least one character long

For example:
```
blue, ADJ, French:bleu, German:blau, Spanish:azul, Swedish:bla
truck, NOU, Spanish:camion, German:lkw
the, DET, German:der, Spanish:el, French:le
```

Not all words will have translations to all other languages. 
It is also important to note, that some words have multiple parts of speech.
(eg. "Bank" is both a noun and a verb). If this is the case, they will be on seperate lines
```
bank, NOU, Spanish:banco
bank, VER, Spanish:ladear
```

If a line doesn't match all the above specifications, ignore the entire line.

#### Grammar File
Second, a file that describes the grammar structure of a language:

The file will have the following format
```
Lang: POSX1, POSX2, POSX3, ...
```

We will be using similar formatting as the Language File with a slight modification.
* `Lang` is a language name 
    * A language `Lang` starts with a capital letter, and is followed by any number of lowercase alphanumeric characters.
* `POSXY` denotes a single or repeated `POS`
    * a valid `POSXY` will be any capitalized 3 letter code: ADJ, NOU, ADV, etc, with an optional modifier denoting how many times it repeats in a row.
    * A valid modifier looks like `{#}` where `#` is any valid Natural number greater than zero.

For example:
```
Language: DET, ADJ{3}, NOU
English: DET, ADJ, NOU
Spanish: DET, NOU, ADJ
Swedish: DET, NOU
French: DET, NOU
German: DET, ADJ, ADJ, NOU, ADJ
```

Each language will only have one grammar structure at a time.

If a line doesn't match all the above specifications, ignore the entire line.

### **Translator Class**

You will make a `Translator` class which will hold all the words and grammars the translator will know.
When you make a new `Translator`, an initial words and grammar file will be 
provided.

You will need to design a data structure to hold all the information needed. We _highly_ recommend that you make inner classes to store the information in a more concise way.

#### **Part 1**

First initialize your data structure and then complete the following methods to add any new words/grammars to your structure.

 - `updateLexicon(inputfile)`: Update the words in your lexicon, by reading in 
 the file. If you have already seen a word, update your data structure so that any additional 
 translations are added.
 Ignore any malformed lines that do not follow the above formatting. You can assume that the inputfile is a valid file name.

 - `updateGrammar(inputfile)`: Update your grammar knowledge by reading in the 
 file. If you have already seen a language's grammatical structure, update it 
 with the new data. Ignore any malformed lines that do not follow the above formatting. You can assume that the inputfile is a valid file name.

#### **Part 2**

Here is a grammar structure of a valid English sentence:
```text
determiner adjective noun
the red truck
a small snail
their cute dog
```
However, as you may have noticed in part 1, other languages have different grammar structures. Here is an example
for Spanish sentences:
```
determiner noun adjective
el camion rojo
un pequeño caracol
su lindo perro
```

The next few methods rely on the grammatical structures of languages or the grammatical structures that are passed in.

 - `generateSentence(language, struct)`: `struct` is either a grammar, or an array of POS. Given this structure, create a sentence in the given language that 
 matches that structure. If you cannot, return `nil`.
 When multiple POS exist, you can choose any word that has that POS. 
 Using the sample files shown in the **File Inputs** section, the following examples are provided:
    + example: `generateSentence("French", "English")` -> `nil` (*Note: There are no French nouns*)
    + example: `generateSentence("German", ["NOU", "DET", "ADJ"])` -> `"der blau lkw"`
    + example: `generateSentence("Swedish", ["ADJ"])` -> `"bla"`
    + example: `generateSentence("English", "English")` -> `"the blue truck"`

 - `checkGrammar(sentence, language)`: `language` is a language name. Check if the sentence matches that language's grammatical structure and return true or false. You may assume that `sentence` is in `language`'s language.
   + example: `checkGrammar("el camion azul", "Spanish")` -> true
   + example: `checkGrammar("le bleu", "Swedish")` -> false

 - `changeGrammar(sentence, struct1, struct2)`: `struct1` is either a language name, or an array of POS. `struct2` is either a language name or a array of POS.
 Given a sentence and its structure (`struct1`), change the sentence to match `struct2`. 
This should work independently of that actual gramatical structure of `sentence` and if the words in `sentence` are actual words or not. You may assume `sentence.length == struct1.length == struct2.length`.
When multiple POS exist, you can swap the order however you want as long as your resuling sentence has all the same words in the input.
If you cannot change the structure, then return `nil`.
   + example: `changeGrammar("el azul camion", "English", "Spanish")`-> `"el camion azul"`
   + example: `changeGrammar("the blue truck", "English", "English")` -> `"the blue truck"`
   + example: `changeGrammar("le bleu", "Swedish", ["ADJ", "DET"])` -> `"bleu le"`

#### **Part 3**

Now that we can change the structure of a sentence around, let's now change it syntacitcally. 

That is
```text
the truck blue -> el camion azul
```
The last two methods deal with translating words and also changing the grammar of the sentence. 

 - `changeLanguage(sentence, language1, language2)`: 
 Given a sentence `sentence` that matched the gramatical structure of `language1`, convert the 
 entire sentence into the target language, `language2`, keeping the same grammatical structure.
 If any part of the sentence cannot be translated, then return `nil`. Otherwise return the translated sentence. 
 You may assume that each word in `sentence` is in `language1`.
    + `changeLanguage("i like cheese", "English", "French")` -> `"je aime fromage"`
    + `changeLanguage("azul le camion", "Spanish", "German")` -> `"blau der lkw"`

 - `translate(sentence, language1, language2)`: 
 Given a sentence that matches the gramtical structure of `language1`, convert the entire sentence into the target language, `language2`, and change the grammatical structure to match `language2`. 
 If any part of the sentence cannot be translated, then return `nil`. Otherwise return the translated sentence. 
   + example: `translate("the blue truck", "English", "Spanish")` -> `"el camion azul"`
   + example: `translate("el camion azul", "Spanish", "English")` -> `"the blue truck"`
