# Tailf2Kafka

Watch and tail files in dirs with specified filename time based patterns and push them to kafka.


## Installation

Add this line to your application's Gemfile:

    gem 'tailf2kafka'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tailf2kafka

## Usage

    $ tailf2kafka -h
    Usage: /ssa/system/scripts/tailf2kafka-zopa.rb [options]
            --config PATH                Path to settings config
        -h, --help                       Display this screen
    $

## Config

   tailf:
      files:
        - topic: haproxy
          prefix: /var/log/haproxy/haproxy
          time_pattern: ".%Y-%m-%d.%H"
      position_file: "/var/lib/haproxy/tail2kafka.offsets"
      flush_interval: 1
      max_batch_lines: 1024
      from_begining: true
      delete_old_tailed_files: true
   kafka:
      brokers: ["broker1:9092", "broker2:9092", "broker3:9092"]
      producer_type: sync

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Go to 1
