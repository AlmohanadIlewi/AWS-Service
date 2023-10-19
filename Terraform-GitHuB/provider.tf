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
    token = "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"
}
