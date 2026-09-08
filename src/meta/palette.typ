#let light = (
  red: rgb("fb4934"),
  green: rgb("b8bb26"),
  yellow: rgb("fabd2f"),
  blue: rgb("83a598"),
  purple: rgb("d3869b"),
  aqua: rgb("8ec07c"),
  orange: rgb("fe8019"),
  white: rgb("f9f5d7").lighten(60%),
  gray: rgb("d5c4a1"),
  black: rgb("504945"),
)

#let standard = (
  red: rgb("cc241d"),
  green: rgb("98971a"),
  yellow: rgb("d79921"),
  blue: rgb("458588"),
  purple: rgb("b16286"),
  aqua: rgb("689d6a"),
  orange: rgb("d65d0e"),
  white: rgb("f9f5d7"),
  gray: rgb("928374"),
  black: rgb("3c3836"),
)

#let dark = (
  red: rgb("9d0006"),
  green: rgb("79740e"),
  yellow: rgb("b57614"),
  blue: rgb("076678"),
  purple: rgb("8f3f71"),
  aqua: rgb("427b58"),
  orange: rgb("af3a03"),
  white: rgb("fbf1c7"),
  gray: rgb("665c54"),
  black: rgb("1d2021"),
)

#let symbol-colors = (
  ..light.pairs().filter(((k,_),) => k not in ("white", "gray", "black")).map(((_,v),) => v),
  ..standard.pairs().filter(((k,_),) => k not in ("white", "gray", "black")).map(((_,v),) => v),
  //..dark.pairs().filter(((k,_),) => k not in ("white", "gray", "black")).map(((_,v),) => v),
  standard.gray,
  //dark.gray,
)

#table(columns: standard.len(),
  ..(for c in light.values() + standard.values() + dark.values() {
    (rect(fill: c, width: 1cm, height: 1cm),)
  })
)

#let cc(s) = {
  let root = s.at(0)
  let extra = s.slice(1)
  let group = (
    "-": light,
    "": standard,
    "+": dark,
  ).at(extra)
  let index = (
    r: "red",
    g: "green",
    b: "blue",
    y: "yellow",
    p: "purple",
    q: "aqua",
    o: "orange",
    w: "white",
    k: "black",
    a: "gray",
  ).at(root)
  let color = group.at(index)
  color
}

#for root in ("r", "g", "y", "b", "p", "q", "o", "w", "a", "k") {
  for extra in ("-", "", "+") {
    box(rect(fill: cc(root+extra)))
  }
}