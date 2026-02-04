# Project Context

## Tech Stack
- **Infrastructure**: AWS SAM, CloudFormation, AWS CDK
- **Compute**: Lambda (Python 3.13+), ECS/Fargate, EMR, Batch
- **Data**: S3 (data lakes), DynamoDB, SQS, Kinesis
- **Monitoring**: CloudWatch, SNS
- **Languages**: Python 3.13+ (type hints required), YAML, TypeScript

## Infrastructure Standards

### AWS SAM Templates
- Use parameterization for multi-environment support (dev/prod)
- Include CloudWatch alarms and SNS notifications when appropriate
- Always configure DLQ for SQS queues
- Tag all resources with Environment, Project, Owner

### Lambda Functions
- Python 3.13+ runtime (specify latest available)
- Type hints required for all functions
- Comprehensive error handling with structured logging
- Environment variables for all configuration
- Resource-based policies over IAM roles when possible

### Code Quality
- Comprehensive inline comments explaining "why" not just "what"
- Docstrings for all functions/classes
- Follow AWS Well-Architected Framework principles
- Cost-optimize by default (e.g., S3 lifecycle policies, appropriate Lambda memory)
- Include unit tests

## Data Science Conventions
- Use pandas for data manipulation
- Include data validation at ingestion points
- Document data schemas and transformations
- Version control for model artifacts (S3 with versioning)

## Documentation
- OpenAPI specs for all APIs
- README.md with architecture diagrams
- Include cost estimates for infrastructure
- Runbooks for operational tasks

## Preferences
- CLI-first approach for AWS operations
- Prefer AWS SAM over CDK for simple serverless apps
- Security: least privilege IAM, encryption at rest/transit
- Include monitoring and alerting in initial design
