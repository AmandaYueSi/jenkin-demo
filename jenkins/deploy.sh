#!/bin/bash
echo "Deploy application ..."

java -jar /var/lib/jenkins/workspace/jenkin-demo-1_multi-env-pipeline/target/jenkin-demo-0.0.1-SNAPSHOT.jar

echo "Deployment complete!"
