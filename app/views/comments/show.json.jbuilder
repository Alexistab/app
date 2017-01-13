json.id @comment.id
json.usser_id @comment.usser_id
json.article_id @comment.article_id
json.body @comment.body
json.created_at @comment.created_at
json.updated_at @comment.updated_at
json.usser do
  json.email @comment.usser.email
end
