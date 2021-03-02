import sets, unicode, sequtils, sugar

proc isIsogram*(str: string): bool =
  var seen: HashSet[Rune] = initHashSet[Rune]()
  for c in toLower(str).toRunes.filter(c => c.isAlpha):
    if seen.containsOrIncl(c):
      return false
  return true
