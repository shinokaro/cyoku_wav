require 'test_helper'

class CyokuWavTest < Minitest::Test
  #          id, size, data
  @@s = ["RIFF",   40, "WAVE",
         "fmt ",   16, 1, 2, 48000, 192000, 4, 16,
         "data",    4, 0x00ff, 0xff00
  ].pack("a4Va4a4VvvVVvva4Vv*")

  def test_that_it_has_a_version_number
    refute_nil ::CyokuWav::VERSION
  end

  def test_size
    assert_equal 4, CyokuWav.new(@@s).size
  end

  def test_data
    assert_equal [0x00ff, 0xff00].pack("v*"), CyokuWav.new(@@s).data
  end

  def test_size_eq_data_size
    trg = CyokuWav.new(@@s)
    assert_equal trg.size, trg.data.size
  end

  def test_respond_to_to_s
    assert_respond_to(CyokuWav.new(@@s), :to_s)
  end

  def test_data_eq_to_s
    trg = CyokuWav.new(@@s)
    assert_equal trg.data, trg.to_s
  end

  def test_audio_aprameters_accessor
    assert_equal 2,     CyokuWav.new(@@s).channels
    assert_equal 48000, CyokuWav.new(@@s).samples_per_sec
    assert_equal 16,    CyokuWav.new(@@s).bits_per_sample
  end
end
