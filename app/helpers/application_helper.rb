module ApplicationHelper
  def class_for_flash_type(flash_type)
    case flash_type.to_sym
    when :success
      "bg-green-100 text-green-800 border-green-500"
    when :error
      "bg-red-100 text-red-800 border-red-500"
    when :alert
      "bg-yellow-100 text-yellow-800 border-yellow-500"
    when :notice
      "bg-blue-100 text-blue-800 border-blue-500"
    else
      flash_type.to_s
    end
  end
end
