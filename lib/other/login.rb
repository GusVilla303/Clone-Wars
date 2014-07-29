class Login
  def self.set_info(info)
    @@user = info['user']
    @@password = info['password']
    require 'pry'
    binding.pry
  end

  def self.verify?
    @@user == 'admin' && @password == 'admin'
  end

  def self.reset
    (@@user == '') && (@@password == '')
  end
end
