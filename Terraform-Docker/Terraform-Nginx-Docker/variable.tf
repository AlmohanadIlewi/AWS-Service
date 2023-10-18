
# Definition der Variable "external_port"
variable "external_port" {
    # Typ der Variable ist eine Zahl (number)
    type = number

    # Standardwert ist 5000, falls kein Wert angegeben wird
    default = 5000

    # Validierung: Überprüfen, ob der Wert entweder 5000 oder 80 ist
    validation {
        condition = can(regex("5000|80", var.external_port))

        # Fehlermeldung, die angezeigt wird, wenn die Validierung fehlschlägt
        error_message = "port values can only be 5000 or 80."
    }
}
