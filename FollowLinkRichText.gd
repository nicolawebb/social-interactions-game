extends RichTextLabel

signal link_followed

func _ready():
    connect("meta_clicked", self, "meta_clicked");

func meta_clicked(meta):
    OS.shell_open(meta);
    
    emit_signal("link_followed")
