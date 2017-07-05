module WikisHelper
  def is_authorized
    current_user.role == "premium"
  end

  def markdown(text)
        extensions = [:tables, :bold, :fenced_code_blocks, :autolink, :strikethrough, :underline, :highlight, :quote, :superscript, :footnotes]
        Markdown.new(text, *extensions).to_html.html_safe
  end
end
