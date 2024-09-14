# Contributing to Jokes in MATLAB

What help is needed:
* Adding new jokes
* Adding new jokes in different languages
* Helping with documentation
* Making the App more professional
* Ensuring the jokes are appropriate
* ...

  
## How to contribute
Go to GitHub Repository
Look at Issues and see if anything there you would like to help
If not there, create an issue
Fork repository
Do you work
Create a Pull Request in to Repository

## Development Guidelines
make sure the tests pass
try to develop code that works from R2021a onwards

## Adding Jokes

### Adding jokes to an existing language
There are 3 steps to adding new jokes.

1. Open get_joke
2. Add them to the end - don't change the order
3. Run all tests in test folder and make sure the everything is still working

### Adding a new language
There are 5 steps:

1. Open get_joke.m
2. Add case with the language in lower case
3. create a variable jokes in the same way other languages have done this
4. update test_get_joke and make sure there is at least one test for the new language
5. Ensure all tests pass
