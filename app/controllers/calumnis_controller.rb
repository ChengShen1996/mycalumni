class CalumnisController < ApplicationController

#   before_action :get_game_from_session
#   after_action  :store_game_in_session
  
  private
  
#   def get_game_from_session
#     @game = HangpersonGame.new('')
#     if !session[:game].blank?
#       @game = YAML.load(session[:game])
#     end
#   end

#   def store_game_in_session
#     session[:game] = @game.to_yaml
#   end

  def people_params
    params.require(:people).permit(:username, :email, :description, :company, :start_date, :resume, :university, :major, :graduation, :help, :occupation,:avatar)
  end  

  public
  # def new
  # end
  def new
    @calumni=People.new()
  end
  
  def home
      
  end
  def signup
  end
  def createandlogin
    p "in createandlogin",params[:people],people_params,cookies[:email]
    params[:people][:email]=cookies[:email]
    people_params[:email]=cookies[:email]
    p people_params,"again"

    @calumni = People.create!(people_params)
    redirect_to profile_path
  end
  def login

  end
  def upload
    @people= People.select{|p| p.email==cookies[:email]}
  end
  def receiveimg
        @people= People.select{|p| p.email==cookies[:email]}
        @people.first.update_attributes(people_params)
        @people.first.save
        redirect_to profile_path
  end
  
  

  def profile

    # check username and password first 
    # p params

    # save 

    p cookies[:email]
    @people= People.select{|p| p.email==cookies[:email]}
    # p "in profile ",People.find_by(email: cookies[:email])

    # @pwcorrect=People.find_by(username: params[:people][:username], password: params[:people][:password])
  
    # p @pwcorrect
    # if @pwcorrect
    #   @people=1
    # else
    #   @pwcorrect="Wrong Username or Password"
    #   render :login
    # end
  end
  
  def create_mentor
    # byebug

    # check user exists or not
    @people=People.new()
    p @people
    ok= People.select{|p| p.email==cookies[:email]} 
    # return an array, if [] or has value
    if ok[0]!=nil
      redirect_to profile_path
    end
  end
  def create_mentee
  end
  
  # def create
  #   @movie = Movie.create!(movie_params)
  #   flash[:notice] = "#{@movie.title} was successfully created."
  #   redirect_to movies_path
  # end


#   def show
#     status = @game.check_win_or_lose
#     redirect_to win_game_path if status == :win
#     redirect_to lose_game_path if status == :lose
#   end

#   def guess
#     letter = params[:guess]
#     begin
#       if ! @game.guess(letter[0])
#         flash[:message] = "You have already used that letter." 
#       end
#     rescue ArgumentError
#       flash[:message] = "Invalid guess."
#     end
#     redirect_to game_path
#   end

#   def win
#     redirect_to game_path unless @game.check_win_or_lose == :win
#   end
  
#   def lose
#     redirect_to game_path unless @game.check_win_or_lose == :lose
#   end

end
