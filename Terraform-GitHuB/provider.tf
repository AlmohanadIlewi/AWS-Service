terraform {

    required_providers {
        github = {
            source = "integrations/github"
            version = "5.40.0"
    }
}
}


# Configure the GitHub Provider 
provider "github" {
    token = "xxxxxxx"
}
