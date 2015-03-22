class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
 validates :nick_name, presence: true, length: {minimum: 2, maximum: 10},
          uniqueness: {case_sensitive: false}

end
