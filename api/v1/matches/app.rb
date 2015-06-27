require 'json'

module Minksy
  PROBABILITY_RANGE = 0..9
  RESOLUTION = 621
  TOTAL_NUMBER_OF_IMAGES = 13
  URL_PREFIX = 'http://qucentis.com/labs/linksy/images/'

  class Matches
    def initialize(probability_range: PROBABILITY_RANGE, number: nil)
      @number = number
      @probability_range = probability_range
    end

    def to_hash
      indicies.map do |index|
        {id: index, photo: url(index)}
      end
    end

    def to_json
      to_hash.to_json
    end

    private

    def indicies
      if @number.nil?
        random_samples
      else
        sample_by(@number)
      end
    end

    def sample_by(number)
      (1..TOTAL_NUMBER_OF_IMAGES).to_a.sample(number)
    end

    def random_samples
      (1..TOTAL_NUMBER_OF_IMAGES).to_a.sample(rand(PROBABILITY_RANGE))
    end

    def url(index)
      "#{URL_PREFIX}#{resolution}/#{index}.jpg"
    end

    def resolution
      "#{RESOLUTION}x#{RESOLUTION}"
    end
  end

  class CLI
    def initialize
      if ARGV.empty?
        puts Matches.new.to_json
      else
        puts Matches.new(number: ARGV.first.to_i).to_json
      end
    end

    def self.run
      new
    end
  end
end

Minksy::CLI.run
