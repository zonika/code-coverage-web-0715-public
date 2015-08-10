# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]
songs_formatted = "1 The Phoenix - 1901
2 Tokyo Police Club - Wait Up
3 Sufjan Stevens - Too Much
4 The Naked and the Famous - Young Blood
5 (Far From) Home - Tiga
6 The Cults - Abducted
7 The Phoenix - Consolation Prizes
"
describe Song do
  let(:song) { Song.new("Blank Space") }

  it "can initialize a song with a name" do
    expect(song.name).to eq("Blank Space")
  end
end

describe Jukebox do
  let(:jukebox) {Jukebox.new(songs)}

  it "can be initialized with a list of songs" do
    expect(jukebox.songs).to eq(songs)
  end

  it "can tell us if it's on" do
    expect(jukebox.on?).to eq(true)
  end

  it "can output list of commands using 'help'" do
    expect(jukebox.help).to eq("Please select help, list, exit, or play.")
  end

  it "can play using command()" do
    expect(jukebox.command('play The Phoenix - 1901')).to eq("now playing The Phoenix - 1901")
  end

  it "can get help using command()" do
    expect(jukebox.command('help')).to eq("Please select help, list, exit, or play.")
  end

  it "can return an error if command does not exist" do
    expect(jukebox.command('hi')).to eq("invalid command")
  end

  it "can exit" do
    expect(jukebox.exit).to eq("Goodbye, thanks for listening!")
  end

  it "can output a list of songs" do
    expect(jukebox.list).to eq(songs_formatted)
  end

  it "can play using play()" do
    expect(jukebox.play('The Phoenix - 1901')).to eq("now playing The Phoenix - 1901")
  end

end
