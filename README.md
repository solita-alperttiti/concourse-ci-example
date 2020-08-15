# Concource CI Example

This is simple example project to show one way to use Concource CI. This pipeline just builds couple of dummy docker
images and then pushes images to Docker Hub. Pipeline template is using runtime variables, so different pipelines
can be created just by adding different variable files into the project.

More information about Concource CI can be found from https://concourse-ci.org/  

#### Pre-requirements

- docker
- docker-compose

#### Getting started

1. Generate keys by executing in concource/keys/ `./generate.sh`
2. Start Concource by executing in concource/ `docker-compose up`
3. Install fly cli ( more info from https://concourse-ci.org/fly.html )
4. Login with fly `fly --target concource-example login --concourse-url http://localhost:8080`
5. Create pipeline A `fly -t concource-example set-pipeline -p concource-example-pipeline-a -c concource/pipelines/concource-example/concource-example-pipeline.yml --load-vars-from concource/variables/runtime_variables_a.yml`
6. Create pipeline B `fly -t concource-example set-pipeline -p concource-example-pipeline-b -c concource/pipelines/concource-example/concource-example-pipeline.yml --load-vars-from concource/variables/runtime_variables_b.yml`
7. Provide your Docker Hub Credentials for local pipeline
8. Push something into Git or trigger build from GUI

**PLEASE NOTICE** CONCOURCE_ENCRYPTION_KEY in *ci_encryption_key.env* is not very secret, because it is in public repository. So, don't use it in any real contexts.


#### Execute single task

`fly -t concource-example execute -p --config concource/pipelines/concource-example/concource-example-build.yml --input concource-example=./`

#### Log stream with fly

`fly -t concource-example watch -j concource-example-pipeline-a/build-and-publish`

#### Start/Stop Concourse

- `docker-compose up` in concource/
- `docker-compose down` in concource/

