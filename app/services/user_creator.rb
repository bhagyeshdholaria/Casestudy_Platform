class UserCreator
  def initialize(params)
    @params = params
  end

  def create_user

    return { errors: 'invalid passkey' } unless verify_passkey

    @user = User.find_or_create_by(email: @params[:email]) do |u|
      u.name = @params[:name]
      u.password = "#{@params[:name]}@21"
    end
    if @user.save
      puts 'USER CREATED'
      @casestudy_user = CasestudyUser.find_or_create_by(user_id: @user.id, casestudy_id: @params[:casestudy_id]) do |u|
        u.assessor_id = @params[:assessor_id]
      end

      return { errors: 'test already submitted' } if @casestudy_user.status == 'completed'
    end

    puts 'casestudy_user:'
    puts @casestudy_user.errors.inspect

    [@user, @casestudy_user]
  end

  def verify_passkey
    @casestudy = Casestudy.find(@params[:casestudy_id])
    @casestudy.passkey == @params[:passkey]
  end

end
