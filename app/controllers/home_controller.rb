class HomeController < ApplicationController
  def index
    
    name_found = false
    until name_found
      name = List::NAMES.rand.downcase + "-#{rand(8999)+1000}"
      name_found = true unless List.exists?(:name => name)
    end
    @list = List.new(:name => name)
  end

  def check_mail
    List.check_email rescue nil
    render :text => "success"
  end
end
