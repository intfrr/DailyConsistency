class Note < ActiveRecord::Base
  validates :date, presence: true

  def self.get_note(options = { day: note_date, user: current_user_id })
    @note = Note.find_by(date: options[:day].to_datetime, user_id: options[:user])
    @note.nil? ? Note.create(date: Date.today.to_datetime, user_id: options[:user]) : @note
  end

  def show_date
    date.strftime("%D")
  end
end