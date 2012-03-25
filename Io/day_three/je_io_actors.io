NasaCounter := Object clone
NasaCounter even := 100
NasaCounter odd := 99
NasaCounter countEven := method(
			while ( even >= 0, 
				writeln(".", even); 
				even = (even-2);
				yield
				)
			)

NasaCounter countOdd := method (
			while ( odd >= 0, 
				writeln("..", odd); 
				odd = (odd-2);
				yield
				)
			)
odd := NasaCounter clone;
even := NasaCounter clone

odd @@countOdd; even @@countEven

Coroutine currentCoroutine pause
