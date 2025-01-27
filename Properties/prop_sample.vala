public class PropertyDemo : Object {

    /* Property-backing fields */

    private string _name;
    private string _read_only;

    /* Properties */

    public string automatic { get; set; }

    public string name {
        get { return _name; }
        set { _name = value; }
    }

    public string read_only {
        get { return _read_only; }
    }

    public PropertyDemo (string name) {
        this.automatic = "InitialAutomatic";
        _name = name;
        _read_only = "InitialReadOnly";
    }
    
}

void main () {
    var demo = new PropertyDemo ("InitialName");

    // Every class derived from 'Object' has a 'notify' signal that gets
    // emitted every time a property changes
    demo.notify.connect ((s, p) => {
        stdout.printf ("property '%s' has changed!\n", p.name);
    });

    demo.automatic = "TheNewAutomatic";
    demo.name = "TheNewName";

    // The following statement would be rejected:
    // demo.read_only = "TheNewReadOnly";

    stdout.printf ("automatic: %s\n", demo.automatic);
    stdout.printf ("name: %s\n", demo.name);
    stdout.printf ("read_only: %s\n", demo.read_only);
	
	var obj_class = (ObjectClass) typeof (PropertyDemo).class_ref ();
    var properties = obj_class.list_properties ();
    foreach (var prop in properties) {
        stdout.printf ("Property: %s\n", prop.name);
    }
}
