require "cyoku_wav/version"

module CyokuWav
  class Buffer
    def initialize(obj)
      if obj.respond_to?(:read)
        @io = obj
      else
        @io = StringIO.new(obj, "rb")
      end
      #
      # Parse RIFF chunk
      #
      head, _, format = read(12).unpack("a4Va4")
      raise if head != "RIFF" || format != "WAVE"
      #
      # Parse fmt sub chunk
      #
      head, size = read(8).unpack("a4V")
      audio_format = read(2).unpack("v")
      raise if head != "fmt " || size != 16 || audio_format != 1
      @channels, @samples_per_sec, _, _, @bits_per_sample = read(14).unpack("vVVvv")
      #
      # Parse data sub chunk
      #
      head, size = read(8).unpack("a4V")
      raise if head != "data"
      @size = size
      @data = read(size)
    end

    attr_reader :bits_per_sample, :channels, :data, :samples_per_sec, :size

    alias to_s data

    private

    def read(n)
      @io.binread(n)
    end
  end
end
