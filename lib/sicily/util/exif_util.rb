require "exifr/jpeg"

module Sicily
  module Util
    class ExifUtil
      def self.extract_time_from_jpeg(path)
        EXIFR::JPEG.new(path).date_time
      end
    end
  end
end