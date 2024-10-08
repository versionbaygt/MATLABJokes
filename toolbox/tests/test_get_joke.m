classdef test_get_joke < matlab.unittest.TestCase

    methods (Test)
        % Test methods
        function exampleTest(testCase)
            j = get_joke();
            testCase.verifyClass(j, "string")
            j = get_joke("jokeNumber", 2);
            testCase.verifyClass(j, "string")
            j = get_joke("language", "english");
            testCase.verifyClass(j, "string")
            j = get_joke("jokeNumber", 2, "language", "english");
            testCase.verifyClass(j, "string")
            j = get_joke("language", "english", "jokeNumber", 2);
            testCase.verifyClass(j, "string")
        end
        function languageEnglishTest(testCase)
            j = get_joke("jokeNumber", 2, "language", "english");
            testCase.verifyEqual(j, "How many programmers does it take to change a light bulb? None. It's a hardware problem.")
        end
        function languagePortugueseTest(testCase)
            j = get_joke("jokeNumber", 2, "language", "portuguese");
            testCase.verifyEqual(j, "O meu password sao os ultimos 16 digitos de Pi.")
        end
        function languageDutchTest(testCase)
            j = get_joke("jokeNumber", 2, "language", "dutch");
            testCase.verifyEqual(j, "Mijn wachtwoord is de laatste 16 cijfers van Pi.")
        end
        function languageItalianTest(testCase)
            j = get_joke("jokeNumber", 2, "language", "italian");
            testCase.verifyEqual(j, "La mia password sono le ultime 16 cifre di Pi.")
        end
        function languageCzechTest(testCase)
            j = get_joke("jokeNumber", 1, "language", "czech");
            testCase.verifyEqual(j, "Můj software nikdy nemá chyby. Jen rozvíjí náhodné funkce.")
        end
    end

end
