
# When a form is submitted with an error, this replaces the default behavior (adding a div with class="field_with_errors") with a similar change that does not add a div (this way the flex display isn't changed). From StackOverflow (https://stackoverflow.com/questions/7454682/customizing-field-with-errors).
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  parts = html_tag.split('>', 2)
  parts[0] += ' class="field_with_errors">'
  (parts[0] + parts[1]).html_safe
end
