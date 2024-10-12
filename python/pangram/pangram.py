import string

def is_pangram(sentence: str):
    return set(sentence.lower()) >= set(string.ascii_lowercase)
