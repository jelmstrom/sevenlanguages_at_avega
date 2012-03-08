l := list( 1,2,3)
l myAverage := method(
	e := try(
		self average println
	)
	e catch(Exception,
		"error" println 
	)
)

l myAverage
l empty


l myAverage


