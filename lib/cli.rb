##
# Logline commandtool
class LogvisualCli
  def initialize
    @file = File.expand_path('~/.logvisual')
  end

  ##
  # Login
  #
  def signin
    session(:signin)
  end

  ##
  # Signup
  #
  def signup
    session(:signup)
  end

  ##
  # Create
  def create(task)
    abort 'Please login, first' unless validate_session
    task = Logvisual::Task.create(task, get_token)
    print 'Task created: '
    puts task['task']['content']
  end

  def list
    abort 'Please login, first' unless validate_session
    Logvisual::Task.list(get_token).each do |task|
      puts task['task']['content']
    end
  end

  def show_help
    puts 'Logvisual version ' +  Logvisual::VERSION

    puts ''
    puts '-- Auth'
    puts '----- auth:signup Create account'
    puts '----- auth:signin Login account'
    puts ''
    puts '-- Task'
    puts '----- task:list List tasks'
    puts '----- task:create Create task'
    puts ''
    puts 'ola k ace '
  end

  private

  def validate_session
     File.exist?(@file)
  end

  def get_token
    File.read(@file)
  end

  def save_token(token) 
    File.write(@file, token)
  end

  def session(type)
    abort 'You are already connected!' if validate_session

    print 'Insert your email: '
    email = STDIN.gets.chomp

    print 'Inser your password: '
    password = STDIN.gets.chomp

    result =  case type
              when :signup then Logvisual::Auth.signup(email, password)
              when :signin then Logvisual::Auth.signin(email, password)
              else Logvisual::Auth.signup(email, password)
              end
    if result.include?('user')
      save_token(result['user']['token'])
      puts 'Welcome! ' + result['user']['email']
    else
      puts 'Error with your data try again.'
    end
  end
end