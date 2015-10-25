shape = cone(25, 1, 5)

-- Viewing:
--emit(shape)

-- Machining:
block_height = 5
emit(
   difference(
      cube(50, 50, block_height),
      translate(0, 0, block_height) * mirror(v(0, 0, 1)) * shape
))
