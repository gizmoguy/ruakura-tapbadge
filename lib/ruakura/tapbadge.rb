require 'tempfile'

require 'prawn'
require 'prawn/measurement_extensions'

require 'active_support/core_ext/module/attribute_accessors.rb'
require 'active_support/number_helper.rb'


require "ruakura/tapbadge/version"
require "ruakura/tapbadge/template"
require "ruakura/tapbadge/generator"

module Ruakura
  module Tapbadge
    
    BadgeCount = 2
    TemplateRadius = 82.mm
    Gutter = 5.mm
    
    FontSizes = {
      :name   => 23,
      :style  => 11,
      :prices => 23
    }
    
    mattr_accessor :font_file
    
  
    # Your code goes here...
    def self.badge_for(options)
      file = options.delete(:file)
            
      pdf = Generator.new(options).pdf
      
      if file
          fh = file.kind_of?(String) ? File.open(file, 'w') : Tempfile.new("ruakura-badge")
          fh.write(pdf)
          fh.rewind
          fh
      else
        pdf
      end
    end
    
  end
end
