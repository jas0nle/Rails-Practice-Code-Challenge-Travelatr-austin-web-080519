class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 30}

    def total_likes
        posts_likes = self.posts.map {|post| post.likes}
        posts_likes.inject {|sum, n| sum + n}
    end

    def most_liked_post
        most_liked = self.posts.max {|post_a, post_b| post_a.likes <=> post_b.likes}
    end
end
