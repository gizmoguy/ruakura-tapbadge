# Ruakura::Tapbadge

 A library to generate tap badges for the Ruakura Club bar

## Installation

Add this line to your application's Gemfile:

    gem 'ruakura-tapbadge'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruakura-tapbadge

## Usage

To generate a tapbadge, first set the font file to use and then call #badge_for to return the raw PDF data

```ruby
    Ruakura::Tapbadge.font_file = 'path/to/familiar_pro.ttf'
    Ruakura::Tapbadge.badge_for(name: "Shunters Yard - Midnight Special", style: "Rauchbier", abv: 5.5, full: 9.80, half: 5.70)
```

To write the PDF to a file, pass the file option to #badge_for. A value of true will return a Tempfile, or you can pass the path to where you want the file created:

```ruby
    Ruakura::Tapbadge.badge_for(name: "Shunters Yard - Midnight Special", style: "Rauchbier", abv: 5.5, full: 9.80, half: 5.70, file: true)
    Ruakura::Tapbadge.badge_for(name: "Shunters Yard - Midnight Special", style: "Rauchbier", abv: 5.5, full: 9.80, half: 5.70, file: '/path/to/the.pdf')
```

Enjoy!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
