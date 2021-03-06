class Todo < ApplicationRecord
    validates :content, presence: true,
                    length: { minimum: 5 }

    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end

    def all_tags
        self.tags
    end
end
