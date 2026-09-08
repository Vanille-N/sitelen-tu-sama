#let crossprod(arr1, ..other) = {
  if other.pos().len() == 0 {
    arr1.map(x => (x,))
  } else {
    let rest = crossprod(..other)
    for x1 in arr1 {
      for xn in rest {
        ( (x1,..xn,), )
      }
    }
  }
}

#crossprod(range(5), range(5), range(5))

#let apply-shuffle(arr, shuf) = {
  shuf.map(i => arr.at(i))
}