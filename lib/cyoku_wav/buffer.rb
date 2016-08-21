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
      id, _, format = read(12).unpack("a4Va4")
      raise "Chunk id: #{id}"     if id != "RIFF"
      raise "Chunk format: #{id}" if format != "WAVE"
      #
      # Parse fmt sub chunk
      #
      id, size = read(8).unpack("a4V")
      raise "Sub chunk id: #{id}"     if id != "fmt "
      raise "Sub chunk size: #{size}" if size != 16
      audio_format = read(2).unpack("v").first
      raise "Fmt chunk atudio format: #{audio_format}" if audio_format != 1
      @channels, @samples_per_sec, _, _, @bits_per_sample = read(14).unpack("vVVvv")
      #
      # Parse data sub chunk
      #
      id, size = read(8).unpack("a4V")
      raise "Sub chunk id: #{id}" if id != "data"
      @size = size
      @data = read(size)

    end

    attr_reader :bits_per_sample, :channels, :data, :samples_per_sec, :size

    alias to_s data

    private

    def read(n)
      @io.read(n)
    end
  end
end
