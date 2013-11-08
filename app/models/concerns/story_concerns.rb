module StoryConcerns
  extend ActiveSupport::Concern

  included do
    after_save do | story |

      puts 'REPORTABLE STORY'
      puts story

      id = story.id
      user = story.user
      body = story.body[0..15] + "..."

      message = {
        id: id,
        body: body,
        owner: {
          id: user.id,
          email: user.email
        },
        emit: 'new_story'
      }
      
      REDIS.publish 'r-live', message.to_json
    end
  end
end
