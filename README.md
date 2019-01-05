# Tweety Bot

- Created By Richard L. Jackson

Basic useful feature list:

* Search Twitter for words and current events.
* ~~Insert automatic feeds.~~ (Disabled)

Purpose:

 * Install scripts
 * Check installation
 * Repair installation

```
Tweety Bot Installation Script
Install Packages       	[ -i, -install, --install ] [OPERATING_SYSTEM]
Check Installation     	[ -c, -check, --check ]
USAGE:
       	./install.sh [ COMMAND ] [[ ARGS ]]
EXAMPLE:
$./install.sh --install [ linux|mac ]
$./install.sh --check
```

And here's some code! :)

```ruby
require 'twitter'

client = Twitter::REST::Client.new do |config|
       	config.consumer_key = ""
       	config.consumer_secret = ""
       	config.access_token = ""
       	config.access_token_secret = ""
end
```



### Project References:

 * [ruby-lang](https://www.ruby-lang.org/en/) Ruby Programming Language

 * [Research](https://garagebarge.com/dbresults.php?q=ruby) Language References
