classdef test_jokeApp < matlab.uitest.TestCase
    properties
        App
    end

    methods (TestMethodSetup)
        function launchApp(testCase)
            testCase.App = jokeApp;
            testCase.addTeardown(@delete,testCase.App)
        end
    end
    methods (Test)
        % Test methods
        function exampleTest(testCase)
            button = testCase.App.TellmeajokeButton;
            for idx = 1:20
                testCase.press(button)
            end
        end
        
    end

end