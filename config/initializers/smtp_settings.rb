ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "gmail.com",
    :user_name => "dudisek@gmail.com",
    :password => ENV['THESECRETMAIL'],
    :authentication => "plain",
    :enable_starttls_auto => true
}