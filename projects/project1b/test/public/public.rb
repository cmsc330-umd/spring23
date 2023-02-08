require "minitest/autorun"
require_relative "../../src/translate.rb"

# This is how you can load in files for testing
WORDS_FILE1 = "#{__dir__}/inputs/words1.txt"
GRAMMAR_FILE1 = "#{__dir__}/inputs/grammar1.txt"
WORDS_FILE2 = "#{__dir__}/inputs/words2.txt"
GRAMMAR_FILE2 = "#{__dir__}/inputs/grammar2.txt"
WORDS_FILE3 = "#{__dir__}/inputs/words3.txt"
GRAMMAR_FILE3 = "#{__dir__}/inputs/grammar3.txt"


class PublicTests <MiniTest::Test
    def setup
        @@translator = Translator.new(WORDS_FILE1, GRAMMAR_FILE1)
        @@translator2 = Translator.new(WORDS_FILE2, GRAMMAR_FILE2)
        @translator3 = Translator.new(WORDS_FILE3, GRAMMAR_FILE3)
    end

    def test_update
        assert_nil(@translator3.generateSentence("German", "German"))
        @translator3.updateGrammar(GRAMMAR_FILE1)
        assert(@translator3.generateSentence("German", "German"))
        assert_nil(@translator3.generateSentence("French", "French"))
        @translator3.updateLexicon(WORDS_FILE1)
        assert(@translator3.generateSentence("French", "French"))
    end

    def test_generateSentence
        assert(@@translator.generateSentence("English", "French").match?(/(blue|red) (truck|sea|fork) the/))
        assert_equal(@@translator.generateSentence("English", ["DET", "ADJ", "NOU"]).match?(/the (blue|red) (truck|sea|fork)/), true)
        assert_nil(@@translator.generateSentence("Italian", ["DET", "ADJ", "NOU"]))
        assert(@@translator.generateSentence("German", "French").match?(/(blau|rot) (meer|lkw|gabel) der/))
        assert(@@translator.generateSentence("French", ["NOU", "DET"]).match?(/mer le/))
        assert(@@translator.generateSentence("German", ["ADJ", "DET", "NOU"]).match?(/(blau|rot) der (lkw|meer|gabel)/))
        assert_equal(@@translator.generateSentence("Italian", ["NOU"]), "forchetta")
    end

    def test_generateSentence2
        assert(@@translator.checkGrammar(@@translator.generateSentence("English", ["DET", "ADJ", "NOU"]), "English"))
        assert(@@translator.checkGrammar(@@translator.generateSentence("German", ["NOU", "ADJ"]), "German"))
        assert(@@translator.checkGrammar(@@translator.generateSentence("French", ["ADJ", "NOU", "DET"]), "French"))
        assert(@@translator.checkGrammar(@@translator.generateSentence("Spanish", ["DET", "NOU", "DET"]), "Spanish"))
    end

    def test_checkGrammar
        assert(@@translator.checkGrammar("el camion el", "Spanish"))
        assert(@@translator.checkGrammar("meer rot", "German"))
        assert_equal(@@translator.checkGrammar("the truck blue", "English"), false)
        assert_equal(@@translator.checkGrammar("el camion azul", "Spanish"), false)
        assert_equal(@@translator.checkGrammar("der blau LKW", "German"), false)
        assert_equal(@@translator.checkGrammar("blue the truck", "English"), false)
        assert(@@translator.checkGrammar("rouge mer le", "French"))
    end

    def test_changeGrammar
        assert_equal(@@translator.changeGrammar("blue the truck", ["ADJ", "DET", "NOU"], ["DET", "ADJ", "NOU"]), "the blue truck")
        assert_equal(@@translator.changeGrammar("der rot meer", ["DET", "ADJ", "NOU"], ["ADJ", "NOU", "DET"]), "rot meer der")
        assert_equal(@@translator.changeGrammar("bleu mer le", "French", "English"), "le bleu mer")
        assert_equal(@@translator.changeGrammar("rojo camion", ["ADJ", "NOU"], ["NOU", "ADJ"]), "camion rojo")

        assert(@@translator.changeGrammar(@@translator.generateSentence("Spanish", ["DET", "NOU", "DET"]), "Spanish", ["DET", "DET", "NOU"]).match?(/el el camion/))
        assert(@@translator.changeGrammar(@@translator.generateSentence("English", ["DET", "NOU", "ADJ"]), ["DET", "NOU", "ADJ"], ["ADJ", "NOU", "DET"]).match?(/(blue|red) (truck|sea|fork) the/))
        assert(@@translator.changeGrammar(@@translator.generateSentence("French", ["DET", "NOU", "ADJ"]), ["DET", "NOU", "ADJ"], ["ADJ", "NOU", "DET"]).match?(/(bleu|rouge) mer le/))
    end

    def test_changeLanguage
        assert_equal(@@translator.changeLanguage("the blue truck", "English", "Spanish"), "el azul camion")
        assert_equal(@@translator.changeLanguage("the blue sea", "English", "German"), "der blau meer")
        assert_equal(@@translator.changeLanguage("el camion el", "Spanish", "German"), "der lkw der")
        assert_equal(@@translator.changeLanguage("el camion el", "Spanish", "English"), "the truck the")
        assert_equal(@@translator.changeLanguage("bleu mer le", "French", "German"), "blau meer der")
        assert_equal(@@translator.changeLanguage("gabel blau", "German", "English"), "fork blue")
        assert_equal(@@translator.changeLanguage("lkw rot", "German", "Spanish"), "camion rojo")
    end

    def test_translate
        assert_equal(@@translator.translate("the blue sea", "English", "French"), "bleu mer le")
        assert_equal(@@translator.translate("rouge mer le", "French", "English"), "the red sea")

        assert_nil(@@translator.translate("the blue sea", "English", "Spanish"))
        assert_nil(@@translator.translate("rojo mer le", "French", "Spanish"))
        assert_nil(@@translator.translate("el camion el", "Spanish", "French"))
        assert_nil(@@translator.translate("el camion el", "Spanish", "German"))
        assert_nil(@@translator.translate("el camion el", "Spanish", "English"))
    end

    def test_checkGrammar2
        assert(@@translator2.checkGrammar(@@translator2.generateSentence("L1", ["NOU", "AJD", "JKJ"]), "L1"))
        assert(!@@translator2.checkGrammar(@@translator2.generateSentence("L2", ["JKJ", "NOU", "AJD"]), "L2"))
        assert(!@@translator2.checkGrammar(@@translator2.generateSentence("L3", ["JKJ", "AJD", "NOU"]), "L3"))
        assert(@@translator2.checkGrammar(@@translator2.generateSentence("L4", ["AJD", "NOU", "JKJ"]), "L4"))
    end

    def test_changeLanguage2
        assert_equal(@@translator2.changeLanguage("w-onenine w-one w-six", "English", "L1"), "w-twozero w-two w-seven")
        assert_equal(@@translator2.changeLanguage("w-onenine w-one w-six", "English", "L2"), "w-twoone w-three w-nine")
        assert_equal(@@translator2.changeLanguage("w-twozero w-two w-oneseven", "L1", "L2"), "w-twoone w-three w-onesix")
        assert_equal(@@translator2.changeLanguage("w-onesix w-onesix w-twoone w-three", "L2", "L1"), "w-oneseven w-oneseven w-twozero w-two")
    end

    def test_translate2
        assert_equal(@@translator2.translate("w-onenine w-one w-onefour", "English", "L1"), "w-twozero w-two w-oneseven")
        assert_equal(@@translator2.translate("w-twozero w-two w-oneseven", "L1", "English"), "w-onenine w-one w-onefour")
        res = @@translator2.translate("w-oneeight w-oneeight w-onetwo w-twoseven", "L3", "L2")
        assert(res == "w-onesix w-onesix w-twosix w-oneone" || res == "w-onesix w-onesix w-twosix w-onethree")
        assert_equal(@@translator2.translate("w-five w-threeone w-onefive", "L4", "L1"), "w-twonine w-two w-oneseven")
        assert_equal(@@translator2.translate("w-twonine w-two w-oneseven", "L1", "L4"), "w-five w-threeone w-onefive")
    end
end
