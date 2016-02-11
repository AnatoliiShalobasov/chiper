
require 'digest'

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts "Введите фразу которую хотите зашифорвать: "

phraze = STDIN.gets.encoding("UTF-8").to_s

puts "Каким способом зашифровать: напишите 1 - если  MD5 или 2 если SHA1 "

number = STDIN.gets.to_i

case number
  when 1
    puts Digest::MD5.hexdigest(phraze)
  when 2
    puts Digest::SHA1.hexdigest(phraze)
  else
    abort "Внимательно еще раз прочитайте условие и грамотно введите данные!"
end