module Ruakura
  module Tapbadge
    class Generator
      def initialize(options)
        @options = options
      end
    
      def pdf
        @doc = Prawn::Document.new(margin: 0, page_size: page_size)

        setup_fonts!
      
        2.times do |template_count|         
          @doc.translate(0, top_of_current_badge(template_count)) do
            @doc.template
          end
          
          @doc.move_cursor_to 46.mm + top_of_current_badge(template_count)
          
          
          # Beer name
          @doc.fill_color "000000"
          @doc.text_box @options[:name].strip, 
            :at => [ 3.mm, @doc.cursor ], 
            :width => TemplateRadius - 6.mm, :height => FontSizes[:name], 
            :valign => :bottom, :align => :center,
            :size => FontSizes[:name], :overflow => :shrink_to_fit,
            :min_font_size => FontSizes[:style]
            
          @doc.move_down FontSizes[:name] + 2
          
          # Style name - ABV
          @doc.fill_color "009344"
          @doc.text_box "#{@options[:style]} – #{@options[:abv]}% ABV", 
            :at => [ 3.mm, @doc.cursor ], 
            :width => TemplateRadius - 6.mm, :height => 12.mm, 
            :valign => :top, :align => :center,
            :size => FontSizes[:style]


          @doc.move_down 15.mm
            
          # Prices
          @doc.fill_color "000000"

          price = ActiveSupport::NumberHelper.number_to_currency(@options[:half])          
          @doc.text_box price, :at => [ 16.7.mm, @doc.cursor ], 
            :width => TemplateRadius, :height => 12.mm, 
            :valign => :top, :align => :left,
            :size => FontSizes[:prices]
          
          price = ActiveSupport::NumberHelper.number_to_currency(@options[:full])
          @doc.text_box price, :at => [ 44.7.mm, @doc.cursor ], 
            :width => TemplateRadius, :height => 12.mm, 
            :valign => :top, :align => :left,
            :size => FontSizes[:prices]

        end
        
        @doc.render
      end
  
    private
  
      def setup_fonts!
        raise "Please set Ruakura::Tapbadge.font_file= !" if Ruakura::Tapbadge.font_file.nil?
      
        @doc.font_families.update("Badge Font" => {
            :normal => Ruakura::Tapbadge.font_file
        })
        
        @doc.font "Badge Font"
      end
      
      def page_size
        r = TemplateRadius
      
        # 2 Labels on a page, so double the height      
        [ r, (BadgeCount - 1) * (r + Gutter) + r ]
      end
      
      def top_of_current_badge(count)
        count * (TemplateRadius + Gutter)
      end
        
      
    end
  end
end