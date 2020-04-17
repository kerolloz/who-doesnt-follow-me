require 'github_api'

if ARGV.length != 1
  puts "You should provide one argument - the GitHub username"
  exit 1
end

github = Github.new auto_pagination: true

username = ARGV[0]
followers = github.users.followers.all(username).map { |user| user.login }
following = github.users.followers.following(username).map { |user| user.login }

not_following_me = following - followers

puts "You follow, but they don't follow back: #{not_following_me.length}"
pp not_following_me
puts "-" * 20
puts "Followers: #{followers.length}"
puts "Following: #{following.length}"
