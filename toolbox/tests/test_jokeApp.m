classdef test_jokeApp < matlab.uitest.TestCase
    properties
        App
    end

    methods (TestClassSetup)
        function runOnlyInSupportedEnvironment(testCase)
            testCase.assumeFalse(isMATLABReleaseOlderThan('R2023b') && isRunningInCI(), ...
                'App testing is currently not working in CI for R2023a and older.');
            testCase.assumeFalse(ismac() && isMATLABReleaseOlderThan('R2025a') && isRunningInCI(), ...
                'App testing is currently not working in CI for R2024b and older on macOS.');
        end
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

function TF = isRunningInCI()
    TF = ~isempty(getenv('CI'));
end
