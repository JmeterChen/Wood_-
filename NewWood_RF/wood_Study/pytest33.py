# 模糊图片

from PIL import Image, ImageFilter

image = Image.open("C:\codemao_py\pillow_image\mao.png")
blur_image = image.filter(ImageFilter.BLUR)
blur_image.save("C:\codemao_py\pillow_image\image.png", "png")