class Order < ApplicationRecord
include Statesman::Adapters::ActiveRecordQueries
  belongs_to :shipping_type
  has_many :line_items
  has_one :address
  has_many :transition, class_name: "OrderTransition", autosave: false

  accepts_nested_attributes_for :address

  delegate :can_transition_to?,
  :current_state, :history, :last_transition, :last_transition_to,
  :transition_to!, :transition_to, :in_state?, to: :state_machine
end 

  def state_machine
    @state_machine ||= OrderStateMachine.new(self, transition_class: OrderTransition,
                                                   association_name: :transitions)
  end

  def full_cost
    line_items.map { |e| e.full_price }.sum + shipping_cost
  end

  def self.transition_class
    OrderTransition
  end

  def self.initial_state
    OrderStateMachine.initial_state
  end

  def self.transition_name
    :transition
  end
end
