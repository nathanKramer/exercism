import sequtils, strutils

func isPangram*(phrase: string): bool =
  {'a'..'z'}.allIt it.in(phrase.toLower)
