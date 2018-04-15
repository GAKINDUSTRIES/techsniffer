# encoding: utf-8

class AvatarUploader < BaseUploader
  # Resize the image to fit within the specified dimensions while retaining the aspect ratio
  # of the original image. If necessary, crop the image in the larger dimension.
  version :normal do
    process resize_to_fill: [500, 500]
  end

  # Resize the image to fit within the specified dimensions while retaining the aspect ratio
  # of the original image. If necessary, crop the image in the larger dimension.
  version :small_thumb do
    process resize_to_fill: [200, 200]
  end
end
