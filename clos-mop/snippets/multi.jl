function sum(a, b)
    a + b
end

function sum(a::Number, b::String)
    string(a) * b
end

function generate()
    rand()
end

function sum(a::typeof(generate), b::Number)
    a() + b
end
