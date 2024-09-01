function joke(NameValueArgs)

arguments
    NameValueArgs.jokeNumber {mustBePositive}
    NameValueArgs.language string = "english"
end

if isfield(NameValueArgs,"jokeNumber")
    joke_str = get_joke(jokeNumber=NameValueArgs.jokeNumber,language=NameValueArgs.language);
else
    joke_str = get_joke(language=NameValueArgs.language);
end

disp(joke_str);

end