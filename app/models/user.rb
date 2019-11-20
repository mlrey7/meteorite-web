class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :microposts, dependent: :destroy

  def get_posts
    # active_following = Relationship.where(follower_id: self[:id])
    ids = [self[:id]]
    # active_following.each do |relation|
    #   ids.push relation.followed_id 
    # end
    posts = Micropost.where user_id: ids
    return posts
  end
end
