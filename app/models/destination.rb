class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked_post
        most_liked = self.posts.max {|post_a, post_b| post_a.likes <=> post_b.likes}
    end

    def most_recent_posts
        five_posts = self.posts.order(created_at: :desc).limit(5)
    end

    def average_age
        bloggers_ages = self.bloggers.uniq.map {|blogger| blogger.age}
        total_age = bloggers_ages.inject {|sum, age| sum + age}
        avg_age = total_age / bloggers_ages.size
    end
end
