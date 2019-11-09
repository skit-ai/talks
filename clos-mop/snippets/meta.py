from abc import ABCMeta


class M(ABCMeta):

    def __new__(meta_cls, *args, **kwargs):
        cls = super().__new__(meta_cls, *args, **kwargs)
        print(f"Created {cls}")
        return cls


class Stuff(metaclass=M):
    def __init__(self):
        print("okay")

a = [Stuff() for _ in range(5)]
