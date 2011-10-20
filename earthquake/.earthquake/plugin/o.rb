Earthquake.init do
  command :o do |m|
    begin
      tweet = twitter.status(m[1])
      browse "https://twitter.com/#{tweet['user']['screen_name']}/status/#{m[1]}"
    rescue
      puts 'invalid input'
    end
  end
end
# git://gist.github.com/1097438.git