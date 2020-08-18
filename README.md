# Concourse CI Example

This is simple example project to show one way to use Concourse CI. This pipeline just builds couple of dummy docker
images and then pushes images to Docker Hub. Pipeline template is using runtime variables, so different pipelines
can be created just by adding different variable files into the project.

My blog post about this project can be found from https://dev.solita.fi/2020/08/17/creating-your-ci-cd-pipeline-with-concourse.html

More information about Concourse CI can be found from https://concourse-ci.org/  

#### Pre-requirements

- docker
- docker-compose

#### Getting started

1. Generate keys by executing in concourse/keys/
   
   ```./generate.sh```
   
2. Start Concourse by executing in concourse/
   
   ```docker-compose up```
   
3. Install fly cli ( more info from https://concourse-ci.org/fly.html )
   
4. Login with fly
   
   ```fly --target concourse-example login --concourse-url http://localhost:8080```
   
5. Create pipeline A
   
   ```fly -t concourse-example set-pipeline -p concourse-example-pipeline-a -c concourse/pipelines/concourse-example/concourse-example-pipeline.yml --load-vars-from concourse/variables/runtime_variables_a.yml```
   
6. Create pipeline B
   
   ```fly -t concourse-example set-pipeline -p concourse-example-pipeline-b -c concourse/pipelines/concourse-example/concourse-example-pipeline.yml --load-vars-from concourse/variables/runtime_variables_b.yml```
   
7. Provide your Docker Hub Credentials for local pipeline
   
8. Push something into Git or trigger build from GUI

**PLEASE NOTICE** CONCOURSE_ENCRYPTION_KEY in *ci_encryption_key.env* is not very secret, because it is in public repository. So, don't use it in any real contexts.

![](concourse_example_pipeline.png)

#### Execute single task

```fly -t concourse-example execute -p --config concourse/pipelines/concourse-example/concourse-example-build.yml --input concourse-example=./```

#### Log stream with fly

```fly -t concourse-example watch -j concourse-example-pipeline-a/build-and-publish```

#### Start/Stop Concourse

- ```docker-compose up``` in concourse/
- ```docker-compose down``` in concourse/



My blog post about this project can be found from https://dev.solita.fi/2020/08/17/creating-your-ci-cd-pipeline-with-concourse.html

More information about Concourse CI can be found from https://concourse-ci.org/  
