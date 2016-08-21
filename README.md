# CyokuWav

Read the IO stream or String object of WAV format

WAV (PCM only) to get the audio data of a string object.
There are accessor to the audio format.
Read only supports.

Supported format: Only Riff format is WAVE, Audio format is PCM.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cyoku_wav'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cyoku_wav

## Usage

`CyokuWav.new(*IO or String instance*)` create CyokuWav::Buffer instance.

CyokuWav::Buffer Instance methods

`bits_per_sample`, `channels`, `samples_per_sec` Audio format accessor 

`size` Audio data size (bytes)

`data`, `to_s` Audio data (binary)
