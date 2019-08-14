# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + '/../'))

Dir.glob(File.expand_path('vendor/bundle/ruby/*/gems/*/lib')).each do |path|
  $LOAD_PATH << path unless $LOAD_PATH.include?(path)
end

require 'tanraku'
require 'zip'
require 'kconv'

# ↓開発中はコメントアウト↓
# require 'lib/usui/version'

class Ame
  def rain
    puts '雨水は8月に開発を開始しました...'
  end
end

# puts Ame.new.rain

module Usui_app
  module_function

  def usio
    MyError.new.volt
  end

  def version
    # puts Usui::VERSION
    puts 'This version is prototype.'
  end

  def soft
    puts 'Usui is in Copyright Takayuki Kamiyama,I made in 2016.'
  end

  def compress
    folder = (ARGV[1]).to_s

    input_filenames = [(ARGV[3]).to_s.toutf8, (ARGV[4]).to_s.toutf8, (ARGV[5]).to_s.toutf8, (ARGV[6]).to_s.toutf8, (ARGV[7]).to_s.toutf8, (ARGV[8]).to_s.toutf8, (ARGV[9]).to_s.toutf8, (ARGV[10]).to_s.toutf8, (ARGV[11]).to_s.toutf8, (ARGV[12]).to_s.toutf8, (ARGV[13]).to_s.toutf8, (ARGV[14]).to_s.toutf8, (ARGV[15]).to_s.toutf8, (ARGV[16]).to_s.toutf8, (ARGV[17]).to_s.toutf8, (ARGV[18]).to_s.toutf8, (ARGV[19]).to_s.toutf8, (ARGV[20]).to_s.toutf8, (ARGV[21]).to_s.toutf8]

    zipfile_name = (ARGV[2]).to_s

    Zip::File.open(zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.compact.reject(&:empty?).each do |filename|
        zipfile.add(filename, folder + '/' + filename)
      end
    end
  end

  def decompress
    Zip::File.open((ARGV[1]).to_s.toutf8) do |zip_file|
      zip_file.each do |entry|
        # 解凍するファイル名を指定する
        puts "Extracting #{entry.name}"
        # すべての解凍ファイルを取り出す
        entry.extract { true }
      end
    end
  end

  def helper
    puts "
    [how to use usui.jar]

    >cd usui.jar directory

    java -jar usui.jar [word1] [word2] [word3] [word4]...[word18]

    word1        zip
    word2                 compress folder PATH.
    word3                 directory PATH + file name.
    word4 ~ word18        compress 18 file add possible.

    word1        unzip
    word2        decompress name.

    word1        -v       version              Version Infomation.
    word1        -h       help                 Help Infomation.

    "
  end
end

v = /\Aversion\z/
ve = /\A[-][v]\z/
c = /\Azip\z/
r = /\Aunzip/
h = /\Ahelp\z/
hk = /\A[-][h]\z/

one = ARGV[0]

if one.nil?
  Usui_app.soft
elsif one.match?(v)
  Usui_app.version
elsif one.match?(ve)
  Usui_app.version
elsif one.match?(c)
  Usui_app.compress
elsif one.match?(r)
  Usui_app.decompress
elsif one.match?(h)
  Usui_app.helper
elsif one.match?(hk)
  Usui_app.helper

else
  puts 'Please choose an option.'
end

# Usui_app.usio

__END__
