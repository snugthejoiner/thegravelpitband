require 'redcarpet'

module ApplicationHelper

class HTMLWithoutBlockElements < Redcarpet::Render::HTML

  def initialize(opts = {})
    opts[:tables] = false
      super(opts)
  end

      # Regular markdown, just ignore all the block-level elements

      def block_code(code, language)
        code
      end

      def block_quote(quote)
        quote
      end

      def block_html(raw_html)
        raw_html
      end

      def header(text, header_level)
        "#{text} "
      end

      def hrule
        " "
      end

      def list(contents, list_type)
        " #{contents}"
      end

      def list_item(text, list_type)
        "* #{text}"
      end

      def paragraph(text)
        text
      end

      # Span-level calls

      def linebreak
        " "
      end

      # Postprocessing: strip the newlines

  def postprocess(document)
    document.gsub("\n", ' ').strip
  end

end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {autolink: true, highlight: true, disable_indented_code_blocks: true, space_after_headers: false, underline: true, quote: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def markdown_line(markdown)
    redcarpet = Redcarpet::Markdown.new(HTMLWithoutBlockElements, autolink: true, highlight: true, strikethrough: true, fenced_code_blocks: false, underline: true, space_after_headers: true)
    (redcarpet.render markdown).html_safe    
  end

  def ogtitle
    if controller.controller_name == 'shows' && controller.action_name == 'show'
      @show.datinator
    elsif controller.controller_name == 'songs' && controller.action_name == 'show'
      @song.title
    elsif controller.controller_name == 'releases' && controller.action_name == 'show'
      @release.title
    else
      'The Gravel Pit'
    end
  end

  def ogdescription
    if controller.controller_name == 'shows' && controller.action_name == 'show'
      @show.description_and_bill
    elsif controller.controller_name == 'songs' && controller.action_name == 'show'
      @song.song_rating
    elsif controller.controller_name == 'releases' && controller.action_name == 'show'
      @release.release_rating
    else
      'For the discerning fan of The Gravel Pit'
    end
  end

end
