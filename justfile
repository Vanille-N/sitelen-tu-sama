_typstc cmd file dest *input:
  typst {{cmd}} --root=src --font-path=fonts src/{{file}}.typ out/{{dest}}.pdf {{input}}

# View the list of included symbols
nimi: (_typstc "w" "meta/nimi" "nimi")

recto: (_typstc "w" "square/recto" "recto")

verso: (_typstc "w" "square/verso" "verso")

print: (_typstc "c" "square/printable" "PRINT_sitelen-tu-sama")

book: (_typstc "w" "square/rulebook" "rulebook")

langs: (_typstc "w" "square/multilingual" "langs")

box: (_typstc "w" "square/boxing" "boxing")

classify: (_typstc "w" "meta/classification" "classify")

stickers: (_typstc "w" "meta/stickers" "stickers")
