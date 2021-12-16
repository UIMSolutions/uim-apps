module uim.apps.forms.schema;

@safe:
import uim.apps;

// Contains the schema information for Form instances.
class DAPPSchema {
    this() {
        _fieldDefaults = [
        "type": "", "length": "", "precision": "", "default": ""];
    }
    // The fields in this schema.
    protected STRINGAA _fields;

    // The default values for fields.
    protected STRINGAA _fieldDefaults;

    /**
     * Add multiple fields to the schema.
     * @param array<string, array<string, mixed>|string> $fields The fields to add.
     * @return $this
     */
/*     public function addFields(array $fields) {
        foreach ($fields as $name => $attrs) {
            $this.addField($name, $attrs);
        }

        return $this;
    } */

    /**
     * Adds a field to the schema.
     * @param string $name The field name.
     * @param array<string, mixed>|string $attrs The attributes for the field, or the type
     *   as a string.
     * @return $this
     */
    /* public function addField(string $name, $attrs) {
        if (is_string($attrs)) {
            $attrs = ["type": $attrs];
        }
        $attrs = array_intersect_key($attrs, _fieldDefaults);
        _fields[$name] = $attrs + _fieldDefaults;

        return $this;
    } */

    /**
     * Removes a field to the schema.
     *
     * @param string $name The field to remove.
     * @return $this
     */
    /* public function removeField(string $name) {
        unset(_fields[$name]);

        return $this;
    } */

    /**
     * Get the list of fields in the schema.
     *
     * @return array<string> The list of field names.
     */
    /* public function fields(): array
    {
        return array_keys(_fields);
    } */

    /**
     * Get the attributes for a given field.
     *
     * @param string $name The field name.
     * @return array<string, mixed>|null The attributes for a field, or null.
     */
    /* public function field(string $name): ?array
    {
        return _fields[$name] ?? null;
    } */

    /**
     * Get the type of the named field.
     *
     * @param string $name The name of the field.
     * @return string|null Either the field type or null if the
     *   field does not exist.
     */
    /* string fieldType(string $name) {
        $field = $this.field($name);
        if (!$field) {
            return null;
        }

        return $field["type"];
    } */

    /**
     * Get the printable version of this object
     *
     * @return array<string, mixed>
     */
    /* public function __debugInfo(): array
    {
        return [
            "_fields": _fields,
        ];
    } */
}
