require 'json'

module Minksy
  MAXIMUM_NUMBER_OF_IMAGES = 9
  PROBABILITY_RANGE = 0..9
  RESOLUTION = 621
  TOTAL_NUMBER_OF_IMAGES = 13
  URL_PREFIX = 'http://qucentis.net/labs/linksy/images/'

  class FakeData
    def self.first_name
      %w[
      Kiran
      Arun
      Nikhil
      Jendrick
      Nathan
      Vimal
      Sam
      Nick
      Joel
      Shyam
      Anil
      Tom
      Harry
      Tim
      Ryan
      ].shuffle[0]
    end

    def self.last_name
      %w[
      Verma
      George
      Tendulkar
      Singhaiya
      Chatterji
      Malhotra
      Banerji
      Srivastava
      John
      ].shuffle[0]
    end

    def self.designation
      [
        'Senior Marketing Head',
        'Vice President',
        'Technical Team Lead',
        'Program Manager',
        'PR Manager',
        'Coordinating Officier',
        'General Manager',
        'Sales Person',
        'Tech Evangelist',
        'Intern',
        'System Architect'
      ].shuffle[0]
    end

    def self.company
      [
        'Google',
        'Facebook',
        'Amazon',
        'Hooli',
        'DRDO',
        'ISRO',
        'Flipkart',
        'TVS',
        'General Motors',
        'Maruti',
        'Wipro',
        'Infosys',
        'Tech Mahindra',
        'VSSC',
        'JBL',
        'MSNBC',
        'TV18',
        'BBS',
        'UNESCO',
        'British High Commission',
        'Pied Piper'
      ].shuffle[0]
    end

    def self.age
      rand(15) + 20
    end
  end

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
        {
          :id => index,
          :photo => url(index),
          :designation => FakeData.designation,
          :company => FakeData.company,
          :age => FakeData.age,
          :first_name => FakeData.first_name,
          :last_name => FakeData.last_name
        }
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
