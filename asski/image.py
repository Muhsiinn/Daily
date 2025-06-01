from PIL import Image 
import time 
import os

def to_img(vid_path,width=60):
    chars = "@%#*+=-:. "
    img = Image.open(vid_path)
    img = img.convert('L')
    aspect_raio = img.height / img.width
    new_height = int(aspect_raio*width * 0.5)
    img = img.resize((width,new_height))

    ascii_str = ""

    for y in range(img.height):
        for x in range(img.width):
            pixel = img.getpixel((x,y))
            ascii_str += chars[pixel * len(chars)//256]
        ascii_str += "\n"
    return ascii_str

frames = sorted([f"frames/{f}" for f in os.listdir("frames") if f.endswith(".png")])

for frame in frames :
    os.system("clear")
    print(to_img(frame))
    time.sleep(0.1)




