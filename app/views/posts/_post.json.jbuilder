json.extract! post, :id, :AuthorId, :Title, :Text, :CreatedAt, :UpdatedAt, :CommentsCounter, :LikesCounter,
              :created_at, :updated_at
json.url post_url(post, format: :json)
