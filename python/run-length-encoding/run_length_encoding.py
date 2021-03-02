from itertools import groupby


def decode(string):
    digits = ""
    acc = ""
    for c in string:
        if not c.isdigit():
            count = int(digits or 1)
            digits = ""
            acc += (c * count)
        else:
            digits += c
    return acc


def encode(string):
    def encode_group(k, g):
        count = len(list(g))
        if count == 1:
            return k
        return f"{count}{k}"

    return "".join([encode_group(k, g) for k, g in groupby(string)])
