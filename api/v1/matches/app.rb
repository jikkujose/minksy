require 'json'

module Minksy
  MAXIMUM_NUMBER_OF_IMAGES = 9
  PROBABILITY_RANGE = 0..9
  RESOLUTION = 621
  TOTAL_NUMBER_OF_IMAGES = 13
  URL_PREFIX = 'http://qucentis.com/labs/linksy/images/'

  class Matches
    def initialize(maximum_number_of_images = MAXIMUM_NUMBER_OF_IMAGES, number = nil)
      @number = number
      @maximum_number_of_images = maximum_number_of_images
    end

    def to_hash
      {
        :error => nil,
        :data => data
      }
    end

    def to_json
      to_hash.to_json
    end

    private

    def data
      indicies.map do |index|
        {:id => index, :photo => url(index)}
      end
    end

    def indicies
      if @number.nil?
        random_samples
      else
        sample_by(@number)
      end
    end

    def sample_by(number)
      (1..TOTAL_NUMBER_OF_IMAGES).to_a.shuffle.first(number)
    end

    def random_samples
      (1..TOTAL_NUMBER_OF_IMAGES).to_a.shuffle.first(rand(MAXIMUM_NUMBER_OF_IMAGES))
    end

    def url(index)
      "#{URL_PREFIX}#{resolution}/#{index.to_s.rjust(2, '0')}.jpg"
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
        puts Matches.new(MAXIMUM_NUMBER_OF_IMAGES, ARGV.first.to_i).to_json
      end
    end

    def self.run
      new
    end
  end
end

Minksy::CLI.run
