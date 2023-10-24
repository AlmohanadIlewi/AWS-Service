
# Schriebe die definition für dein das aws Profil und die Region in die variables.tf
terraform {

    required_version = ">= 1.0" # Wir wollen mindestens terraform version 1.0 verwenden

required_providers {

    aws = {                    # Der AWS Provider ermöglicht es AWS Resourcen zu erstellen
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
}
}

provider "aws" {
region     = "eu-central-1"
access_key = "ASIAZB3E7DBMTOTMXHVS"
secret_key = "OfNKAGLmBsMnA44moqEbS+hQC0c46he8AF1EiAF3"
token      = "IQoJb3JpZ2luX2VjECIaDGV1LWNlbnRyYWwtMSJGMEQCIAegDB6p/XcXOO83MrQ/WzAb3zHp2xBd//dmnlS5meCUAiAIKZInKPEOm6faZH13VVwq3P+yCvvziJGLIkYS6GdV+yqgAwhLEAAaDDYyMjQ0NTE0MDA1NyIM4FpLgTU/iEh/LaZWKv0CPrXjy5V7LIPkaGy4ovjlt2GsBDMIVFh8J8vyP/lvcJ5sdAXyH5z6CHyIzQgluGzS1mPKlSN4T1VIl9N3fPwViijsucLOkwFyr8MSQFME/WpvrvU9YrHKD118knbaw/e85QbiZNIheQt8c9B5gluek4jdsuwhWQcP9l15srw2SUbv0+GEB2S4/XiXWwL3QFbqwWjZDifK3eRvMZfgphVfI1VL7Fa9PgFI54anicEb9Lx0p3W6ORgGW2n48y1n4g/b7yPjbLXb2T4fPs0pc5mcaJHH11Z/K/8cBZj3XguaAASpDRAL4wdXsJq7AxoS8ERzErtdb4GVnpsEZUoER2CZwh2LAd4IMDCW1R3ro9g7Z4R1WM+WdEEHrn1qmKY+d0STEF8jfJwfnPY++XKHByVuBRj+EyKUHyWqZsYGtNtcj8WeCd9zzUANQVbeb8duGRKv66crZ6xB1v3rAHj9aN/C5Dq7dwJ+0eX1EsZ8nkUMDsNi41dVr9on5lEN+k0tMMyF4KkGOqcB8pWV7yxL6tEy1mnsVQtHQP2fR/bc5mekbJaVpOureGMq3hsf4hmlM4Rg+bt4uzP7C+PoBOWHn9HsDhS3CFHSEFHF1pBO+rkn626UocOsqM4lFP/FMm2MlpiqinVyhqPbx6dGwPDhYkTpwd7OtOaaDXuK+o2efwAfFBXzUZfI/JurQ0ITeFmcN/4XW9C5DJ0F1deFw4xp+T9e63OP1q9c6snqUvpxubo="
}