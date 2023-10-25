
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
    region = var.region
    profile = var.aws_profile
    }

# provider "aws" {
# region     = "eu-central-1"
# access_key = "ASIAZB3E7DBM2BVXBJO7"
# secret_key = "5XhUpzAdAkJ20kFOns8MhSifVQimRjS11Jd9HiV1"
# token      = "IQoJb3JpZ2luX2VjEA4aDGV1LWNlbnRyYWwtMSJHMEUCIQCLYy5NQHyGiymMGcFqF3wlcsa2tBmIfdSm197Dp068eQIgDB1TcSHDNzvUEbk+rFIMRUB5hhqd1UDHqjehDYl5L7cqoAMINxAAGgw2MjI0NDUxNDAwNTciDCEVbKoRrl5qdz+F3ir9AlF4sVFuLRTSQr8lGMN5YD7tvmLzpNvmcpE4CZtqz/A04aWvjVLWVuPCT5XrR2nAL10CqyFgzGmYg0oXpdLhiqU42/PenzWvRyKHTx7J7SC0oGWgbEmGvZ9/DkkMC3EJrq76T92PtVYI2aeKcKydZOomhr1kI8u5WeYY3m6yuNmy/doa8ZWsY+N3TV5EQ+Iw6sFgnfo6OsVxUnAQooLXRBy0n1E221ZSu8KP+xz/6rvLtdJtHxiPuXHXVbdV+ThvG0/1cCRATELtsvc/FstBNwahojZjPEUH8xDZS/I48U2gE9XWDg/pfbo5dr4/LYJz47ONRa15qwk8w1W9ZD9BBnqnp6OO/1wfpEF+zTvBj+U0yj4fkFBU2AdgS7HXLGDwo3Jx/BS7VQCRM9xyJvxYm525vx58GpniWZLs536yNpdf6qGOXTTOuComPNr3FekXgb0cC44kFJSjw/E3/gwlHY1NUe/Y0QFmJAqDfeiQok/kJfKeiSP1kMTEmz8ppzD/0NupBjqmAe+O/4XVynDOMYWRJKgNvhfwpqsrD+iezDo3FZ/HT9qhl+spGcZLClkq5NpPfZbEtmDzzHE3m2jeL7LDIrIlYuPHj/UiNXwgNIzYt26pxK4Mp+jZYrEOtSP5sZdTNEeVsKghvUF+nXs6zOoa2opQ2XUMBALovl0t70R8Le7DGJrbc1lrc70XNdux2D+bdYehFgJDCS4kgTyzExOuzdGg6tDF52i1/w0="
# }