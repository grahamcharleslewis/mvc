require_relative "note_model"
require_relative "notes_view"

class NotesController
  attr_reader :models, :view 

  def initialize
    @models = []
    @view = NotesView.new
  end 
  
  def index 
    view.list(models)
  end

  def show(id)
    view.show(fetch_note(id))
  end 

  def new 
    note = view.form(NoteModel.new)
    create(note)
  end 

  def create(note)
    note.id = next_id
    models << note
  end 

  def edit(id)
    note = fetch_note(id)
    note = view.form(note)
    update(note)
  end 

  def update(note)
  end 

  def destroy(id)
    models.each_with_index do |note, index|
      models.delete_at(index) if note.id == id
    end
  end

private 

  def fetch_note(id)
    models.find { |note| note.id == id }
  end

  def next_id
    id = 1
    last_id = 0
    last_id = models.last.id.to_i if models.any?
    id = id + last_id
    id.to_s
  end 
end 