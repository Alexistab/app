class Comment < ApplicationRecord
  belongs_to :usser
  belongs_to :article
end
