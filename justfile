_typstc cmd file dest fmt="pdf":
  typst {{cmd}} --root=src --font-path=fonts src/{{file}}.typ out/{{dest}}.{{fmt}}

# View the list of included symbols
nimi: (_typstc "w" "meta/nimi" "nimi")

recto: (_typstc "w" "square/recto" "recto")

verso: (_typstc "w" "square/verso" "verso")

print: (_typstc "c" "square/printable" "PRINT_sitelen-tu-sama")

book: (_typstc "w" "square/rulebook" "rulebook")

box: (_typstc "w" "square/boxing" "boxing")
