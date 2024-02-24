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

# Services Overview

This document provides an overview of the development and production environments for Service1 and Service2. Each service is accessible via specific URLs mapped to external IP addresses and ports. Below is the detailed information regarding the URLs for each environment and service.

## Development Environment

### Service1 Dev

- **URL**: [http://34.69.221.201:30100/](http://34.69.221.201:30100/)

  Service1 in the development environment is designed for testing new features and updates before they are deployed to production. This environment is subject to frequent changes and updates as part of the development process.

### Service2 Dev

- **URL**: [http://35.192.189.98:30104/](http://35.192.189.98:30104/)

  Service2 in the development environment mirrors the setup of Service1 Dev, providing a platform for development and testing. It's crucial for integrating and testing interactions between Service1 and Service2 in a simulated production-like environment.

## Production Environment

### Service 1 Prod

- **URL**: [http://34.31.9.37:30101/](http://34.31.9.37:30101/)

  Service1 in the production environment is the live version used by end-users. This environment is optimized for stability and performance, with updates carefully rolled out to ensure uninterrupted service.

### Service 2 Prod

- **URL**: [http://34.41.166.20:30103/](http://34.41.166.20:30103/)

  Service2 Prod operates alongside Service1 Prod, providing critical services to end-users. Like Service1 Prod, this environment prioritizes reliability and user experience, with changes and updates thoroughly tested before deployment.

## Accessing the Services

The services can be accessed directly via their URLs. Note that these URLs point to external IP addresses and specific ports corresponding to each service and environment. These services are intended for specific use cases:

- **Development URLs** are for testing and development purposes. Features in these environments are not final and may change.
- **Production URLs** are stable and reflect the services offered to end-users.

## Cluster Estimated Cost Report

Based on the machine type (`e2-medium`) and cluster configuration (5 nodes), here's a mini cost report:

**GKE Cluster Cost Report**

- **Machine Type**: e2-medium (2 vCPUs, 4 GB memory)
- **Region**: us-central1
- **Hourly Cost per Node**: $0.0335
- **Monthly Cost per Node**: $24.46
- **Total Nodes in Cluster**: 5

**Monthly Cluster Cost Estimate**:
- **Total Hourly Cost**: $0.0335 * 5 = $0.1675
- **Total Monthly Cost**: $24.46 * 5 = $122.30

This estimate provides a baseline for the monthly operational costs of running a standard GKE cluster with five e2-medium nodes in the us-central1 region. For precise billing and potential discounts or additional network and storage costs, consult the GCP billing dashboard or the [Google Cloud Pricing Calculator](https://cloud.google.com/products/calculator).

## Challenges
- The service 2 returns no responds so pong return a Service is not available. I exec into the pod and made a request to the base url and got a response.
- Spinning up GKE cluster requires some cost estimation as i needed to add my details sinc ei used up my 300 bucks, lol (Not an issue though)

---
