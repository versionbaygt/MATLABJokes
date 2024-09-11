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

plan("docs").Inputs = "toolbox/doc/**/*.mlx";
plan("docs").Outputs = plan("docs").Inputs. ...
    replace(".mlx",".html").replace("toolbox/doc","html");
    

% Make the "archive" task the default task in the plan
plan.DefaultTasks = "release";

plan("release").Dependencies = ["test", "build"];

end

function docsTask(context)
makeFolder("html")
mlxFiles = context.Task.Inputs.paths;
htmlFiles = context.Task.Outputs.paths;
for idx = 1:numel(mlxFiles)
    fprintf("Exporting: %s\n",mlxFiles(idx));
    fprintf("Exporting: %s\n",htmlFiles(idx));
    export(mlxFiles(idx),htmlFiles(idx));
end
end

function buildTask(context)
currentPath = context.Plan.RootFolder;
matlab.apputil.package(fullfile(currentPath, "apps", "jokeApp.prj"));
while (~exist(fullfile(currentPath, "apps", "jokeApp.mlappinstall"), "file"))
    pause(0.1)
end
movefile(fullfile(currentPath, "apps", "jokeApp.mlappinstall"), fullfile(currentPath, "toolbox"))
end

function releaseTask(~)

projectFile = "toolboxPackaging.prj";
opts = matlab.addons.toolbox.ToolboxOptions(projectFile);
opts.OutputFile = opts.OutputFile.replace(" in MATLAB", "");
opts.ToolboxVersion = "0.6.1";
matlab.addons.toolbox.packageToolbox(opts);

end

function makeFolder(folder)
% Creates a folder if it doesn't exist
fullFolder = fullfile(pwd, folder);
if exist(fullFolder,"dir")
    return
end
disp("Creating """ + folder + """ folder");
mkdir(fullFolder);
end