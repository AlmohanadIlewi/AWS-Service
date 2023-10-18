
# Definition der Variable "external_port"
variable "external_port" {
    # Typ der Variable ist eine Zahl (number)
    type = number

    # Standardwert ist 8080, falls kein Wert angegeben wird
    default = 8080

    # Validierung: Überprüfen, ob der Wert entweder 8080 oder 80 ist
    validation {
        condition = can(regex("8080|80", var.external_port))

        # Fehlermeldung, die angezeigt wird, wenn die Validierung fehlschlägt
        error_message = "port values can only be 8080 or 80."
    }
}
