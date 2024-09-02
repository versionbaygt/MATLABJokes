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

function releaseTask(context)
projectFile = "toolboxPackaging.prj";
currentPath = context.Plan.RootFolder; % Needed of creating releases
opts = matlab.addons.toolbox.ToolboxOptions(projectFile);
opts.OutputFile = opts.OutputFile.replace(" in MATLAB","");
opts.ToolboxGettingStartedGuide = fullfile(currentPath,"toolbox","doc","GettingStarted.mlx");
opts.ToolboxImageFile = fullfile(currentPath,"images","Jokes in MATLAB.png");
opts.ToolboxFiles = [
    fullfile(currentPath,"toolbox","app","displayJoke.html");
    fullfile(currentPath,"toolbox","app","jokeApp.mlapp");
    fullfile(currentPath,"toolbox","app","jokeApp.mlappinstall");
    fullfile(currentPath,"toolbox","app","jokeApp_resources","icon_16.png");
    fullfile(currentPath,"toolbox","app","jokeApp_resources","icon_24.png");
    fullfile(currentPath,"toolbox","app","jokeApp_resources","icon_48.png");
    fullfile(currentPath,"toolbox","doc","GettingStarted.mlx");
    fullfile(currentPath,"toolbox","doc","helptoc.xml");
    fullfile(currentPath,"toolbox","info.xml");
    fullfile(currentPath,"toolbox","internal","get_joke.m");
    fullfile(currentPath,"toolbox","joke.m");
    fullfile(currentPath,"toolbox","tests","test_get_joke.m");
    fullfile(currentPath,"toolbox","tests","test_joke.m");
    fullfile(currentPath,"toolbox","tests","test_jokeApp.m");
    ];
opts.ToolboxMatlabPath = [fullfile(currentPath,"toolbox");
    fullfile(currentPath,"toolbox","app");
    fullfile(currentPath,"toolbox","app","jokeApp_resources");
    fullfile(currentPath,"toolbox","doc");
    fullfile(currentPath,"toolbox","internal");
    fullfile(currentPath,"toolbox","tests");
    ];

opts.ToolboxVersion = "0.3.3";
opts
opts.ToolboxFiles
!ls
matlab.addons.toolbox.packageToolbox(opts);
end