# Code to create hex sticker for package

# Load necessary libraries
library( here )
library( hexSticker )

# Create the hex sticker
sticker(
  subplot = "hex_sticker/SNACpack_illustration.png",
  package = "SNACpack",
  p_size = 20,
  p_color = "white",
  h_fill = "#2C3E50",
  h_color = "#E74C3C",
  s_x = 1,
  s_y = 0.8,
  s_width = 0.8,
  filename = "hex_sticker/SNACpack_sticker.png"
)
