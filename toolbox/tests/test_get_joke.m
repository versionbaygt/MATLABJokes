classdef test_get_joke < matlab.unittest.TestCase

    methods (Test)
        % Test methods
        function exampleTest(testCase)
            j = get_joke();
            testCase.verifyEqual(class(j),'string')
            j = get_joke("jokeNumber",2);
            testCase.verifyEqual(class(j),'string')
            j = get_joke("language","english");
            testCase.verifyEqual(class(j),'string')
            j = get_joke(language="english");
            testCase.verifyEqual(class(j),'string')
            j = get_joke(jokeNumber=2);
            testCase.verifyEqual(class(j),'string')
            j = get_joke(jokeNumber=2,language="english");
            testCase.verifyEqual(class(j),'string')
            j = get_joke(language="english",jokeNumber=2);
            testCase.verifyEqual(class(j),'string')
        end
        function languageEnglishTest(testCase)
            j = get_joke("jokeNumber",2,"language","english");
            testCase.verifyEqual(j,"How many programmers does it take to change a light bulb? None. It’s a hardware problem.")
        end
    end

end
