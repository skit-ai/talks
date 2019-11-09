-- Tables and prototypes

DataTable = {
  lol = "kek"
}

MetaTable = {
  __index = DataTable,
  __tostring = function ()
    return "no strings for you"
  end
}

function make_animal(name, legs)
  local an = {
    name = name, legs = legs
  }
  return an
end


a = make_animal("abhinav", 3)
print(a.lol)

setmetatable(a, MetaTable)
print(a.lol)
print(a)
