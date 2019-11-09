"""
A hint of dynaminism and mixins
"""

import json


class Animal:

    def __init__(self, name: str, legs: int):
        self.name = name
        self.legs = legs

    def speak(self):
        print(f"I am {self.name} and I have {self.legs} leg(s)")


class SerializerMixin:
    def dumps(self) -> str:
        return json.dumps(self.data)

    def loads(self, string):
        d = json.loads(string)
        self.data = string


class SerializedAnimal(SerializerMixin, Animal):

    @property
    def data(self):
        return {"name": self.name, "legs": self.legs}

    @data.setter
    def data(self, value):
        self.name = value["name"]
        self.legs = value["legs"]


def make_closed_animal(name: str, legs: int):
    a = 1
    class _A:
        def __init__(self, name):
            self.name = name

        def speak(self):
            print(f"I am {self.name} and I have {legs} leg(s)")
            nonlocal a
            a += 1
            print("value of a", a)

    return _A(name)


if __name__  == "__main__":
    a = Animal("abhinav", 3)
    a.speak()

    a = SerializedAnimal("abhinav", 3)
    print(a.dumps())

    ca = make_closed_animal("abhinav", 3)
    ca.speak()
    ca.speak()
    ca.speak()
    ca.speak()
    print(ca.legs)
