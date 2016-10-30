class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    sum = 0
    notes = subject_item_notes.where(subject_item: subject_item).each do |note|
      sum += note.value
    end

    average = sum.to_f/notes.length
    notes.length == 0 ? '0.00' : "#{format("%.2f", average)}"
  end
end
