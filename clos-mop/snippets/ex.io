// Message passing taken from here → https://gist.github.com/jezen/7972975

"Hello world!" print

#Factorial

factorial := method(n, if(n == 1, 1, n * factorial(n - 1)))

#Create a simple object and show how to use it

Account := Object clone
Account balance := 0
Acc deposit  := method(v, balance = balance + v)
Acc withdraw := method(v, balance = balance - v)
Acc show := method(
  writeln("Account balance: $", balance)
)

myAccount := Account clone
myAccount show
"Depositing $10\n" print
myAccount deposit(10)
myAccount show

#Add a method to a primitive

Number double := method(self * 2)
1 double
==> 2

#Subclass a primitive

MyList := List clone // Same as creating an instance

#Iterate through an inheritance hierarchy

# NOTE: This is a bit changed to remove proto lookup
Object printAllSlots := method(
  self slotNames foreach(i, slotName, writeln(slotName))
)
Object printAllSlots

#Implement a generic proxy

# NOTE: Changed for new io
Proxy := Object clone
Proxy forward := method(
  methodName := call message_name
  args := call message argsEvaluatedIn(call sender)

  print(methodName)
  print(args)

  // When an unrecognized message is received,
  // this method will be invoked.
  // Do what you like with the message here -
  // such as send it over a network, etc.
)

#Implement a singleton

Foo := Object clone
Foo clone := Foo

#Mixins and Aspects

a := Object clone

Mix := Object clone
Mix logData := Buffer clone
Mix init := method(logData = logData clone)
Mix log := method(s, logData append(s))

a parent := Mix clone // Now a also inherits the state and behavior of Mix

b := Object clone
b parent := Mix clone // Now multiple objects use it so it's an "aspect"

#An auto source file importer

Object searchPaths = List clone add(launchPath)

Object forward := method(
  methodName := call message_name
  if (methodName characterAt(0) isUpperCase,
    searchPaths foreach(i, searchPath,
      fileName := searchPath appendPath(methodName .. ".io")
      sourceFile := File clone setPath(fileName)
      if (sourceFile exists) then (
        Lobby doFile(path)
        return Lobby getSlot(methodName)
      )
    )
  )
  raiseException("Importer", "Could not find slot for " .. methodName)
)