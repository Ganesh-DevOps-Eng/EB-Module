resource "aws_codepipeline" "cicd_pipeline" {
  name     = "${var.project_name}-cicd_pipeline"
  role_arn = aws_iam_role.codepipeline_service_role.arn

  artifact_store {
    location = var.s3_location
    type     = "S3"
  }

stage {
    name = "Source"

    action {
      name             = "SourceAction"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["SourceArtifact"]
      configuration = {
        S3Bucket         = var.source_bucket
        S3ObjectKey      = var.source_object_key
        PollForSourceChanges  = true
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "BuildAction"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      configuration = {
        ProjectName = "${var.project_name}-codebuild-stage"
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "DeployAction"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "ElasticBeanstalk"
      version         = "1"
      input_artifacts = ["BuildArtifact"]
      configuration = {
        ApplicationName = "${var.project_name}-eb-app"
        EnvironmentName = "${var.project_name}-eb-env"
      }
    }
  }
}


