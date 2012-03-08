
nr := (Random() value * 100) round

#writeln("nr = ", nr);

nrOfTries := 1;
maxNumberOfTries := 10;
foundIt := false;

io := File standardInput();

maxNumberOfTries repeat (
  write("Försök nr ", nrOfTries, ": ");
  guess := io readLine() asNumber;
  if(guess > nr, 
	writeln("Colder"), 
	writeln("Hotter")
  );
  writeln("");

  if(guess == nr, foundIt = true; break);
  if(nrOfTries == 10, break)

  nrOfTries = nrOfTries + 1;
);

if(foundIt,
  writeln("Grattis, du lyckades på ", nrOfTries, " försök!"),
  writeln("Fail!, du MISlyckades på ", nrOfTries, " försök!")
)