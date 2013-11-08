module ExtendConcerns
  extend ActiveSupport::Concern

  included do
    after_save do | extend |

      puts 'REPORTABLE'
      puts extend

      id = extend.id
      story = extend.story
      user = story.user
      followers = []
      story.followers.each do | follower |
        followers.push follower.user.id
      end
      body = extend.body[0..15] + "..."

      message = {
        id: id,
        body: body,
        story: {
          id: story.id,
          body: story.body[0..15] + "..."
        },
        owner: {
          id: user.id,
          email: user.email
        },
        followers: followers
      }
      
      REDIS.publish 'r-live', message.to_json
    end
  end
end
