function zf = zufallszahl(untere_grenze,obere_grenze)

zf = fix (rand*(obere_grenze - untere_grenze + 1) + untere_grenze);