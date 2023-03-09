class Article<ApplicationRecord
validates:title,presence:true
validates:description,presence:true
belongs_to :user
after_update :abc
after_save :abc
def abc
    puts "-----This is sample branch-----"
end
Article.skip_callback(:save, :after, :abc)
end