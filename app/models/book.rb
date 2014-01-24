# == Schema Information
#
# Table name: books
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  author       :string(255)
#  publisher    :string(255)
#  release_date :date
#  n_pages      :integer
#  image_url    :string(255)
#  isbn         :string(255)
#  description  :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Book < ActiveRecord::Base
  attr_accessible :author,
                  :title,
                  :publisher,
                  :release_date,
                  :n_pages,
                  :image_url,
                  :isbn,
                  :description
                  :user_id

  belongs_to :user

  validates :user_id, presence: true
  validates :title,  presence: true, length: { maximum: 100 }
  validates :author,  presence: true, length: { maximum: 50 }
  validates :publisher,  presence: true, length: { maximum: 100 }
  validates :image_url,  presence: true
  validates :isbn, presence: true, length: { minimum: 13, maximum: 13 }
  validates :description,  presence: true
 # validates_uniqueness_of :isbn

  default_scope order: 'books.created_at DESC'

end
