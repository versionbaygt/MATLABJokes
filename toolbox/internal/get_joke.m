function j = get_joke(NameValueArgs)
arguments
    NameValueArgs.jokeNumber {mustBeNonnegative} = 0
    NameValueArgs.language string = "english"
end

switch NameValueArgs.language
    case "english"
        jokes = [
            "There are 10 types of people in the world: those who understand binary, and those who don't."
            "How many programmers does it take to change a light bulb? None. It's a hardware problem."
            "What do you call 8 hobbits? A hobbyte."
            "I would tell you a UDP joke, but you might not get it."
            "Two bytes meet. The first byte asks ""Are you ill?"". The second byte replies ""No, just feeling a bit off."""
            "There's a band called 1023MB. They haven't had any gigs yet."
            "What is the biggest lie in the entire universe? I have read and agree to the Terms & Conditions."
            "The oldest computer can be traced back to Adam and Eve. It was an apple but with extremely limited memory. Just 1 byte. And then everything crashed."
            "Set your wifi password to 2444666668888888. So when someone asks for it, tell them it's 12345678."
            "What do you call a computer mouse that swears a lot? A cursor!"
            "I changed my password to incorrect. So whenever I forget what it is the computer will say: Your password is incorrect."
            "Where does the USA keep its backups? USB."
            "Why do programmers always mix up Halloween and Christmas? Because Oct 31 = Dec 25."
            "Why do most programmers use a dark theme while coding? Because light attracts bugs."
            "Why did the programmer go broke? Because he used up all his cache."
            "What's a programmer's favorite spot? The address bar."
            "What is a programmer's favorite hangout place? Foo Bar."
            "Why was the computer cold? It left its Windows open."
            "What's a pirate's favorite programming language? R. But he also likes the C."
            "To err is human - and to blame it on a computer is even more so."
            "My software never has bugs. It just develops random features."
            "The more I C, the less I see."
            "My password is the last 16 digits of Pi."
            "What made the Java developers wear glasses? They can't C."
            "I would tell you a UDP joke, but you might not get it."
            "Why did the software engineer stay cool under pressure? Because he had excellent exception handling."
            "Given a circular pizza with radius z and thickness a, return the pizza's volume. pi*z*z*a."
            ];
    case "portuguese"
        jokes = [
            "Dada uma pizza circular com raio z e espessura a, retorne o volume da pizza. pi*z*z*a"
            "O meu password sao os ultimos 16 digitos de Pi."
            ];
    case "dutch"
        jokes = [
            "Mijn software heeft nooit bugs. Het ontwikkelt gewoon willekeurige functies."
            "Mijn wachtwoord is de laatste 16 cijfers van Pi."
            "Ik zou je een UDP-grap vertellen, maar je krijgt hem misschien niet."
            "Gegeven een cirkelvormige pizza met straal z en dikte a, geef het volume van de pizza terug. pi*z*z*a."
            ];
    otherwise
        error("Language not supported")

end

if NameValueArgs.jokeNumber == 0
    % choose a random joke
    j = jokes(randi(numel(jokes)));
else
    if NameValueArgs.jokeNumber <= numel(jokes)
        j = jokes(NameValueArgs.jokeNumber);
    else
        error("Joke Number does not exist in this language")
    end
end

end
