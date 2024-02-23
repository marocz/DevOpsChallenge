# PLENO - DevOps Challenge

**Welcome to PLENO DevOps challenge!**

You will find 2 microservices built with Rust Actix-Web called

* Service1
* Service2

that play pingpong through a very simple `HTTP` request as follow:

* Service1 $\rightarrow$ GET method sends a request to `http://localhost:8081/pong`.
* Service2 $\rightarrow$ POST method sends the response "Pong from service2!" to `http://localhost:8080/ping`.

# How To

* I have given you the right to clone this repository. Afterwards, you need to push it to your own repository and share it with me.
* Don't forget to add or modify the codes related to the endpoints and CORS. These codes are written in:
  * Service 1 - `src/main.rs`
    * Line 19 - `match client.post("http://127.0.0.1:8081/pong").send().await`
    * Line 37 - `.allowed_origin("http://127.0.0.1:8081");`
  * Service 2 - `src/main.rs`
    * Line 18 - `.allowed_origin("http://127.0.0.1:8080");`

# The Tasks

The project structure is as follow:

```shell
DevOpsChallenge
├── .github/
    ├── workflows/
      ├── service1-cd.yaml        # Task 10
      ├── service1-ci.yaml        # Task 9
      ├── service1-ghcr.yaml      # Task 11
      ├── service2-cd.yaml        # Task 10
      ├── service2-ci.yaml        # Task 9
      ├── service2-ghcr.yaml      # Task 11
    ├── dependabot.yaml           # Task 13
├── microservice1/
    ├── docker/
        ├── docker-compose.yaml   # Task 4
        ├── Dockerfile.dev        # Task 2
        ├── Dockerfile.prod       # Task 3
    ├── kube/
        ├── k8.yaml               # Task 7
    ├── scripts/
        ├── gcloud.sh             # Task 12
    ├── src/
        ├── main.rs
    ├── Cargo.toml
    ├── codecov.yaml              # Task 8
├── microservice2/
    ├── docker/
        ├── docker-compose.yaml   # Task 4
        ├── Dockerfile.dev        # Task 2
        ├── Dockerfile.prod       # Task 3
    ├── kube/
        ├── k8.yaml               # Task 7
    ├── scripts/
        ├── gcloud.sh             # Task 12
    ├── src/
        ├── main.rs
    ├── Cargo.toml
    ├── codecov.yaml              # Task 8
├── .dockerignore                 # Task 6
├── .gitignore
├── .pre-commit-config.yaml       # Task 1
├── docker-compose.yaml           # Task 5
├── Makefile                      # Task 14
```

As mentioned in the project structure, your task is to implement the following:

* Task 1: Configure the pre-commit setup for both the CI and the development environment.
* Task 2: Create a docker image with 2 stages build with development environment: Build and Dev.
* Task 3: Create a docker image with 2 stages build with production environment: Build and Prod.
* Task 4: Create the docker compose setup for each service.
* Task 5: Create the docker compose fot the global setup.
* Task 6: List all modules/dirs that need to be excluded by Docker.
* Task 7: Configure the Kubernetes cluster.
* Task 8: Configure the Codecov setup for the testing analysis.
* Task 9: Create CI pipeline in Github Actions for the respective microservice, jobs: build, lint, and test.
* Task 10: Create CD pipeline in Github Actions for the respective microservice.
* Task 11: Create GHCR pipeline to create a Docker image and store it in Github Container Registry.
* Task 12: Configure the deployment script to Google Cloud Platform.
* Task 13: Configure the Dependabot script.
* Task 14: Configure the Makefile for both services.
* Task 15: Host both microservices in your own free tier GCPs and write the URLs in your `README.md`.
* Task 16: Create a report about your deployed app in GCP:
    * What services are used.
    * Current cost.
    * Projected cost.

# Submission

- [ ] You need to create a GitHub repository for the submission.
- [ ] I need to have permission to observe the repo and to download the artefact for local testing.
- [ ] Containerize both services with the network `pleno-network`.

# Setup Guide

### Start Server

To start both services start with the `service2` application:

```shell
$ cd service2
$ cargo install
$ cargo run
```

Once it is running got to `http://localhost:8081`. Then start another terminal and run

```shell
$ cd service1
$ cargo install
$ cargo run
```

Once both services are running, you will se the following message in each of the 2 endpoints:

* Service 1:
  * `http://localhost:8080/` => Hello world in service 1!
  * `http://localhost:8080/ping` => Pong from service2!
* Service 2:
  *  `http://localhost:8081/` => Hello world in service 2!

### Test Application

For testing, you just need to go into eachn service directoy and run the following:

```shell
cargo test
```

You will be seeing the following in your terminal:

```shell
❯ cargo test
   Compiling service2 v0.1.0 (/PATH/TO/service1)
    Finished test [unoptimized + debuginfo] target(s) in 0.72s
     Running unittests src/main.rs (target/debug/deps/service1-acf545c943eedeb7)

running 1 test
test tests::test_hello ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out; finished in 0.00s
```

# Last Words

I hope you can enjoy the challenge since these kind of tasks will be your bread and butter and please do it like how you want to do it since there will be no right and wrong.

Happy engineering!

---
