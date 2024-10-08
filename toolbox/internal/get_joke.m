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
            "Em uma festa dos triângulos no prédio da matemática da USP estavam presentes o Cateto Adjacente, a Hipotenusa, o Ângulo Reto, o Seno, Cosseno, a Tangente, e quando chega o Cateto Oposto ele diz: Nossa, Cotangente!"
            "Existem 10 tipos de pessoas no mundo: aquelas que entendem binário e aquelas que não entendem."
            "Quantos programadores são necessários para trocar uma lâmpada? Nenhum. É um problema de hardware."
            "Como se chamam 8 hobbits? Um hobbyte."
            "Qual é a maior mentira de todo o universo? Eu li e concordo com os Termos & Condições."
            "Define a tua password de wifi para 2444666668888888. Então, quando alguém perguntar, dizes que é 12345678."
            "Mudei a minha password para 'incorreta'. Assim, sempre que me esqueço dela, o computador diz: A tua password é 'incorreta.'"
            "Porque é que os programadores confundem sempre o Halloween com o Natal? Porque Oct 31 = Dec 25."
            "Qual é o local de encontro favorito de um programador? Foo Bar."
            "Porque é que o teclado foi promovido? Porque dava sempre 'enter' nas melhores ideias."
            "O que é que o programador disse à sua aplicação preferida? És a API do meu coração."
            "Porque é que o ficheiro .zip foi de férias?Para descomprimir."
            "Porque é que o website foi ao dentista? Tinha um problema de root."
            "Qual é a sobremesa favorita de um engenheiro de software? Cookies."
            "Como é que se sabe que um programador está apaixonado? Ele está sempre a falar de arrays e loops infinitos."
            "Como é que o computador pediu um café? Por favor, insere um comando."
            "O que é que o computador disse ao programador? Desculpa, não entendo o teu código."
            "Como é que o hacker assina um email? Com um 'byte' de despedida."
            "Porque é que o administrador de sistemas é tão calmo? Porque está sempre em modo de espera."
            "Como é que um programador pede desculpa? Foi um erro de sintaxe."
            "Porque é que o firewall foi a uma festa? Para filtrar a multidão."
            "Porque é que o programador usa sempre óculos? Porque não consegue ver o problema."
            "Como é que um programador termina uma relação? 404: sentimento não encontrado."
            "O que é que o DevOps disse ao administrador de sistemas? Devagar se vai ao deploy."
            "Como é que o HTML pediu o CSS em namoro? Tu dás estilo à minha vida."
            ];
    case "dutch"
        jokes = [
            "Mijn software heeft nooit bugs. Het ontwikkelt gewoon willekeurige functies."
            "Mijn wachtwoord is de laatste 16 cijfers van Pi."
            "Ik zou je een UDP-grap vertellen, maar je krijgt hem misschien niet."
            "Gegeven een cirkelvormige pizza met straal z en dikte a, geef het volume van de pizza terug. pi*z*z*a."
            ];
    case "italian"
        jokes = [
            "Data una pizza circolare con raggio z e spessore a, restituisci il volume della pizza. pizz*a"
            "La mia password sono le ultime 16 cifre di Pi."
            "Esistono 10 tipi di persone al mondo: quelli che capiscono il binario e quelli che non lo capiscono."
            "Quanti programmatori servono per cambiare una lampadina? Nessuno. È un problema di hardware."
            "Come si chiamano 8 hobbit? Un hobbyte."
            "Qual è la più grande bugia dell'universo? Ho letto e accetto i Termini e Condizioni."
            "Imposta la tua password wifi su 2444666668888888. Quindi, quando qualcuno te la chiede, dici che è 12345678."
            "Perché i programmatori confondono sempre Halloween con Natale? Perché Oct 31 = Dec 25."
            "Qual è il posto preferito per incontrarsi di un programmatore? Foo Bar."
            ];
    case "czech"
        jokes = [
            "Můj software nikdy nemá chyby. Jen rozvíjí náhodné funkce."
            "Moje heslo je posledních 16 číslic Pí."
            "Řekl bych ti vtip o UDP, ale možná ho nepřijmeš."
            "Máme-li kruhovou pizzu s poloměrem z a tloušťkou a, vypočítejte objem pizzy. pi*z*z*a."
            "Tenhle release je poslední. Žádný další nebude."
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
