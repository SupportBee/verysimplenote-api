class Content < ApplicationRecord
  # @todo Do away with the +optional+ option
  belongs_to :parent, polymorphic: true, optional: true
end
