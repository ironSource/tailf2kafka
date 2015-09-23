# Tailf2Kafka

Watch and tail files in dirs with specified filename time based patterns and push them to kafka.


## Installation

Install libsnappy dev libs if you want to take advantage of compression

    apt-get install libsnappy-dev

Add this line to your application's Gemfile:

    gem 'tailf2kafka'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tailf2kafka

## Usage

    $ tailf2kafka -h
    Usage: tailf2kafka [options]
            --config PATH                Path to settings config
        -h, --help                       Display this screen
    $

## Config

    tailf:
      files:
        - topic: haproxy
          prefix: /var/log/haproxy/haproxy
          suffix: ''
          time_pattern: ".%Y-%m-%d.%H"
      position_file: "/var/lib/haproxy/tail2kafka.offsets"
      flush_interval: 1
      max_batch_lines: 1024
      from_begining: true
      delete_old_tailed_files: true
    kafka:
      brokers: ["broker1:9092", "broker2:9092", "broker3:9092"]
      producer_type: sync
      produce: true

* kafka.brokers - Array of kafka brokers to connect to
* kafka.producer_type - type of producer sync or async
* kafka.produce - if false will not conect to kafka and will not produce any messages to it
* tailf.position_file - file where to save tailed files offsets which were pushed to kafka
* tailf.flush_interval - how often in seconds to save the offsets to a file
* tailf.max_batch_lines - max number of lines to batch in each send request
* tailf.from_beggining - in case of a new file added to tailing , if to start tailing from beggining or end of the file
* tailf.delete_old_tailed_files - if to delete files once their time_pattern does not match and if they have been fully produced to kafka
* tailf.files - array of file configs for tail, each tailed file configs consists of:
  * topic - which kafka topic to produce the messages to
  * prefix - the files prefix to watch for
  * time_pattern - ruby time pattern of files to tail
  * suffix - optional suffix of files to watch for
so the tool will watch for files that match - prefix + time_pattern + suffix

## Features

* The config is validated by [schash](https://github.com/ryotarai/schash) gem
* Tailed files are watched for changes by [rb-notify](https://github.com/nex3/rb-inotify) gem
* Dirnames of all files prefixes are watched for new files creation or files moved to the dir and are automaticaly
added to failing.
* As well dirnames are watched for deletion or files being moved out of directory, and they are removed from the  list of files watched for changing.
* Based time_pattern, files are periodicaly autodeleted , thus avoiding need for log rotation tools.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Go to 1
