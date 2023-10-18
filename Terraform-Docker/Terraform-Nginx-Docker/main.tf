
# Docker-Provider konfigurieren
provider "docker" {}

# Docker-Image-Ressource erstellen
# Hier erstellt eine Terraform-Ressource für das Docker-Image
resource "docker_image" "nginx-image" {
    # Image "nginx:latest" aus dem Docker-Repository verwenden
    name = "nginx:latest"
}

# Erstellen eine Ressource für den Docker-Container. 
# wird das zuvor definierte Docker-Image ("nginx-image") als Grundlage verwendet. 
# Der Container wird den Namen "nginx"
# Docker-Container-Ressource erstellen

resource "docker_container" "nginx" {
                                            # Das zuvor erstellte Docker-Image als Grundlage verwenden
    image = docker_image.nginx-image.name
                                            # Den Container "nginx" nennen
    name = "nginx"
                                            # Den internen Port 80 auf den externen Port abbilden (externer Port wird über eine Variable festgelegt)
    ports {
        internal = 80
        external = var.external_port
        protocol = "tcp"
    }
}


output "url" {
    description = "Browser URL for Container site"
                                                    # Die URL wird in der Form "http://localhost:PORT", 
                                                    # wobei der PORT von der Variable "external_port" abhängt
    value = join(":", ["http://localhost", tostring(var.external_port)])
}

# Nachdem du dieses Terraform-Skript ausgeführt hast, wird Terraform versuchen, das Nginx-Image zu ziehen, 
# einen Container auf Basis dieses Images erstellen und dann die URL für den Container anzeigen.











# Variable "external_port" definieren
variable "external_port" {
    # Typ der Variable ist eine Zahl (number)
    type = number
    # Standardwert ist 5000, wenn kein Wert angegeben wird
    default = 5000
    # Validierung: Der Wert muss 5000 oder 80 sein, ansonsten wird ein Fehler ausgelöst
    validation {
        condition = can(regex("5000|80", var.external_port))
        error_message = "port values can only be 5000 or 80."
    }
}
