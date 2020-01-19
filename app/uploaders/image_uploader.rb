# frozen_string_literal: true

class ImageUploader < Shrine
  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)
                                        .saver(quality: 90)

    {
      small: magick.resize_to_limit!(300, 300),
      medium: magick.resize_to_limit!(500, 500),
      large: magick.resize_to_limit!(800, 800),
      xxl: magick.resize_to_limit!(1200, 1200),
    }
  end
end
