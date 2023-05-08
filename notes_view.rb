class NotesView
  def list(notes)
    notes.each do |note|
      puts note
    end 
  end

  def show(note)
    puts note
  end

  def form(note)
    print "> name: "
    note.name = gets.chomp
    print "> desc: "
    note.desc = gets.chomp
    note
  end
end