class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  				  :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                             with: /^[a-zA-Z0-9_-]+$/,
                             message: "must be formatted correctly."
                           }
  has_many :statuses


  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
    
    stripped_email = email.strip
    downcased_email = stripped_email.downcase
    hash = Digest::MD5.hexdigest(downcased_email)
    "http://gravatar.com/avatar/#{hash}"
  end

  def gravatar_for(user, options = {})
  options = { :size => 50 }.merge(options)
  options[:default] = "http://www.iconfinder.com/ajax/download/png/?id=43350&s=#{options[:size]}"
  options[:default] = image_tag("default_gravatar_#{options[:size]}.png
  gravatar_image_tag(user.email.downcase,
                     :alt => user.full_name,
                     :class => 'gravatar',
                     :gravatar => options")

end



end
