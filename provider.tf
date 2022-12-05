terraform {

    
    
    required_version = "~> 1.3"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.14.0"  
        }

        kubernetes = {
            source = "hashicorp/kubernetes"
            version = "~> 2.12.1"
        }

        random = {
            source = "hashicorp/random"
            version = "~> 3.1.0" 
        }
    }
}


