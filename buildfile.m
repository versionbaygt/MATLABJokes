function plan = buildfile
import matlab.buildtool.tasks.CodeIssuesTask
import matlab.buildtool.tasks.TestTask

% Create a plan from task functions
plan = buildplan(localfunctions);

% Add a task to identify code issues
plan("check") = CodeIssuesTask(WarningThreshold=1, ...
    Results="code-issues/results.sarif");

% Add a task to run tests
plan("test") = TestTask;

% Make the "archive" task the default task in the plan
plan.DefaultTasks = "release";

plan("release").Dependencies = ["test"];

end

function releaseTask(~)
projectFile = "toolboxPackaging.prj";
outputfile = "Jokes";
matlab.addons.toolbox.packageToolbox(projectFile, outputfile)
end