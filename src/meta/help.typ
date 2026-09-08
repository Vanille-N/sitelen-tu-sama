#let pad3dig(i) = {
  let t = str(i + 1)
  let t = "0" * (3 - t.len()) + t
  t
}