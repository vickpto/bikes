class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :username, :message => " no puede ser un campo vacio"
  validates_presence_of :userLastName, :message => " no puede ser un campo vacio"
  validates_presence_of :document , :message => " no puede ser un campo vacio"
  validates_uniqueness_of :document , :message => " ya ha sido registrado "
  validates_length_of :document, :within => 8..11 
  validates_presence_of :telephone, :message => " no puede estar vacio"
  validates_length_of :telephone, :within => 6..20
  
  def user_params
      params.require(:user).permit(:username,:userLastName, :document, :telephone, :userType, :status, :email, :password, :password_confirmation)
  end
  def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using 
    #our own "is_active" column
    super and self.status?
  end
end
