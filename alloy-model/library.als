sig Book {}
sig User {}

one sig Library {
  issued: Book -> lone User,
  available: set Book
}

pred ValidState {
  all b: Book |
    (b in Library.available) implies (no Library.issued[b])
}

pred InvalidState {
  some b: Book |
    (b in Library.available) and (some Library.issued[b])
}

run ValidState for 5
run InvalidState for 5
