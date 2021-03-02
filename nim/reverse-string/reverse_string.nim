proc reverse*(s: string): string =
  if s == "":
    return s

  var aux = s
  for i in 0 .. high(s) div 2:
    swap(aux[i], aux[high(aux) - i])
  aux
