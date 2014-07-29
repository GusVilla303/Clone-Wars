class Login
  def self.set_info(info)
      @user = info[:username]
      @password = info[:password]
  end

  def self.verify
    @user == 'admin' && @password == 'admin'
  end

  def self.reset
    @user == '' && @password == ''
  end
end
