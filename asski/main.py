import os
from PIL import Image

def to_ascii_file(png_path, txt_path, width=30):
    chars = "@%#*+=-:. "
    img = Image.open(png_path).convert('L')
    aspect_ratio = img.height / img.width
    new_height = int(aspect_ratio * width * 0.5)
    img = img.resize((width, new_height))

    with open(txt_path, 'w') as f:
        for y in range(img.height):
            for x in range(img.width):
                pixel = img.getpixel((x, y))
                f.write(chars[pixel * len(chars) // 256])
            f.write("\n")

# Directory setup (assuming you have a "frames/" folder with PNGs)
png_frames = sorted([f for f in os.listdir("frames") if f.endswith(".png")])
os.makedirs("ascii_frames", exist_ok=True)

for png_name in png_frames:
    txt_name = png_name.rsplit(".", 1)[0] + ".txt"
    to_ascii_file(
        png_path=f"frames/{png_name}",
        txt_path=f"ascii_frames/{txt_name}",
        width=30
    )
