require "cyoku_wav/version"
require "cyoku_wav/buffer"

module CyokuWav
  def self.new(*a)
    Buffer.new(*a)
  end
end
