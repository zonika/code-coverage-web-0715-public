# A Jukebox filled with songs
# that responds to help, list, play, and exit
require_relative 'song'

class Jukebox
  attr_accessor :songs
  APPROVED_COMMANDS = [:list, :help, :exit]

  def initialize(songs)
    @songs = songs
    @on = true
  end

  def on?
    @on
  end

  def help
    "Please select help, list, exit, or play."
  end

  def command(input)
    response = ''

    if APPROVED_COMMANDS.include?(input.strip.downcase.to_sym)
      response = self.send(input)
    elsif input.start_with?("play")
      song_request = input.split("play").last.strip
      response = self.play(song_request)
    else
      response = "invalid command"
    end
    response
  end

  def exit
    @on = false
    "Goodbye, thanks for listening!"
  end

  def list
    list = ""
    songs.each_with_index do |song, i|
      list += "#{i+1} #{song}\n"
    end
    list
  end

  def play(song_request)
    "now playing #{song_request}"
  end

end
# songs = [
#   "The Phoenix - 1901",
#   "Tokyo Police Club - Wait Up",
#   "Sufjan Stevens - Too Much",
#   "The Naked and the Famous - Young Blood",
#   "(Far From) Home - Tiga",
#   "The Cults - Abducted",
#   "The Phoenix - Consolation Prizes"
# ]
# jb=Jukebox.new(songs)
# puts jb.list
