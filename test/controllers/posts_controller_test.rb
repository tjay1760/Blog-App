test 'should create post' do
  assert_difference('Post.count') do
    post posts_url,
         params: {
           post: {
             AuthorId: @post.AuthorId,
             CommentsCounter: @post.CommentsCounter,
             CreatedAt: @post.CreatedAt,
             LikesCounter: @post.LikesCounter,
             Text: @post.Text,
             Title: @post.Title,
             UpdatedAt: @post.UpdatedAt
           }
         }
  end

  assert_redirected_to post_url(Post.last)
end

test 'should update post' do
  patch post_url(@post),
        params: {
          post: {
            AuthorId: @post.AuthorId,
            CommentsCounter: @post.CommentsCounter,
            CreatedAt: @post.CreatedAt,
            LikesCounter: @post.LikesCounter,
            Text: @post.Text,
            Title: @post.Title,
            UpdatedAt: @post.UpdatedAt
          }
        }
  assert_redirected_to post_url(@post)
end
