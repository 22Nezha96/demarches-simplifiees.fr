class GroupeInstructeur < ApplicationRecord
  DEFAULT_LABEL = 'défaut'
  belongs_to :procedure, -> { with_discarded }, inverse_of: :groupe_instructeurs
  has_many :assign_tos
  has_many :instructeurs, through: :assign_tos, dependent: :destroy
  has_many :dossiers
  has_and_belongs_to_many :exports

  validates :label, presence: { message: 'doit être renseigné' }, allow_nil: false
  validates :label, uniqueness: { scope: :procedure, message: 'existe déjà' }

  before_validation -> { label&.strip! }

  scope :without_group, -> (group) { where.not(id: group) }
  scope :for_api_v2, -> { includes(procedure: [:administrateurs]) }
end
