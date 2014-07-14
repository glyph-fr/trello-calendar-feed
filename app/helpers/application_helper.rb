module ApplicationHelper
  # Lets you yield vars containing the result of the given expressions
  #
  # @example Bind and load user's specific data
  #   let current_user.email, current_user.role.name do |email, role|
  #     # Use the local vars here
  #   end
  #
  def let *args
    yield *args
  end

  # Get an ActiveRecord::Base instance and and produce a list of
  # all the error messages present in instance.errors.messages pepended
  # by the message passed as the second argument
  def error_messages_html instance, message = ""
    buffer = message
    buffer << '<ul>'
    buffer << instance.errors.messages.to_a.reduce("") do |buff, err|
      field = "#{t("activerecord.attributes.#{instance.class.to_s.underscore}.#{err.shift}")}"
      err.shift.each do |msg|
        buff << "<li>#{ the_item(field) } #{ msg }</li>"
      end
      buff
    end
    buffer << '</ul>'
    buffer.html_safe
  end


  def the_item str
    t((%w(a e i o u y).include?(str[0]) ? :the_short_item : :the_item), item: str)
  end

  # Appends the given params to the current url while keeping existing params
  #
  # @param [Hash] params The params hash we want to build into query string
  #
  # @return [String] The new query string
  #
  def current_page_plus_params params
    path = request.fullpath

    if path.match(/\?/)
      path, query = path.split(/\?/)
      existing = Hash[query.split('&').map { |a| a.split( /=/ ) }]
      params = existing.merge(params.stringify_keys)
    end

    [path, params].join("?")
  end

  # Converts flash types to :success or :error to conform to what
  # twitter bootstrap can handle
  #
  def homogenize_flash_type type
    case type.to_sym
    when :notice then :success
    when :alert then :warning
    when :error then :danger
    else type
    end
  end

  def icon_class_for type
    case type
    when :success then "fa-check"
    when :error then "fa-warning"
    else "fa-exclamation-triangle"
    end
  end

  def display_flash
    # Get devise errors if present
    if respond_to?(:devise_error_messages!)
      flash[:alert] = devise_error_messages! if defined?(resource) && devise_error_messages! != ""
    end

    # Render empty string if no flash
    return "" if flash.empty?

    # Make a div.alert for each message and join the whole
    messages = flash.map do |type, message|
      flash.delete(type)
      content_tag :div, class: "alert alert-#{ homogenize_flash_type(type) } alert-dismissable" do
        buffer  = content_tag(:button, type: "button", class: "close", "data-dismiss" => "alert") do
          content_tag(:span, '&times;'.html_safe)
        end
        buffer +=  content_tag(:i, "", class: "fa #{ icon_class_for(type) } pull-left")
        buffer += content_tag(:p, message.html_safe)
      end
    end

    # Join the messages and make sure markup is correctly displayed
    messages.join.html_safe
  end
end
