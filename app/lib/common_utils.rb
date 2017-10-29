module CommonUtils


  def valid_email(email)
    puts 'validating email '  + email
    return email.match(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)
  end

end