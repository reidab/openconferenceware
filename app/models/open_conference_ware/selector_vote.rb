module OpenConferenceWare

  # == Schema Information
  #
  # Table name: selector_votes
  #
  #  id          :integer          not null, primary key
  #  user_id     :integer          not null
  #  proposal_id :integer          not null
  #  rating      :integer          not null
  #  comment     :text
  #

  class SelectorVote < OpenConferenceWare::Base
    belongs_to :user
    belongs_to :proposal

    validates_presence_of :user
    validates_presence_of :proposal
    validates_presence_of :rating

    before_save :update_event_id

    private

    def update_event_id
      self.event_id = proposal.event.id if proposal.present?
    end
  end
end
