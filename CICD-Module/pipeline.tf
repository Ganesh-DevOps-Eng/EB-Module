resource "aws_codepipeline" "codepipeline" {
  name     = "my-codepipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.s3_location # Replace with your S3 bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["SourceOutput"]

      configuration = {
        Owner      = var.Owner
        Repo       = var.Repo  
        Branch     = var.Branch  
        OAuthToken = var.OAuthToken
      }

    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "DeployAction"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      version         = "1"
      input_artifacts = ["SourceOutput"]

      configuration = {
        ApplicationName = "your-codedeploy-application-name"
        DeploymentGroupName = "your-codedeploy-deployment-group-name"
      }
    }
  }
}